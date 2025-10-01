import json
import schemas.role as role
import schemas.podIdentityAssociation as podIdentityAssociation

observed_xr = option("params").oxr
_id = observed_xr.spec.id
_region = observed_xr.spec.region
_providerConfig = observed_xr.spec.providerConfigName
_tags = observed_xr.spec.tags or {}
_clusterId = observed_xr.spec.clusterId

# _id = "my-cluster"
# _region = "us-east-1"
# _providerConfig = "default"
# _tags = {}
# _clusterId = "my-cluster"

_cert_manager_assume_role_policy = json.encode({
    "Version": "2012-10-17",
    "Statement": [{
        "Effect": "Allow",
        "Principal": {"Service": "pods.eks.amazonaws.com"},
        "Action": [
            "sts:AssumeRole",
            "sts:TagSession"
        ]
    }]
})

_cert_manager_role_resource = role.RoleBlueprint {
    _name = "role-cert-manager-${_id}"
    _providerConfig = _providerConfig
    _assumeRolePolicyDocument = _cert_manager_assume_role_policy
    _description = "Pod Identity role for cert-manager in EKS cluster"
    _tags = _tags | {
        Name = _name
    }
}

_pod_identity_association_resource = podIdentityAssociation.PodidentityassociationBlueprint {
    _name = "pod-identity-association-cert-manager-${_id}"
    _clusterName = _clusterId
    _disableSessionTags = False
    _namespace = "cert-manager"
    _region = _region
    _roleArnRef = {
        name = _cert_manager_role_resource._name
    }
    _serviceAccount = "cert-manager"
    _tags = _tags | {
        Name = _name
    }
    _providerConfig = _providerConfig
}

items = [
    _cert_manager_role_resource,
    _pod_identity_association_resource
]