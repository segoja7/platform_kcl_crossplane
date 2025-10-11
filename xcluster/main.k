import json
import schemas.role as role
import schemas.rolePolicyAttachment as rolePolicyAttachment
import schemas.kmsKey as kmsKey
import schemas.kmsAlias as kmsAlias
import schemas.eksCluster as eksCluster
import schemas.eksNodeGroup as eksNodegroup
import schemas.eksAddon as eksAddon
import schemas.providerConfigHelm as providerConfigHelm
import schemas.release as release
import schemas.providerConfigKubernetes as providerConfigKubernetes
import schemas.object as object
import schemas.openIDConnectProvider as openIDConnectProvider
import schemas.policy as policy


oxr = option("params").oxr
_ocds = option("params").ocds or {}
dxr = option("params").dxr

_id = oxr.spec.id
_region = oxr.spec.region
_providerConfig = oxr.spec.providerConfigName or "default"
_tags = oxr.spec.tags or {}
_encryptCluster = oxr.spec.encryptCluster or False
_accountId = oxr.spec.accountId or "account_id_not_set"
_authenticationMode = oxr.spec.authenticationMode or "API_AND_CONFIG_MAP"
_logTypes = oxr.spec.logging or []
_publicAccessCidrs = oxr.spec.publicAccessCidrs or ["0.0.0.0/0"]
_endpointPublicAccess = oxr.spec.endpointPublicAccess or True
_endpointPrivateAccess = oxr.spec.endpointPrivateAccess or True
_networkId = oxr.spec.networkId 
_clusterVersion = oxr.spec.clusterVersion
_nodeGroupConfig = oxr.spec.nodeGroup or {}
_addonsConfig = oxr.spec.addons or []
_labels = {"claim-name" = _id}
_helmAddonsConfig = oxr.spec.helmAddonsConfig or []
_domainNames = oxr.spec.domainNames
_certificateSecretName = oxr.spec.certificateSecretName 
_hostedZoneID = oxr.spec.hostedZoneID or "hosted_zone_id_not_set"

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
        "Action": "sts:AssumeRole"
    }]
})

_cluster_role_resource = role.RoleBlueprint {
    _name = "role-eks-cluster-${_id}"
    _labels = _labels
    _providerConfig = _providerConfig
    _assumeRolePolicyDocument = _cluster_assume_role_policy
    _description = "role-eks-cluster"
    _tags = _tags | {
        Name = _name
    }
}

_node_role_resource = role.RoleBlueprint {
    _name = "role-eks-node-${_id}"
    _labels = _labels
    _providerConfig = _providerConfig
    _assumeRolePolicyDocument = _node_assume_role_policy
    _description = "role-eks-nodes"
    _tags = _tags | {
        Name = _name
    }
}

