# --- Blueprint de Alto Nivel (Generado Automáticamente) ---

import modules.eks_aws_upbound_io.v1beta1.eks_aws_upbound_io_v1beta1_IdentityProviderConfig as identityproviderconfig_schema

schema IdentityproviderconfigBlueprint(identityproviderconfig_schema.Identityproviderconfig):
    """Este Blueprint simplifica la creación de un recurso Identityproviderconfig,
    exponiendo una selección inteligente de campos requeridos y opcionales comunes."""

    # Parámetros de entrada simplificados para el usuario
    _name: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _finalizers?: [str]
    _providerConfig: str
    _deletionPolicy?: "Orphan" | "Delete"
    _initProvider?: identityproviderconfig_schema.IdentityproviderconfigspecInitprovider
    _managementPolicies?: ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef?: identityproviderconfig_schema.IdentityproviderconfigspecWriteconnectionsecrettoref
    _clusterName?: str
    _clusterNameRef?: identityproviderconfig_schema.IdentityproviderconfigspecforproviderClusternameref
    _clusterNameSelector?: identityproviderconfig_schema.IdentityproviderconfigspecforproviderClusternameselector
    _oidc?: [identityproviderconfig_schema.IdentityproviderconfigspecforproviderOidcitem]
    _region: str
    _tags?: {str:str}

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
            clusterName = _clusterName
            clusterNameRef = _clusterNameRef
            clusterNameSelector = _clusterNameSelector
            oidc = _oidc
            region = _region
            tags = _tags
        }
        providerConfigRef.name = _providerConfig
    }

# --- Ejemplo de Uso ---
# Descomenta y ajusta los valores para usar este Blueprint en tu archivo 'main.k'.
# items = [
#     IdentityproviderconfigBlueprint {
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
#         _clusterName = "example-value" # Reemplazar valor
#         _clusterNameRef = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _clusterNameSelector = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _oidc = [] # Reemplazar valor
#         _region = "example-value" # Reemplazar valor
#         _tags = {
#             "Key": "Value"
#         } # Reemplazar valor
#     }
# ]
