import json
import schemas.role as role
import schemas.rolePolicyAttachment as rolePolicyAttachment
import schemas.kmsKey as kmsKey
import schemas.eksCluster as eksCluster


observed_xr = option("params").oxr
_id = observed_xr.spec.id
_region = observed_xr.spec.region
_providerConfig = observed_xr.spec.providerConfigName or "default"
_tags = observed_xr.spec.tags or {}
_encryptCluster = observed_xr.spec.encryptCluster or False
_accountId = observed_xr.spec.accountId or "account_id_not_set"



_cluster_assume_role_policy = json.encode({
    "Version": "2012-10-17",
    "Statement": [{
        "Effect": "Allow",
        "Principal": {"Service": "eks.amazonaws.com"},
        "Action": "sts:AssumeRole"
    }]
})

_node_assume_role_policy = json.encode({
    "Version": "2012-10-17",
    "Statement": [{
        "Effect": "Allow",
        "Principal": {
            "Service": [
                "ec2.amazonaws.com",
#                "eks.amazonaws.com" 
            ]
        },
        "Action": "sts:AssumeRole"
    }]
})

_cluster_role_resource = role.RoleBlueprint {
    _name = "role-eks-cluster-${_id}"
    _providerConfig = _providerConfig
    _assumeRolePolicyDocument = _cluster_assume_role_policy
    _description = "role-eks-cluster"
    _tags = _tags | {
        Name = _name
    }
}

_node_role_resource = role.RoleBlueprint {
    _name = "role-eks-node-${_id}"
    _providerConfig = _providerConfig
    _assumeRolePolicyDocument = _node_assume_role_policy
    _description = "role-eks-nodes"
    _tags = _tags | {
        Name = _name
    }
}

_cluster_policy_attachment_resource = [
    rolePolicyAttachment.RolepolicyattachmentBlueprint {
        _name = "eks-cluster-policy-${s.name}-${_id}".lower()
        _providerConfig = _providerConfig
        _roleName = _cluster_role_resource._name
        _policyArn = s.arn
    }
    for s in [
        {name = "AmazonEKSClusterPolicy", arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"},
        {name = "AmazonEKSVPCResourceController", arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"} 
    ]
]

_node_policy_attachments_resource = [
    rolePolicyAttachment.RolepolicyattachmentBlueprint {
        _name = "eks-cluster-node-policy-${s.name}-${_id}".lower()
        _providerConfig = _providerConfig
        _roleName = _node_role_resource._name
        _policyArn = s.arn
    }
    for s in [
        {name = "AmazonEKSWorkerNodePolicy", arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"},
        {name = "AmazonEC2ContainerRegistryReadOnly", arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"},
        {name = "AmazonEKS-CNI-Policy", arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"}
    ]
]

_kms_resources = []
_eks_encryption_config = None

if _encryptCluster == True:
#    _cluster_role_arn = "arn:aws:iam::${_accountId}:role/${_cluster_role_resource._name}"

#    _kms_key_policy = json.encode({
#        "Version": "2012-10-17",
#        "Statement": [
#            {
#                "Sid": "Enable IAM User Permissions",
#                "Effect": "Allow",
#                "Principal": {"AWS": "arn:aws:iam::${_accountId}:root"},
#                "Action": "kms:*",
#                "Resource": "*"
#            },
#            {
#                "Sid": "Allow EKS service to use the key",
#                "Effect": "Allow",
#                "Principal": {"AWS": _cluster_role_arn},
#                "Action": ["kms:CreateGrant", "kms:DescribeKey"],
#                "Resource": "*"
#            }
#        ]
#    })

   _kms_key_resource = kmsKey.KeyBlueprint {
       _name = "kms-key-eks-${_id}"
       _providerConfig = _providerConfig
       _description = "KMS key for EKS encryption"
       _enableKeyRotation = True
       _enabled = True
       _keySpec = "SYMMETRIC_DEFAULT"
       _keyUsage = "ENCRYPT_DECRYPT"
       _region = _region
       _multiRegion = False
       _origin = "AWS_KMS"
       _pendingWindowInDays = 7
       _policy = """
            {
                "Version": "2012-10-17",
                "Statement": [
                    {
                        "Sid": "Enable IAM User Permissions",
                        "Effect": "Allow",
                        "Principal": {"AWS": "arn:aws:iam::" + _accountId + ":root"},
                        "Action": "kms:*",
                        "Resource": "*"
                    },
                    # {
                    #     "Sid": "Allow EKS service to use the key",
                    #     "Effect": "Allow",
                    #     "Principal": {"AWS": _cluster_role_arn},
                    #     "Action": ["kms:CreateGrant", "kms:DescribeKey"],
                    #     "Resource": "*"
                    # }
                ]
            }"""
       _region = _region
       _tags = _tags | { Name = _name }
   }
   _kms_resources = [_kms_key_resource]
items = [_cluster_role_resource, _node_role_resource] + _cluster_policy_attachment_resource + _node_policy_attachments_resource + _kms_resources