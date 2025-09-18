import json
import schemas.role as role
import schemas.rolePolicyAttachment as rolePolicyAttachment

observed_xr = option("params").oxr
_id = observed_xr.spec.id
_region = observed_xr.spec.region
_providerConfig = observed_xr.spec.providerConfigName or "default"
_tags = observed_xr.spec.tags or {}



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
        {name = "`AmazonEKSWorkerNodePolicy`", arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"},
        {name = "AmazonEC2ContainerRegistryReadOnly", arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"},
        {name = "AmazonEKS_CNI_Policy", arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"}
    ]
]

items = [_cluster_role_resource, _node_role_resource] + _cluster_policy_attachment_resource + _node_policy_attachments_resource