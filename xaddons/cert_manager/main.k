import json

# Get inputs with safe defaults
observed_xr = option("params").oxr or {}
_id = observed_xr.spec?.id or "default-id"
_providerConfig = observed_xr.spec?.providerConfigName or "segoja7"
_clusterClaimName = observed_xr.spec?.clusterClaimName or ""

# Request extra resources siguiendo el patrón del test
extraResourcesRequest = {
    apiVersion: "meta.krm.kcl.dev/v1alpha1",
    kind: "ExtraResources",
    metadata: {
        annotations: {
            "krm.kcl.dev/composition-resource-name": "extra-resources-request"
        }
    },
    requirements: {
        ekscluster: {
            apiVersion: "eks.aws.crossplane.io/v1beta1",
            kind: "Cluster",
            matchLabels: {
                "claim-name": _clusterClaimName
            }
        }
    }
}

# Get extra resources
er = option("params").extraResources or {}
_cluster_name = "NO_CLUSTER_FOUND"

# Check if extra resources were returned
if "ekscluster" in er and er.ekscluster:
    clusters = er.ekscluster
    if clusters and len(clusters) > 0:
        cluster = clusters[0].Resource if "Resource" in clusters[0] else clusters[0]
        _cluster_name = cluster.get("metadata", {}).get("name", "UNNAMED_CLUSTER")

# Crear role simple con valor del cluster
cert_manager_role = {
    "apiVersion": "iam.aws.crossplane.io/v1beta1",
    "kind": "Role",
    "metadata": {
        "annotations": {
            "crossplane.io/external-name": "cert-manager-role-{}".format(_id),
            "crossplane.io/composition-resource-name": "cert-manager-role"
        }
    },
    "spec": {
        "forProvider": {
            "assumeRolePolicyDocument": json.encode({
                "Version": "2012-10-17",
                "Statement": [{
                    "Effect": "Allow",
                    "Principal": {"Service": "ec2.amazonaws.com"},
                    "Action": "sts:AssumeRole"
                }]
            }),
            "description": "Role for cluster: {}".format(_cluster_name)
        },
        "providerConfigRef": {
            "name": _providerConfig
        }
    }
}

# Return only the role - ExtraResources is just for internal request
items = [cert_manager_role]
