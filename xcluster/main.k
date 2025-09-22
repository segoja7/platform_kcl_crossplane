import json
import schemas.role as role
import schemas.rolePolicyAttachment as rolePolicyAttachment
import schemas.kmsKey as kmsKey
import schemas.kmsAlias as kmsAlias
import schemas.eksCluster as eksCluster
import schemas.eksNodeGroup as eksNodegroup
import schemas.eksAddon as eksAddon

observed_xr = option("params").oxr
_id = observed_xr.spec.id
_region = observed_xr.spec.region
_providerConfig = observed_xr.spec.providerConfigName or "default"
_tags = observed_xr.spec.tags or {}
_encryptCluster = observed_xr.spec.encryptCluster or False
_accountId = observed_xr.spec.accountId or "account_id_not_set"
_authenticationMode = observed_xr.spec.authenticationMode or "API_AND_CONFIG_MAP"
_logTypes = observed_xr.spec.logging or []
_publicAccessCidrs = observed_xr.spec.publicAccessCidrs or ["0.0.0.0/0"]
_endpointPublicAccess = observed_xr.spec.endpointPublicAccess or True
_endpointPrivateAccess = observed_xr.spec.endpointPrivateAccess or True
_networkId = observed_xr.spec.networkId 
_clusterVersion = observed_xr.spec.clusterVersion
_nodeGroupConfig = observed_xr.spec.nodeGroup or {}
_addonsConfig = observed_xr.spec.addons or []

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
                "ec2.amazonaws.com"
            ]
        },
        #"eks.amazonaws.com" 
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

_cluster_policy_attachment_resource = [rolePolicyAttachment.RolepolicyattachmentBlueprint {
    _name = "eks-cluster-policy-${s.name}-${_id}".lower()
    _providerConfig = _providerConfig
    _roleName = _cluster_role_resource._name
    _policyArn = s.arn
} for s in [
    {name = "AmazonEKSClusterPolicy", arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"},
    {name = "AmazonEKSVPCResourceController", arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"}
]]

_node_policy_attachments_resource = [rolePolicyAttachment.RolepolicyattachmentBlueprint {
    _name = "eks-cluster-node-policy-${s.name}-${_id}".lower()
    _providerConfig = _providerConfig
    _roleName = _node_role_resource._name
    _policyArn = s.arn
} for s in [
    {name = "AmazonEKSWorkerNodePolicy", arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"},
    {name = "AmazonEC2ContainerRegistryReadOnly", arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"},
    {name = "AmazonEKS-CNI-Policy", arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"}
]]

_kms_resources = []
_eks_encryption_config = []

if _encryptCluster == True:
    _cluster_role_arn = "arn:aws:iam::${_accountId}:role/${_cluster_role_resource._name}"

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
        _policy = json.encode({
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "Enable IAM User Permissions",
                    "Effect": "Allow",
                    "Principal": {"AWS": "arn:aws:iam::${_accountId}:root"},
                    "Action": "kms:*",
                    "Resource": "*"
                },
                {
                    "Sid": "Allow EKS service to use the key",
                    "Effect": "Allow",
                    "Principal": {"AWS": _cluster_role_arn},
                    "Action": ["kms:CreateGrant", "kms:DescribeKey"],
                    "Resource": "*"
                }
            ]
        })
        _tags = _tags | {Name: _name}
    }
    _kms_alias_resource = kmsAlias.AliasBlueprint {
        _name = "alias-eks-${_id}"
        _providerConfig = _providerConfig
        _region = _region
        _targetKeyIdRef = {
            name: _kms_key_resource._name
        }
    }
    _kms_resources = [_kms_key_resource, _kms_alias_resource]
    _eks_encryption_config = [{
        resources: ["secrets"],
        provider: {
            keyArn: "arn:aws:kms:${_region}:${_accountId}:alias/${_kms_alias_resource._name}"
        }
    }]

_eks_cluster_resource = eksCluster.ClusterBlueprint {
    _name = "eks-cluster-${_id}"
    _region = _region
    _providerConfig = _providerConfig
    _accessConfig = {
        authenticationMode: _authenticationMode
    }
    _encryptionConfig = _eks_encryption_config
    _kubernetesNetworkConfig = {
        ipFamily: "ipv4",
        serviceIpv4Cidr: "10.96.0.0/16"
    }
    if len(_logTypes) > 0:
        _logging = {
            clusterLogging: [{
                enabled: True,
                types: _logTypes
            }]
        }
    _resourcesVpcConfig = {
        endpointPrivateAccess: _endpointPrivateAccess,
        endpointPublicAccess: _endpointPublicAccess,
        publicAccessCidrs: _publicAccessCidrs,
        subnetIdSelector: {
            matchLabels: {
                "claim-name": _networkId,
                "subnet.type": "private"
            }
        }
    }
    _roleArnRef = {
        name: _cluster_role_resource._name
    }
    _tags = _tags | {Name = _name}
    _version = _clusterVersion
}


_cluster_nodegroup_resource = eksNodegroup.NodegroupBlueprint {
    _name = "cluster-nodegroup-${_id}"
    _providerConfig = _providerConfig
    _amiType = _nodeGroupConfig.amiType
    _capacityType = _nodeGroupConfig.capacityType
    _clusterNameSelector = {
        matchControllerRef = True
    }
    _diskSize = _nodeGroupConfig.diskSize
    _instanceTypes = _nodeGroupConfig.instanceTypes
    _nodeRoleRef = {
        name = _node_role_resource._name
    }
    _region = _region
    _scalingConfig = {
        desiredSize = _nodeGroupConfig.desiredSize
        maxSize = _nodeGroupConfig.maxSize 
        minSize = _nodeGroupConfig.minSize
    }
    _subnetSelector = {
        # matchControllerRef = True
        matchLabels = {
            "claim-name": _networkId,
            "subnet.type": "private"
        }
    }
    _tags = _tags | {Name = _name}
    if _nodeGroupConfig.updateConfig != None:
        _updateConfig = _nodeGroupConfig.updateConfig
}

_addons_cni_assume_role_policy = json.encode({
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


_cluster_addons_resource = eksAddon.AddonBlueprint {
    _name = "addon-${s.name}-${_id}"
    _providerConfig = _providerConfig
    _addonName = s.name
    _addonVersion = s.version
    _clusterNameSelector = {
        matchControllerRef = True
    }
    _region = _region
    _resolveConflicts = s.resolveConflicts
    _tags = _tags | {
        Name = _name
    }
} for s in _addonsConfig 

items = [
    _cluster_role_resource, 
    _node_role_resource
] + _cluster_policy_attachment_resource + _node_policy_attachments_resource + _kms_resources + [
    _eks_cluster_resource, 
    _cluster_nodegroup_resource,
    _cluster_addons_resource
]
