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
    _deletionPolicy?: "Orphan" | "Delete"
    _initProvider?: cluster_schema.ClusterspecInitprovider
    _managementPolicies?: ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef?: cluster_schema.ClusterspecWriteconnectionsecrettoref
    _accessConfig?: [cluster_schema.ClusterspecforproviderAccessconfigitem]
    _bootstrapSelfManagedAddons?: bool
    _computeConfig?: [cluster_schema.ClusterspecforproviderComputeconfigitem]
    _deletionProtection?: bool
    _enabledClusterLogTypes?: [str]
    _encryptionConfig?: [cluster_schema.ClusterspecforproviderEncryptionconfigitem]
    _forceUpdateVersion?: bool
    _kubernetesNetworkConfig?: [cluster_schema.ClusterspecforproviderKubernetesnetworkconfigitem]
    _outpostConfig?: [cluster_schema.ClusterspecforproviderOutpostconfigitem]
    _region: str
    _remoteNetworkConfig?: [cluster_schema.ClusterspecforproviderRemotenetworkconfigitem]
    _roleArn?: str
    _roleArnRef?: cluster_schema.ClusterspecforproviderRolearnref
    _roleArnSelector?: cluster_schema.ClusterspecforproviderRolearnselector
    _storageConfig?: [cluster_schema.ClusterspecforproviderStorageconfigitem]
    _tags?: {str:str}
    _upgradePolicy?: [cluster_schema.ClusterspecforproviderUpgradepolicyitem]
    _version?: str
    _vpcConfig?: [cluster_schema.ClusterspecforproviderVpcconfigitem]
    _zonalShiftConfig?: [cluster_schema.ClusterspecforproviderZonalshiftconfigitem]

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
            roleArnRef = _roleArnRef
            roleArnSelector = _roleArnSelector
            storageConfig = _storageConfig
            tags = _tags
            upgradePolicy = _upgradePolicy
            version = _version
            vpcConfig = _vpcConfig
            zonalShiftConfig = _zonalShiftConfig
        }
        providerConfigRef.name = _providerConfig
    }

# --- Ejemplo de Uso ---
# Descomenta y ajusta los valores para usar este Blueprint en tu archivo 'main.k'.
# items = [
#     ClusterBlueprint {
#         _name = "example-value" # Reemplazar valor
#         _namespace = "example-value" # Reemplazar valor
#         _labels = {
#             Name = "example-name"
#             Environment = "development"
#         } # Reemplazar valor
#         _annotations = {
#             "app.kubernetes.io/name" = "example-app"
#             "app.kubernetes.io/version" = "1.0.0"
#         } # Reemplazar valor
#         _finalizers = [] # Reemplazar valor
#         _providerConfig = "example-value" # Reemplazar valor
#         _deletionPolicy = "example-value" # Reemplazar valor
#         _initProvider = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _managementPolicies = [] # Reemplazar valor
#         _writeConnectionSecretToRef = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _accessConfig = [] # Reemplazar valor
#         _bootstrapSelfManagedAddons = True # Reemplazar valor
#         _computeConfig = [] # Reemplazar valor
#         _deletionProtection = True # Reemplazar valor
#         _enabledClusterLogTypes = [] # Reemplazar valor
#         _encryptionConfig = [] # Reemplazar valor
#         _forceUpdateVersion = True # Reemplazar valor
#         _kubernetesNetworkConfig = [] # Reemplazar valor
#         _outpostConfig = [] # Reemplazar valor
#         _region = "example-value" # Reemplazar valor
#         _remoteNetworkConfig = [] # Reemplazar valor
#         _roleArn = "example-value" # Reemplazar valor
#         _roleArnRef = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _roleArnSelector = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _storageConfig = [] # Reemplazar valor
#         _tags = {
#             "Key": "Value"
#         } # Reemplazar valor
#         _upgradePolicy = [] # Reemplazar valor
#         _version = "example-value" # Reemplazar valor
#         _vpcConfig = [] # Reemplazar valor
#         _zonalShiftConfig = [] # Reemplazar valor
#     }
# ]
