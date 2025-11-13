# --- Blueprint de Alto Nivel (Generado Automáticamente) ---
import modules.eks_aws_upbound_io.v1beta1.eks_aws_upbound_io_v1beta1_Cluster as cluster_schema

schema ClusterBlueprint(cluster_schema.Cluster):
    """Este Blueprint simplifica la creación de un recurso Cluster,
    exponiendo una selección inteligente de campos requeridos y opcionales comunes."""
    # Parámetros de entrada simplificados para el usuario
    _name: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy: "Orphan" | "Delete"
    _initProvider: cluster_schema.ClusterspecInitprovider
    _managementPolicies: ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef: cluster_schema.ClusterspecWriteconnectionsecrettoref
    _accessConfig: any
    _bootstrapSelfManagedAddons: bool
    _computeConfig: any
    _deletionProtection: bool
    _enabledClusterLogTypes: [str]
    _encryptionConfig: any
    _forceUpdateVersion: bool
    _kubernetesNetworkConfig: any
    _outpostConfig: any
    _region: str
    _remoteNetworkConfig: any
    _roleArn: str
    _roleArnRef: any
    _roleArnSelector: any
    _storageConfig: any
    _tags: {str:str}
    _upgradePolicy: any
    _version: str
    _vpcConfig: any
    _zonalShiftConfig: any

    # Lógica de mapeo de parámetros simples a la estructura compleja
    metadata = {
        name = _name
        namespace = _namespace
        labels = _labels
        annotations = _annotations
        finalizers = _finalizers
    }
    spec = {
        deletionPolicy = _deletionPolicy
        initProvider = _initProvider
        managementPolicies = _managementPolicies
        writeConnectionSecretToRef = _writeConnectionSecretToRef
        forProvider = {
            accessConfig = _accessConfig
            bootstrapSelfManagedAddons = _bootstrapSelfManagedAddons
            computeConfig = _computeConfig
            deletionProtection = _deletionProtection
            enabledClusterLogTypes = _enabledClusterLogTypes
            encryptionConfig = _encryptionConfig
            forceUpdateVersion = _forceUpdateVersion
            kubernetesNetworkConfig = _kubernetesNetworkConfig
            outpostConfig = _outpostConfig
            region = _region
            remoteNetworkConfig = _remoteNetworkConfig
            roleArn = _roleArn
            roleArnRef = cluster_schema.ClusterspecforproviderRolearnref {
                name = _roleArnRef.name
                policy = ClusterspecforproviderrolearnrefPolicy {
                    resolution = _roleArnRef.policy.resolution
                    resolve = _roleArnRef.policy.resolve
                }
            } if _roleArnRef != Undefined else Undefined
            roleArnSelector = cluster_schema.ClusterspecforproviderRolearnselector {
                matchControllerRef = _roleArnSelector.matchControllerRef
                matchLabels = _roleArnSelector.matchLabels
                policy = ClusterspecforproviderrolearnselectorPolicy {
                    resolution = _roleArnSelector.policy.resolution
                    resolve = _roleArnSelector.policy.resolve
                }
            } if _roleArnSelector != Undefined else Undefined
            storageConfig = _storageConfig
            tags = _tags
            upgradePolicy = _upgradePolicy
            version = _version
            vpcConfig = _vpcConfig
            zonalShiftConfig = _zonalShiftConfig
        }
        providerConfigRef.name = _providerConfig
    }
    
    

