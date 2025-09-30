# --- Blueprint de Alto Nivel (Generado Automáticamente) ---

import modules.eks_aws_upbound_io.v1beta1.eks_aws_upbound_io_v1beta1_PodIdentityAssociation as podidentityassociation_schema

schema PodidentityassociationBlueprint(podidentityassociation_schema.Podidentityassociation):
    """Este Blueprint simplifica la creación de un recurso Podidentityassociation,
    exponiendo una selección inteligente de campos requeridos y opcionales comunes."""

    # Parámetros de entrada simplificados para el usuario
    _name: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _providerConfig: str
    _deletionPolicy?: "Orphan" | "Delete"
    _initProvider?: podidentityassociation_schema.PodidentityassociationspecInitprovider
    _managementPolicies?: ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef?: podidentityassociation_schema.PodidentityassociationspecWriteconnectionsecrettoref
    _clusterName?: str
    _clusterNameRef?: podidentityassociation_schema.PodidentityassociationspecforproviderClusternameref
    _clusterNameSelector?: podidentityassociation_schema.PodidentityassociationspecforproviderClusternameselector
    _disableSessionTags?: bool
    _region: str
    _roleArn?: str
    _roleArnRef?: podidentityassociation_schema.PodidentityassociationspecforproviderRolearnref
    _roleArnSelector?: podidentityassociation_schema.PodidentityassociationspecforproviderRolearnselector
    _serviceAccount?: str
    _tags?: {str:str}
    _targetRoleArn?: str
    _targetRoleArnRef?: podidentityassociation_schema.PodidentityassociationspecforproviderTargetrolearnref
    _targetRoleArnSelector?: podidentityassociation_schema.PodidentityassociationspecforproviderTargetrolearnselector

    # Lógica de mapeo de parámetros simples a la estructura compleja
    metadata = {
        name = _name
        namespace = _namespace
        labels = _labels
        annotations = _annotations
    }
    spec = {
        deletionPolicy = _deletionPolicy
        initProvider = _initProvider
        managementPolicies = _managementPolicies
        writeConnectionSecretToRef = _writeConnectionSecretToRef
        forProvider = {
            clusterName = _clusterName
            clusterNameRef = _clusterNameRef
            clusterNameSelector = _clusterNameSelector
            disableSessionTags = _disableSessionTags
            namespace = _namespace
            region = _region
            roleArn = _roleArn
            roleArnRef = _roleArnRef
            roleArnSelector = _roleArnSelector
            serviceAccount = _serviceAccount
            tags = _tags
            targetRoleArn = _targetRoleArn
            targetRoleArnRef = _targetRoleArnRef
            targetRoleArnSelector = _targetRoleArnSelector
        }
        providerConfigRef.name = _providerConfig
    }

# --- Ejemplo de Uso ---
# Descomenta y ajusta los valores para usar este Blueprint en tu archivo 'main.k'.
# items = [
#     PodidentityassociationBlueprint {
#         _name = "example-value" # Reemplazar valor
#         _namespace = "example-value" # Reemplazar valor
#         _labels = {
#             "Key": "Value"
#         } # Reemplazar valor
#         _annotations = {
#             "Key": "Value"
#         } # Reemplazar valor
#         _providerConfig = "example-value" # Reemplazar valor
#         _deletionPolicy = "example-value" # Reemplazar valor
#         _initProvider = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _managementPolicies = [] # Reemplazar valor # Reemplazar valor
#         _writeConnectionSecretToRef = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _clusterName = "example-value" # Reemplazar valor
#         _clusterNameRef = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _clusterNameSelector = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _disableSessionTags = True # Reemplazar valor
#         _region = "example-value" # Reemplazar valor
#         _roleArn = "example-value" # Reemplazar valor
#         _roleArnRef = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _roleArnSelector = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _serviceAccount = "example-value" # Reemplazar valor
#         _tags = {
#             "Key": "Value"
#         } # Reemplazar valor
#         _targetRoleArn = "example-value" # Reemplazar valor
#         _targetRoleArnRef = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _targetRoleArnSelector = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#     }
# ]
