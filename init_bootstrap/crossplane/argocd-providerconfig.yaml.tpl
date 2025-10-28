apiVersion: argocd.crossplane.io/v1alpha1
kind: ProviderConfig
metadata:
  name: argocd-provider
spec:
  # This address is dynamically inserted by the script
  serverAddr: "__ARGOCD_SERVER_ADDR__:443"
  insecure: true
  credentials:
    source: Secret
    secretRef:
      namespace: crossplane-system
      name: argocd-credentials
      key: authToken
