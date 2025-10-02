import json
import schemas.role as role
import schemas.rolePolicyAttachment as rolePolicyAttachment

observed_xr = option("params").oxr
_id = observed_xr.spec.id
_providerConfig = observed_xr.spec.providerConfigName
_tags = observed_xr.spec.tags or {}
_clusterId = observed_xr.spec.clusterId
_accountId = observed_xr.spec.accountId

# Get OIDC issuer URL from cluster
_ocds = option("params").ocds or {}
_cluster_name = "eks-cluster-${_clusterId}"
_oidc_issuer_url = _ocds[_cluster_name]?.Resource?.status?.atProvider?.identity?.oidc?.issuer or ""
_oidc_path = _oidc_issuer_url.replace("https://", "") if _oidc_issuer_url else ""

_cert_manager_assume_role_policy = json.encode({
    "Version": "2012-10-17",
    "Statement": [{
        "Effect": "Allow",
        "Principal": {
            "Federated": "arn:aws:iam::${_accountId}:oidc-provider/${_oidc_path}"
        },
        "Action": "sts:AssumeRoleWithWebIdentity",
        "Condition": {
            "StringEquals": {
                "${_oidc_path}:sub": "system:serviceaccount:cert-manager:cert-manager",
                "${_oidc_path}:aud": "sts.amazonaws.com"
            }
        }
    }]
})

_cert_manager_policy = json.encode({
    "Version": "2012-10-17",
    "Statement": [{
        "Effect": "Allow",
        "Action": [
            "route53:GetChange",
            "route53:ChangeResourceRecordSets",
            "route53:ListResourceRecordSets"
        ],
        "Resource": "arn:aws:route53:::hostedzone/*"
    }, {
        "Effect": "Allow", 
        "Action": "route53:ListHostedZonesByName",
        "Resource": "*"
    }]
})

_cert_manager_role_resource = role.RoleBlueprint {
    _name = "role-cert-manager-${_id}"
    _providerConfig = _providerConfig
    _assumeRolePolicyDocument = _cert_manager_assume_role_policy
    _description = "IRSA role for cert-manager"
    _tags = _tags | {
        Name = _name
    }
}

_cert_manager_policy_attachment_resource = rolePolicyAttachment.RolepolicyattachmentBlueprint {
    _name = "cert-manager-policy-${_id}"
    _providerConfig = _providerConfig
    _roleName = _cert_manager_role_resource._name
    _policyArnSelector = {
        matchControllerRef = True
    }
}

items = [
    _cert_manager_role_resource,
    _cert_manager_policy_attachment_resource
]
