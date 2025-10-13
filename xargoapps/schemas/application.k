# --- Blueprint de Alto Nivel (Generado Automáticamente) ---

import modules.applications_argocd_crossplane_io.v1alpha1.applications_argocd_crossplane_io_v1alpha1_Application as application_schema

schema CrossplaneApplicationBlueprint(application_schema.Application):
    """Este Blueprint simplifica la creación de un recurso Application,
    exponiendo una selección inteligente de campos requeridos y opcionales comunes."""

    # Parámetros de entrada simplificados para el usuario
    _name: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _providerConfig: str
    _deletionPolicy?: "Orphan" | "Delete"
    _managementPolicies?: ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _publishConnectionDetailsTo?: application_schema.ApplicationspecPublishconnectiondetailsto
    _writeConnectionSecretToRef?: application_schema.ApplicationspecWriteconnectionsecrettoref
    _applicationAnnotations?: {str:str}
    _appNamespace?: str
    _deleteCascade?: bool
    _deletePropagationPolicy?: str
    _destination: application_schema.ApplicationspecforproviderDestination
    _finalizers?: [str]
    _ignoreDifferences?: [application_schema.ApplicationspecforproviderIgnoredifferencesitem]
    _info?: [application_schema.ApplicationspecforproviderInfoitem]
    _project: str
    _revisionHistoryLimit?: int
    _source?: application_schema.ApplicationspecforproviderSource
    _sourceHydrator?: application_schema.ApplicationspecforproviderSourcehydrator
    _sources?: [application_schema.ApplicationspecforproviderSourcesitem]
    _syncPolicy?: application_schema.ApplicationspecforproviderSyncpolicy

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
            annotations = _applicationAnnotations
            appNamespace = _appNamespace
            deleteCascade = _deleteCascade
            deletePropagationPolicy = _deletePropagationPolicy
            destination = _destination
            finalizers = _finalizers
            ignoreDifferences = _ignoreDifferences
            info = _info
            project = _project
            revisionHistoryLimit = _revisionHistoryLimit
            source = _source
            sourceHydrator = _sourceHydrator
            sources = _sources
            syncPolicy = _syncPolicy
        }
        providerConfigRef.name = _providerConfig
    }

# --- Ejemplo de Uso ---
# Descomenta y ajusta los valores para usar este Blueprint en tu archivo 'main.k'.
# items = [
#     ApplicationBlueprint {
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
#         _providerConfig = "example-value" # Reemplazar valor
#         _deletionPolicy = "example-value" # Reemplazar valor
#         _managementPolicies = [] # Reemplazar valor
#         _publishConnectionDetailsTo = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _writeConnectionSecretToRef = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _applicationAnnotations = {
#             "Key": "Value"
#         } # Reemplazar valor
#         _appNamespace = "example-value" # Reemplazar valor
#         _deleteCascade = True # Reemplazar valor
#         _deletePropagationPolicy = "example-value" # Reemplazar valor
#         _destination = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _finalizers = [] # Reemplazar valor
#         _ignoreDifferences = [] # Reemplazar valor
#         _info = [] # Reemplazar valor
#         _project = "example-value" # Reemplazar valor
#         _revisionHistoryLimit = 1 # Reemplazar valor
#         _source = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _sourceHydrator = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _sources = [] # Reemplazar valor
#         _syncPolicy = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#     }
# ]
