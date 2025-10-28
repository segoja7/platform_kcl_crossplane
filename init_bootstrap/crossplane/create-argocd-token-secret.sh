#!/usr/bin/env bash
set -euo pipefail

# This script is adapted from the following repository:
# https://github.com/jonashackt/crossplane-argocd/blob/main/create-argocd-api-token-secret.sh
#
# It has been modified to run from a local machine, dynamically discovering
# the remote cluster's kubeconfig and the ArgoCD Ingress hostname from the
# management cluster's Crossplane resources. It also generates the ArgoCD
# ProviderConfig from a template.
# The script takes care of everything: it discovers the IPs, 
# generates the token, creates the credentials secret 
# and generates and applies the ArgoCD ProviderConfig with the correct address.

# --- Prerequisites ---
# - `kubectl` context is pointing to the Crossplane management cluster.
# - `jq`, `curl`, and `kubectl` are installed locally.

# --- Script Usage ---
if [ -z "${1-}" ]; then
  echo "Usage: $0 <claim-name>"
  echo "Example: $0 xcluster-example-segoja7"
  exit 1
fi

CLAIM_NAME=$1
REMOTE_KUBECONFIG_SECRET_NAME="eks-cluster-${CLAIM_NAME}"
INGRESS_OBJECT_NAME="argocd-ingress" # The name of the Crossplane Object for the Ingress

echo "### Preparing ArgoCD API Token and ProviderConfig for claim '${CLAIM_NAME}' ###"

# --- Step 1: Discover information from Management Cluster ---
echo "--- Fetching remote kubeconfig from Secret '${REMOTE_KUBECONFIG_SECRET_NAME}'..."
TEMP_KUBECONFIG=$(mktemp)
if ! kubectl get secret "${REMOTE_KUBECONFIG_SECRET_NAME}" -n default -o jsonpath='{.data.kubeconfig}' > /dev/null 2>&1; then
    echo "Error: Secret '${REMOTE_KUBECONFIG_SECRET_NAME}' not found in 'default' namespace of management cluster."
    exit 1
fi
kubectl get secret "${REMOTE_KUBECONFIG_SECRET_NAME}" -n default -o jsonpath='{.data.kubeconfig}' | base64 -d > "${TEMP_KUBECONFIG}"
trap 'echo "--- Cleaning up temporary kubeconfig..."; rm -f -- "$TEMP_KUBECONFIG"' EXIT

echo "--- Fetching ArgoCD hostname from Crossplane Object '${INGRESS_OBJECT_NAME}'..."
if ! kubectl get objects.kubernetes.crossplane.io "${INGRESS_OBJECT_NAME}" > /dev/null 2>&1; then
    echo "Error: Crossplane Object '${INGRESS_OBJECT_NAME}' not found in management cluster."
    exit 1
fi
ARGOCD_SERVER_HOST=$(kubectl get objects.kubernetes.crossplane.io "${INGRESS_OBJECT_NAME}" -o jsonpath='{.spec.forProvider.manifest.spec.rules[0].host}')
if [ -z "$ARGOCD_SERVER_HOST" ]; then
    echo "Error: Could not find hostname in Crossplane Object '${INGRESS_OBJECT_NAME}'."
    exit 1
fi
echo "--- ArgoCD server hostname discovered: https://${ARGOCD_SERVER_HOST}"

# --- Step 2: Interact with Remote Cluster ---
echo "--- Fetching ArgoCD admin password from remote cluster..."
ARGOCD_ADMIN_SECRET=$(KUBECONFIG="${TEMP_KUBECONFIG}" kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)
if [ -z "$ARGOCD_ADMIN_SECRET" ]; then
    echo "Error: Could not retrieve 'argocd-initial-admin-secret' from remote cluster. Is ArgoCD running?"
    exit 1
fi

# --- Step 3: Generate Token via ArgoCD API ---
echo "--- Generating temporary JWT session token..."
ARGOCD_ADMIN_TOKEN=$(curl -s -X POST -k -H "Content-Type: application/json" --data '{"username":"admin","password":"'"$ARGOCD_ADMIN_SECRET"'"}' "https://${ARGOCD_SERVER_HOST}/api/v1/session" | jq -r .token)
if [ -z "$ARGOCD_ADMIN_TOKEN" ] || [ "$ARGOCD_ADMIN_TOKEN" == "null" ]; then
    echo "Error: Failed to get temporary session token from ArgoCD. Check DNS and Ingress status."
    exit 1
fi

echo "--- Generating long-lived API Token for 'provider-argocd' user..."
ARGOCD_API_TOKEN=$(curl -s -X POST -k -H "Authorization: Bearer $ARGOCD_ADMIN_TOKEN" -H "Content-Type: application/json" "https://${ARGOCD_SERVER_HOST}/api/v1/account/provider-argocd/token" | jq -r .token)
if [ -z "$ARGOCD_API_TOKEN" ] || [ "$ARGOCD_API_TOKEN" == "null" ]; then
    echo "Error: Failed to create API token. Ensure 'accounts.provider-argocd: apiKey' is set in argocd-cm."
    exit 1
fi

# --- Step 4: Create Secret and ProviderConfig in Management Cluster ---
echo "--- Creating/updating 'argocd-credentials' secret in 'crossplane-system' namespace..."
kubectl create secret generic argocd-credentials -n crossplane-system --from-literal=authToken="$ARGOCD_API_TOKEN" --dry-run=client -o yaml | kubectl apply -f -

echo "--- Generating ProviderConfig from template..."
# Use sed to replace the placeholder in the template file.
sed "s|__ARGOCD_SERVER_ADDR__|${ARGOCD_SERVER_HOST}|g" "init_bootstrap/argocd-providerconfig.yaml.tpl" > "init_bootstrap/argocd-providerconfig.yaml"

echo "--- Applying generated argocd-providerconfig.yaml..."
kubectl apply -f "init_bootstrap/argocd-providerconfig.yaml"

echo "--- Successfully created/updated the ArgoCD credentials secret and ProviderConfig."
echo "### Process Complete! ###"
