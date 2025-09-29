# --- Blueprint de Alto Nivel (Generado Automáticamente) ---

import modules.rds_aws_crossplane_io.v1alpha1.rds_aws_crossplane_io_v1alpha1_DBParameterGroup as dbparametergroup_schema

schema DbparametergroupBlueprint(dbparametergroup_schema.Dbparametergroup):
    """Este Blueprint simplifica la creación de un recurso Dbparametergroup,
    exponiendo una selección inteligente de campos requeridos y opcionales comunes."""

    # Parámetros de entrada simplificados para el usuario
    _name: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _providerConfig: str
    _deletionPolicy?: "Orphan" | "Delete"
    _managementPolicies?: ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _publishConnectionDetailsTo?: dbparametergroup_schema.DbparametergroupspecPublishconnectiondetailsto
    _writeConnectionSecretToRef?: dbparametergroup_schema.DbparametergroupspecWriteconnectionsecrettoref
    _dbParameterGroupFamily?: str
    _dbParameterGroupFamilySelector?: dbparametergroup_schema.DbparametergroupspecforproviderDbparametergroupfamilyselector
    _description: str
    _parameters?: [dbparametergroup_schema.DbparametergroupspecforproviderParametersitem]
    _region: str
    _tags?: {str:str}

    # Lógica de mapeo de parámetros simples a la estructura compleja
    metadata = {
        name = _name
        namespace = _namespace
        labels = _labels
        annotations = _annotations
    }
    spec = {
        deletionPolicy = _deletionPolicy
        managementPolicies = _managementPolicies
        publishConnectionDetailsTo = _publishConnectionDetailsTo
        writeConnectionSecretToRef = _writeConnectionSecretToRef
        forProvider = {
            dbParameterGroupFamily = _dbParameterGroupFamily
            dbParameterGroupFamilySelector = _dbParameterGroupFamilySelector
            description = _description
            parameters = _parameters
            region = _region
            tags = [{"key": k, "value": v} for k, v in _tags] if _tags else []
        }
        providerConfigRef.name = _providerConfig
    }

# --- Ejemplo de Uso ---
# Descomenta y ajusta los valores para usar este Blueprint en tu archivo 'main.k'.
# items = [
#     DbparametergroupBlueprint {
#         _name = "example-value" # Reemplazar valor
#         _namespace = "example-value" # Reemplazar valor
#         _labels = {
#             Name = "example-name"
#             Environment = "development"
#         } # Reemplazar valor
#         _annotations = {
#             Name = "example-name"
#             Environment = "development"
#         } # Reemplazar valor
#         _providerConfig = "example-value" # Reemplazar valor
#         _deletionPolicy = "example-value" # Reemplazar valor
#         _managementPolicies = [] # Reemplazar valor
#         _publishConnectionDetailsTo = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _writeConnectionSecretToRef = {
#             name = "example-resource-name"
#         } # Reemplazar valor
#         _dbParameterGroupFamily = "example-value" # Reemplazar valor
#         _dbParameterGroupFamilySelector = {
#             matchControllerRef = True
#             # OR use matchLabels:
#             # matchLabels = {
#             #     key = "value"
#             # }
#         } # Reemplazar valor
#         _description = "example-value" # Reemplazar valor
#         _parameters = [] # Reemplazar valor
#         _region = "example-value" # Reemplazar valor
#         _tags = {
#             Name = "example-name"
#             Environment = "development"
#         } # Reemplazar valor
#     }
# ]
