# --- Blueprint de Alto Nivel (Generado Automáticamente) ---

import modules.database_aws_crossplane_io.v1beta1.database_aws_crossplane_io_v1beta1_DBSubnetGroup as dbsubnetgroup_schema

schema DbsubnetgroupBlueprint(dbsubnetgroup_schema.Dbsubnetgroup):
    """Este Blueprint simplifica la creación de un recurso Dbsubnetgroup,
    exponiendo una selección inteligente de campos requeridos y opcionales comunes."""

    # Parámetros de entrada simplificados para el usuario
    _name: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _providerConfig: str
    _deletionPolicy?: "Orphan" | "Delete"
    _managementPolicies?: ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _publishConnectionDetailsTo?: dbsubnetgroup_schema.DbsubnetgroupspecPublishconnectiondetailsto
    _writeConnectionSecretToRef?: dbsubnetgroup_schema.DbsubnetgroupspecWriteconnectionsecrettoref
    _description: str
    _region?: str
    _subnetIdRefs?: [dbsubnetgroup_schema.DbsubnetgroupspecforproviderSubnetidrefsitem]
    _subnetIdSelector?: dbsubnetgroup_schema.DbsubnetgroupspecforproviderSubnetidselector
    _subnetIds?: [str]
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
            description = _description
            region = _region
            subnetIdRefs = _subnetIdRefs
            subnetIdSelector = _subnetIdSelector
            subnetIds = _subnetIds
            tags = [{"key": k, "value": v} for k, v in _tags] if _tags else []
        }
        providerConfigRef.name = _providerConfig
    }

# --- Ejemplo de Uso ---
# Descomenta y ajusta los valores para usar este Blueprint en tu archivo 'main.k'.
items = [
    DbsubnetgroupBlueprint {
        _name = "example-value" # Reemplazar valor
        _namespace = "example-value" # Reemplazar valor
        _labels = {
            Name = "example-name"
            Environment = "development"
        } # Reemplazar valor
        _annotations = {
            Name = "example-name"
            Environment = "development"
        } # Reemplazar valor
        _providerConfig = "example-value" # Reemplazar valor
#        _deletionPolicy = "example-value" # Reemplazar valor
        _managementPolicies = [] # Reemplazar valor
        # _publishConnectionDetailsTo = {
        #     # Configure object fields as needed
        # } # Reemplazar valor
        # _writeConnectionSecretToRef = {
        #     name = "example-resource-name"
        # } # Reemplazar valor
        _description = "example-value" # Reemplazar valor
        _region = "example-value" # Reemplazar valor
        _subnetIdRefs = [] # Reemplazar valor
        _subnetIdSelector = {
            matchControllerRef = True
            # OR use matchLabels:
            # matchLabels = {
            #     key = "value"
            # }
        } # Reemplazar valor
        _subnetIds = [] # Reemplazar valor
        _tags = {
            Name = "example-name"
            Environment = "development"
        } # Reemplazar valor
    }
]