_cluster_policy_attachment_resource = [rolePolicyAttachment.RolepolicyattachmentBlueprint {
    _name = "eks-cluster-policy-${s.name}-${_id}".lower()
    _labels = _labels
    _providerConfig = _providerConfig
    _roleName = _cluster_role_resource._name
    _policyArn = s.arn
} for s in [
    {name = "AmazonEKSClusterPolicy", arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"},
    {name = "AmazonEKSVPCResourceController", arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"}
]]

_node_policy_attachments_resource = [rolePolicyAttachment.RolepolicyattachmentBlueprint {
    _name = "eks-cluster-node-policy-${s.name}-${_id}".lower()
    _labels = _labels
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
        _labels = _labels
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
        _tags = _tags | {Name = _name}
    }
    _kms_alias_resource = kmsAlias.AliasBlueprint {
        _name = "alias-eks-${_id}"
        _labels = _labels
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
    _labels = _labels
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
    _writeConnectionSecretToRef = {
        name: _name
        namespace: "default"
    }  
}


_cluster_nodegroup_resource = eksNodegroup.NodegroupBlueprint {
    _name = "cluster-nodegroup-${_id}"
    _labels = _labels
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
        matchLabels = {
            "claim-name": _networkId,
            "subnet.type": "private"
        }
    }
    _tags = _tags | {Name = _name}
    if _nodeGroupConfig.updateConfig != None:
        _updateConfig = _nodeGroupConfig.updateConfig
}

_addons_vpc_cni_assume_role_policy = json.encode({
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


_cni_addon_config = [s for s in _addonsConfig if s.name == "vpc-cni"]
_cni_resources = []
_cni_role_resource_name = "role-addon-vpc-cni-cluster-${_id}"

if len(_cni_addon_config) > 0:
    _addons_vpc_cni_role_resource = role.RoleBlueprint {
        _name = _cni_role_resource_name
        _labels = _labels
        _providerConfig = _providerConfig
        _assumeRolePolicyDocument = _addons_vpc_cni_assume_role_policy
        _description = "Role for VPC CNI addon"
        _tags = _tags | { Name = _name }
    }
    _cni_policy_attachment_resource = rolePolicyAttachment.RolepolicyattachmentBlueprint {
        _name = "vpc-cni-policy-attachment-${_id}".lower()
        _labels = _labels
        _providerConfig = _providerConfig
        _roleName = _cni_role_resource_name
        _policyArn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    }
    _cni_resources = [_addons_vpc_cni_role_resource, _cni_policy_attachment_resource]


_cluster_addons_resource = [ eksAddon.AddonBlueprint {
    _name = "addon-${s.name}-${_id}"
    _labels = _labels
    _providerConfig = _providerConfig
    _addonName = s.name
    if "version" in s and s.version != None:
        _addonVersion = s.version
    _clusterNameSelector = {
        matchControllerRef = True
    }
    _region = _region
    if "resolveConflicts" in s and s.resolveConflicts != None:
        _resolveConflicts = s.resolveConflicts
    _tags = _tags | {
        Name = "addon-${s.name}-${_id}"
    }
} for s in _addonsConfig
]

_providerconfig_helm_resource = providerConfigHelm.ProviderconfigBlueprint {
    _name = "provider-helm-${_id}"
    _labels = _labels
    _annotations = {
        "krm.kcl.dev/ready": "True"
    }
    _credentials = {
        source = "Secret"
        secretRef = {
            namespace = _eks_cluster_resource._writeConnectionSecretToRef.namespace
            name = _eks_cluster_resource._writeConnectionSecretToRef.name
            key = "kubeconfig"
        }
    }
}

_release_helm_resource = release.ReleaseBlueprint {
    _name = "argocd-${_id}"
    _labels = _labels
    _providerConfig = _providerconfig_helm_resource._name
    _chart = {
        name = "argo-cd"
        repository = "https://argoproj.github.io/argo-helm"
        version = "7.9.0"
    }
    # _createNamespace = False
    _namespace = "argocd"
    _values = {
        "global": {
            "domain": "argo.segoja7.com"
        },
        "configs": {
            "params": {
                "server.insecure": True
            }
        },
        "server": {
            "ingress": {
                "enabled": True,
                "controller": "aws",
                "ingressClassName": "alb",
                "annotations": {
                    "alb.ingress.kubernetes.io/scheme": "internet-facing",
                    "alb.ingress.kubernetes.io/target-type": "ip",
                    "alb.ingress.kubernetes.io/backend-protocol": "HTTP",
                    "alb.ingress.kubernetes.io/listen-ports": '[{"HTTP": 80}, {"HTTPS": 443}]',
                    "alb.ingress.kubernetes.io/ssl-redirect": "443"
                },
                "aws": {
                    "serviceType": "ClusterIP",
                    "backendProtocolVersion": "GRPC"
                },
                "tls": [
                   {
                       "hosts": [
                           "argo.segoja7.com" 
                       ],
                       "secretName": _certificateSecretName 
                   }
                ]
            }
        },           
        "repoServer": {
            "volumes": [
                {
                    "name": "kcl-binary",
                    "emptyDir": {}
                },
                {
                    "name": "kcl-plugin-config",
                    "configMap": {
                        "name": "kcl-plugin"
                    }
                }
            ],
            "initContainers": [
                {
                    "name": "install-kcl",
                    "image": "kcllang/kcl:v0.11.3",
                    "command": ["sh", "-c", "cp /usr/local/bin/kcl /kcl-binary/"],
                    "volumeMounts": [
                        {
                            "name": "kcl-binary",
                            "mountPath": "/kcl-binary"
                        }
                    ]
                }
            ],
            "extraContainers": [
                {
                    "name": "kcl-plugin",
                    "command": ["/var/run/argocd/argocd-cmp-server"],
                    "image": "quay.io/argoproj/argocd:v2.14.11",
                    "securityContext": {
                        "runAsNonRoot": True,
                        "runAsUser": 999
                    },
                    "volumeMounts": [
                        {
                            "mountPath": "/var/run/argocd",
                            "name": "var-files"
                        },
                        {
                            "mountPath": "/home/argocd/cmp-server/plugins",
                            "name": "plugins"
                        },
                        {
                            "mountPath": "/usr/local/bin/kcl",
                            "name": "kcl-binary",
                            "subPath": "kcl"
                        },
                        {
                            "mountPath": "/home/argocd/cmp-server/config/plugin.yaml",
                            "name": "kcl-plugin-config",
                            "subPath": "plugin.yaml"
                        }
                    ]
                }
            ]
        }
    }
    
}

_providerconfig_kubernetes_resource = providerConfigKubernetes.ProviderconfigBlueprint {
    _name = "provider-kubernetes-${_id}"
    _labels = _labels
    _annotations = {
        "krm.kcl.dev/ready": "True"
    }
    _credentials = {
        source = "Secret"
        secretRef = {
            namespace = _eks_cluster_resource._writeConnectionSecretToRef.namespace
            name = _eks_cluster_resource._writeConnectionSecretToRef.name
            key = "kubeconfig"
        }
    }
}

_object_argo_cm_resource = object.ObjectBlueprint {
    _name = "kcl-plugin-configmap"
    _labels = _labels
    _manifest = {
        apiVersion = "v1"
        kind = "ConfigMap"
        metadata = {
            name = "kcl-plugin"
            namespace = "argocd"
        }
        data = {
            "plugin.yaml": """apiVersion: argoproj.io/v1alpha1
kind: ConfigManagementPlugin
metadata:
  name: kcl
spec:
  version: v1.0
  generate:
    command: ["sh", "-c"]
    args:
      - |
        export KCL_CACHE_PATH=/tmp
        export KCL_PKG_PATH=/tmp
        tempfile=$(mktemp)
        kcl run -q -o $tempfile > /dev/null 2>&1
        error=$?
        if [ $error -eq 0 ]; then
          cat $tempfile
          rm $tempfile
        fi
        exit $error
"""
        }
    }
    _providerConfig = _providerconfig_kubernetes_resource._name
}

# Request extra resources para obtener el VPC del network
extraResourcesRequest = {
    "apiVersion": "meta.krm.kcl.dev/v1alpha1",
    "kind": "ExtraResources",
    "requirements": {
        "vpc": {
            "apiVersion": "ec2.aws.crossplane.io/v1beta1",
            "kind": "VPC",
            "matchLabels": {
                "claim-name": _networkId
            }
        }
    }
}

# Get extra resources
er = option("params").extraResources or {}
# dxr = {**oxr}
_vpc_id = ""
if er?.vpc and len(er.vpc) > 0:
    _vpc_id = er.vpc[0]?.Resource?.status?.atProvider?.vpcId or ""

observed_cluster_name = _eks_cluster_resource._name
oidc_issuer_url = option("params")?.ocds?[observed_cluster_name]?.Resource?.status?.atProvider?.identity?.oidc?.issuer or ""


# Create OpenIDConnectProvider only when we have a real OIDC URL
_oidc_resources = []
if oidc_issuer_url and oidc_issuer_url != "":
    _oidc_resource = openIDConnectProvider.OpenidconnectproviderBlueprint {
        _name = "openid-eks-${_id}"
        _providerConfig = _providerConfig
        _clientIDList = [ "sts.amazonaws.com" ]
        _thumbprintList = [ "9e99a48a9960b14926bb7f3b02e22da2b0ab7280" ]
        _url = oidc_issuer_url
        _tags = _tags | { Name = _name }
    }
    _oidc_resources = [_oidc_resource]


_helm_addon_resources = []
if _helmAddonsConfig and len(_helmAddonsConfig) > 0 and oidc_issuer_url != "":
    _issuer_url = oidc_issuer_url.replace("https://", "")
    
    
    _policies_resources = [policy.PolicyBlueprint {
        _name = "policy-${s.name}-${_id}"
        _providerConfig = _providerConfig
        _description = "Policy for ${s.name}"
        _document = s.customPolicy
        _tags = _tags | { Name = _name }
    } for s in _helmAddonsConfig if "serviceAccountName" in s and "customPolicy" in s]
    
    _roles_resources = [role.RoleBlueprint {
        _name = "role-${s.name}-${_id}"
        _providerConfig = _providerConfig
        _assumeRolePolicyDocument = json.encode({
            "Version": "2012-10-17",
            "Statement": [{
                "Effect": "Allow",
                "Principal": {
                    "Federated": "arn:aws:iam::${_accountId}:oidc-provider/${_issuer_url}"
                },
                "Action": "sts:AssumeRoleWithWebIdentity",
                "Condition": {
                    "StringEquals": {
                        "${_issuer_url}:sub": "system:serviceaccount:${s.namespace}:${s.serviceAccountName}",
                        "${_issuer_url}:aud": "sts.amazonaws.com"
                    }
                }
            }]
        })
        _description = "IRSA role for ${s.name}"
        _tags = _tags | { Name = _name }
    } for s in _helmAddonsConfig if "serviceAccountName" in s and "customPolicy" in s]
    
    _policy_attachments_resources = [rolePolicyAttachment.RolepolicyattachmentBlueprint {
        _name = "policy-attachment-${s.name}-${_id}"
        _providerConfig = _providerConfig
        _roleName = "role-${s.name}-${_id}"
        _policyArn = "arn:aws:iam::${_accountId}:policy/policy-${s.name}-${_id}"
    } for s in _helmAddonsConfig if "serviceAccountName" in s and "customPolicy" in s]
    
    _releases_resources = [release.ReleaseBlueprint {
        _name = "${s.name}"
        _labels = _labels
        _providerConfig = _providerconfig_helm_resource._name
        _chart = {
            name = s.chart
            repository = s.repository   
            version = s.version
        }
        _namespace = s.namespace
        _values = (s.values or {}) | ({
            # Especific Configuration for AWS Load Balancer Controller
            "clusterName": _id,
            "vpcId": _vpc_id,
            "region": _region,
            "serviceAccount": {
                "name": s.serviceAccountName,
                "annotations": {
                    "eks.amazonaws.com/role-arn": "arn:aws:iam::${_accountId}:role/role-${s.name}-${_id}"
                }
            }
        } if s.name == "aws-load-balancer-controller" else {
            # Configuration for another charts with service account
            "serviceAccount": {
                "name": s.serviceAccountName,
                "annotations": {
                    "eks.amazonaws.com/role-arn": "arn:aws:iam::${_accountId}:role/role-${s.name}-${_id}"
                }
            }
        } if "serviceAccountName" in s else {})
    } for s in _helmAddonsConfig]
    
    _helm_addon_resources = _policies_resources + _roles_resources + _policy_attachments_resources + _releases_resources


#create certificate only when cert-manager is ready.  
observed_cert_manager_release = "cert-manager" #TODO: this line assume that release have cert-manager name
cert_manager_release = option("params")?.ocds?[observed_cert_manager_release]?.Resource?.status?.conditions[0]?.status or ""


# Create certificates only when we have a real OIDC URL
_cert_manager_resources = []
if cert_manager_release == "True":
    _certificate_resource = object.ObjectBlueprint {
        _name = "cert-manager-certificate-${_id}"
        _labels = _labels
        _manifest = {
            apiVersion = "cert-manager.io/v1"
            kind = "Certificate"
            metadata = {
                name = "certificate-${_id}"
                namespace = "cert-manager"
            }
            spec = {
                dnsNames = _domainNames
                secretName = _certificateSecretName
                secretTemplate = {
                    annotations = {
                        "reflector.v1.k8s.emberstack.com/reflection-allowed": "true",
                        "reflector.v1.k8s.emberstack.com/reflection-auto-enabled": "true",
                        "reflector.v1.k8s.emberstack.com/reflection-auto-namespaces": "argocd,keycloak"
                    }
                }
                revisionHistoryLimit = 1
                issuerRef = {
                    name = "clusterissuer-${_id}"
                    kind = "ClusterIssuer"
                    group = "cert-manager.io"
                    }
            }
        }
        _providerConfig = _providerconfig_kubernetes_resource._name
    }
    _clusterissuer_resource = object.ObjectBlueprint {
        _name = "cert-manager-clusterissuer-${_id}"
        _labels = _labels
        _manifest = {
            apiVersion = "cert-manager.io/v1"
            kind = "ClusterIssuer"
            metadata = {
                name = "clusterissuer-${_id}"
            }
            spec = {
                acme = {
                    server = "https://acme-staging-v02.api.letsencrypt.org/directory"
                    privateKeySecretRef = {
                        name = "${_id}-key"
                    }
                    solvers = [
                        {
                            dns01 = {
                                route53 = {
                                    hostedZoneID = _hostedZoneID
                                }
                            }
                        }
                    ]
                }
            }
        }
        _providerConfig = _providerconfig_kubernetes_resource._name
    }
    _cert_manager_resources = [_certificate_resource, _clusterissuer_resource]



items = [
    extraResourcesRequest,
    _cluster_role_resource, 
    _node_role_resource,
    _eks_cluster_resource, 
    _cluster_nodegroup_resource
] + _cluster_policy_attachment_resource + _node_policy_attachments_resource + _kms_resources + _cni_resources + _cluster_addons_resource + [
    _providerconfig_helm_resource,
    _release_helm_resource,
    _providerconfig_kubernetes_resource,
    _object_argo_cm_resource
] + _oidc_resources + _helm_addon_resources + _cert_manager_resources
