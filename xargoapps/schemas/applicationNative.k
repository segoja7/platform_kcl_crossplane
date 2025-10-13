# --- Blueprint de Alto Nivel (Generado Automáticamente) ---

import modules.argoproj_io.v1alpha1.argoproj_io_v1alpha1_Application as application_schema

schema ApplicationBlueprint(application_schema.Application):
    """Este Blueprint simplifica la creación de un recurso Application,
    exponiendo una selección inteligente de campos requeridos y opcionales comunes."""

    # Parámetros de entrada simplificados para el usuario
    _name: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _destination: application_schema.ApplicationspecDestination
    _ignoreDifferences?: [application_schema.ApplicationspecIgnoredifferencesitem]
    _info?: [application_schema.ApplicationspecInfoitem]
    _project: str
    _revisionHistoryLimit?: int
    _source?: application_schema.ApplicationspecSource
    _sourceHydrator?: application_schema.ApplicationspecSourcehydrator
    _sources?: [application_schema.ApplicationspecSourcesitem]
    _syncPolicy?: application_schema.ApplicationspecSyncpolicy

    # Lógica de mapeo de parámetros simples a la estructura compleja
    metadata = {
        name = _name
        namespace = _namespace
        labels = _labels
        annotations = _annotations
    }
    spec = {
        destination = _destination
        ignoreDifferences = _ignoreDifferences
        info = _info
        project = _project
        revisionHistoryLimit = _revisionHistoryLimit
        source = _source
        sourceHydrator = _sourceHydrator
        sources = _sources
        syncPolicy = _syncPolicy
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
#         _destination = {
#             # Configure object fields as needed
#         } # Reemplazar valor
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
