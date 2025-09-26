# --- Blueprint de Alto Nivel (Generado Automáticamente) ---

import modules.opentofu_upbound_io.v1beta1.opentofu_upbound_io_v1beta1_Workspace as workspace_schema

schema WorkspaceBlueprint(workspace_schema.Workspace):
    """Este Blueprint simplifica la creación de un recurso Workspace,
    exponiendo una selección inteligente de campos requeridos y opcionales comunes."""

    # Parámetros de entrada simplificados para el usuario
    _name: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _providerConfig: str
    _deletionPolicy?: "Orphan" | "Delete"
    _managementPolicies?: ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _writeConnectionSecretToRef?: workspace_schema.WorkspacespecWriteconnectionsecrettoref
    _applyArgs?: [str]
    _destroyArgs?: [str]
    _enableTofuCLILogging?: bool
    _entrypoint?: str
    _env?: [workspace_schema.WorkspacespecforproviderEnvitem]
    _initArgs?: [str]
    _inlineFormat?: "HCL" | "JSON"
    _module: str
    _planArgs?: [str]
    _source: "Remote" | "Inline"
    _varFiles?: [workspace_schema.WorkspacespecforproviderVarfilesitem]
    _varmap?: any
    _vars?: [workspace_schema.WorkspacespecforproviderVarsitem]

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
            applyArgs = _applyArgs
            destroyArgs = _destroyArgs
            enableTofuCLILogging = _enableTofuCLILogging
            entrypoint = _entrypoint
            env = _env
            initArgs = _initArgs
            inlineFormat = _inlineFormat
            module = _module
            planArgs = _planArgs
            source = _source
            varFiles = _varFiles
            varmap = _varmap
            vars = _vars
        }
        providerConfigRef.name = _providerConfig
    }

# --- Ejemplo de Uso ---
# Descomenta y ajusta los valores para usar este Blueprint en tu archivo 'main.k'.
# items = [
#     WorkspaceBlueprint {
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
#         _writeConnectionSecretToRef = {
#             name = "example-resource-name"
#         } # Reemplazar valor
#         _applyArgs = [] # Reemplazar valor
#         _destroyArgs = [] # Reemplazar valor
#         _enableTofuCLILogging = True # Reemplazar valor
#         _entrypoint = "example-value" # Reemplazar valor
#         _env = [] # Reemplazar valor
#         _initArgs = [] # Reemplazar valor
#         _inlineFormat = "example-value" # Reemplazar valor
#         _module = "example-value" # Reemplazar valor
#         _planArgs = [] # Reemplazar valor
#         _source = "example-value" # Reemplazar valor
#         _varFiles = [] # Reemplazar valor
#         _varmap = "example-value" # Reemplazar valor
#         _vars = [] # Reemplazar valor
#     }
# ]
