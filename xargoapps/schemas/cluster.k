# --- Blueprint de Alto Nivel (Generado Automáticamente) ---

import modules.cluster_argocd_crossplane_io.v1alpha1.cluster_argocd_crossplane_io_v1alpha1_Cluster as cluster_schema

schema ClusterBlueprint(cluster_schema.Cluster):
    """Este Blueprint simplifica la creación de un recurso Cluster,
    exponiendo una selección inteligente de campos requeridos y opcionales comunes."""

    # Parámetros de entrada simplificados para el usuario
    _name: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _providerConfig: str
    _deletionPolicy?: "Orphan" | "Delete"
    _managementPolicies?: ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef?: cluster_schema.ClusterspecWriteconnectionsecrettoref
    _clusterAnnotations?: {str:str}
    _config: cluster_schema.ClusterspecforproviderConfig
    _clusterLabels?: {str:str}
    _clusterName?: str
    _namespaces?: [str]
    _project?: str
    _server?: str
    _shard?: int

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
        writeConnectionSecretToRef = _writeConnectionSecretToRef
        forProvider = {
            annotations = _clusterAnnotations
            config = _config
            labels = _clusterLabels
            name = _clusterName
            namespaces = _namespaces
            project = _project
            server = _server
            shard = _shard
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
#         _providerConfig = "example-value" # Reemplazar valor
#         _deletionPolicy = "example-value" # Reemplazar valor
#         _managementPolicies = [] # Reemplazar valor
#         _writeConnectionSecretToRef = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _clusterAnnotations = {
#             "Key": "Value"
#         } # Reemplazar valor
#         _config = {
#             # Configure object fields as needed
#         } # Reemplazar valor
#         _clusterLabels = {
#             "Key": "Value"
#         } # Reemplazar valor
#         _clusterName = "example-value" # Reemplazar valor
#         _namespaces = [] # Reemplazar valor
#         _project = "example-value" # Reemplazar valor
#         _server = "example-value" # Reemplazar valor
#         _shard = 1 # Reemplazar valor
#     }
# ]
