# --- Blueprint de Alto Nivel (Generado Automáticamente) ---

import modules.database_aws_crossplane_io.v1beta1.database_aws_crossplane_io_v1beta1_RDSInstance as rdsinstance_schema

schema RdsinstanceBlueprint(rdsinstance_schema.Rdsinstance):
    """Este Blueprint simplifica la creación de un recurso Rdsinstance,
    exponiendo una selección inteligente de campos requeridos y opcionales comunes."""

    # Parámetros de entrada simplificados para el usuario
    _name: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _providerConfig: str
    _deletionPolicy?: "Orphan" | "Delete"
    _managementPolicies?: ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _publishConnectionDetailsTo?: rdsinstance_schema.RdsinstancespecPublishconnectiondetailsto
    _writeConnectionSecretToRef?: rdsinstance_schema.RdsinstancespecWriteconnectionsecrettoref
    _allocatedStorage?: int
    _allowMajorVersionUpgrade?: bool
    _applyModificationsImmediately?: bool
    _autoMinorVersionUpgrade?: bool
    _availabilityZone?: str
    _backupRetentionPeriod?: int
    _caCertificateIdentifier?: str
    _characterSetName?: str
    _cloudwatchLogsExportConfiguration?: rdsinstance_schema.RdsinstancespecforproviderCloudwatchlogsexportconfiguration
    _copyTagsToSnapshot?: bool
    _dbClusterIdentifier?: str
    _dbInstanceClass: str
    _dbName?: str
    _dbParameterGroupName?: str
    _dbSecurityGroups?: [str]
    _dbSubnetGroupName?: str
    _dbSubnetGroupNameRef?: rdsinstance_schema.RdsinstancespecforproviderDbsubnetgroupnameref
    _dbSubnetGroupNameSelector?: rdsinstance_schema.RdsinstancespecforproviderDbsubnetgroupnameselector
    _deleteAutomatedBackups?: bool
    _deletionProtection?: bool
    _domain?: str
    _domainIAMRoleName?: str
    _domainIAMRoleNameRef?: rdsinstance_schema.RdsinstancespecforproviderDomainiamrolenameref
    _domainIAMRoleNameSelector?: rdsinstance_schema.RdsinstancespecforproviderDomainiamrolenameselector
    _enableCloudwatchLogsExports?: [str]
    _enableIAMDatabaseAuthentication?: bool
    _enablePerformanceInsights?: bool
    _engine: str
    _engineVersion?: str
    _finalDBSnapshotIdentifier?: str
    _iops?: int
    _kmsKeyId?: str
    _licenseModel?: str
    _masterPasswordSecretRef?: rdsinstance_schema.RdsinstancespecforproviderMasterpasswordsecretref
    _masterUsername?: str
    _maxAllocatedStorage?: int
    _monitoringInterval?: int
    _monitoringRoleArn?: str
    _monitoringRoleArnRef?: rdsinstance_schema.RdsinstancespecforproviderMonitoringrolearnref
    _monitoringRoleArnSelector?: rdsinstance_schema.RdsinstancespecforproviderMonitoringrolearnselector
    _multiAZ?: bool
    _optionGroupName?: str
    _performanceInsightsKMSKeyId?: str
    _performanceInsightsRetentionPeriod?: int
    _port?: int
    _preferredBackupWindow?: str
    _preferredMaintenanceWindow?: str
    _processorFeatures?: [rdsinstance_schema.RdsinstancespecforproviderProcessorfeaturesitem]
    _promotionTier?: int
    _publiclyAccessible?: bool
    _region?: str
    _restoreFrom?: rdsinstance_schema.RdsinstancespecforproviderRestorefrom
    _scalingConfiguration?: rdsinstance_schema.RdsinstancespecforproviderScalingconfiguration
    _skipFinalSnapshotBeforeDeletion?: bool
    _storageEncrypted?: bool
    _storageThroughput?: int
    _storageType?: str
    _tags?: {str:str}
    _timezone?: str
    _useDefaultProcessorFeatures?: bool
    _vpcSecurityGroupIDRefs?: [rdsinstance_schema.RdsinstancespecforproviderVpcsecuritygroupidrefsitem]
    _vpcSecurityGroupIDSelector?: rdsinstance_schema.RdsinstancespecforproviderVpcsecuritygroupidselector
    _vpcSecurityGroupIds?: [str]

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
            allocatedStorage = _allocatedStorage
            allowMajorVersionUpgrade = _allowMajorVersionUpgrade
            applyModificationsImmediately = _applyModificationsImmediately
            autoMinorVersionUpgrade = _autoMinorVersionUpgrade
            availabilityZone = _availabilityZone
            backupRetentionPeriod = _backupRetentionPeriod
            caCertificateIdentifier = _caCertificateIdentifier
            characterSetName = _characterSetName
            cloudwatchLogsExportConfiguration = _cloudwatchLogsExportConfiguration
            copyTagsToSnapshot = _copyTagsToSnapshot
            dbClusterIdentifier = _dbClusterIdentifier
            dbInstanceClass = _dbInstanceClass
            dbName = _dbName
            dbParameterGroupName = _dbParameterGroupName
            dbSecurityGroups = _dbSecurityGroups
            dbSubnetGroupName = _dbSubnetGroupName
            dbSubnetGroupNameRef = _dbSubnetGroupNameRef
            dbSubnetGroupNameSelector = _dbSubnetGroupNameSelector
            deleteAutomatedBackups = _deleteAutomatedBackups
            deletionProtection = _deletionProtection
            domain = _domain
            domainIAMRoleName = _domainIAMRoleName
            domainIAMRoleNameRef = _domainIAMRoleNameRef
            domainIAMRoleNameSelector = _domainIAMRoleNameSelector
            enableCloudwatchLogsExports = _enableCloudwatchLogsExports
            enableIAMDatabaseAuthentication = _enableIAMDatabaseAuthentication
            enablePerformanceInsights = _enablePerformanceInsights
            engine = _engine
            engineVersion = _engineVersion
            finalDBSnapshotIdentifier = _finalDBSnapshotIdentifier
            iops = _iops
            kmsKeyId = _kmsKeyId
            licenseModel = _licenseModel
            masterPasswordSecretRef = _masterPasswordSecretRef
            masterUsername = _masterUsername
            maxAllocatedStorage = _maxAllocatedStorage
            monitoringInterval = _monitoringInterval
            monitoringRoleArn = _monitoringRoleArn
            monitoringRoleArnRef = _monitoringRoleArnRef
            monitoringRoleArnSelector = _monitoringRoleArnSelector
            multiAZ = _multiAZ
            optionGroupName = _optionGroupName
            performanceInsightsKMSKeyId = _performanceInsightsKMSKeyId
            performanceInsightsRetentionPeriod = _performanceInsightsRetentionPeriod
            port = _port
            preferredBackupWindow = _preferredBackupWindow
            preferredMaintenanceWindow = _preferredMaintenanceWindow
            processorFeatures = _processorFeatures
            promotionTier = _promotionTier
            publiclyAccessible = _publiclyAccessible
            region = _region
            restoreFrom = _restoreFrom
            scalingConfiguration = _scalingConfiguration
            skipFinalSnapshotBeforeDeletion = _skipFinalSnapshotBeforeDeletion
            storageEncrypted = _storageEncrypted
            storageThroughput = _storageThroughput
            storageType = _storageType
            tags = [{"key": k, "value": v} for k, v in _tags] if _tags else []
            timezone = _timezone
            useDefaultProcessorFeatures = _useDefaultProcessorFeatures
            vpcSecurityGroupIDRefs = _vpcSecurityGroupIDRefs
            vpcSecurityGroupIDSelector = _vpcSecurityGroupIDSelector
            vpcSecurityGroupIds = _vpcSecurityGroupIds
        }
        providerConfigRef.name = _providerConfig
    }

# --- Ejemplo de Uso ---
# Descomenta y ajusta los valores para usar este Blueprint en tu archivo 'main.k'.
# items = [
#     RdsinstanceBlueprint {
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
#         _managementPolicies = [] # Reemplazar valor
#         _publishConnectionDetailsTo = {
#             # Configure nested fields here
#         } # Reemplazar valor
#         _writeConnectionSecretToRef = {
#             # Configure nested fields here
#         } # Reemplazar valor
#         _allocatedStorage = 1 # Reemplazar valor
#         _allowMajorVersionUpgrade = True # Reemplazar valor
#         _applyModificationsImmediately = True # Reemplazar valor
#         _autoMinorVersionUpgrade = True # Reemplazar valor
#         _availabilityZone = "example-value" # Reemplazar valor
#         _backupRetentionPeriod = 1 # Reemplazar valor
#         _caCertificateIdentifier = "example-value" # Reemplazar valor
#         _characterSetName = "example-value" # Reemplazar valor
#         _cloudwatchLogsExportConfiguration = {
#             # Configure nested fields here
#         } # Reemplazar valor
#         _copyTagsToSnapshot = True # Reemplazar valor
#         _dbClusterIdentifier = "example-value" # Reemplazar valor
#         _dbInstanceClass = "example-value" # Reemplazar valor
#         _dbName = "example-value" # Reemplazar valor
#         _dbParameterGroupName = "example-value" # Reemplazar valor
#         _dbSecurityGroups = [] # Reemplazar valor
#         _dbSubnetGroupName = "example-value" # Reemplazar valor
#         _dbSubnetGroupNameRef = {
#             # Configure nested fields here
#         } # Reemplazar valor
#         _dbSubnetGroupNameSelector = {
#             # Configure nested fields here
#         } # Reemplazar valor
#         _deleteAutomatedBackups = True # Reemplazar valor
#         _deletionProtection = True # Reemplazar valor
#         _domain = "example-value" # Reemplazar valor
#         _domainIAMRoleName = "example-value" # Reemplazar valor
#         _domainIAMRoleNameRef = {
#             # Configure nested fields here
#         } # Reemplazar valor
#         _domainIAMRoleNameSelector = {
#             # Configure nested fields here
#         } # Reemplazar valor
#         _enableCloudwatchLogsExports = [] # Reemplazar valor
#         _enableIAMDatabaseAuthentication = True # Reemplazar valor
#         _enablePerformanceInsights = True # Reemplazar valor
#         _engine = "example-value" # Reemplazar valor
#         _engineVersion = "example-value" # Reemplazar valor
#         _finalDBSnapshotIdentifier = "example-value" # Reemplazar valor
#         _iops = 1 # Reemplazar valor
#         _kmsKeyId = "example-value" # Reemplazar valor
#         _licenseModel = "example-value" # Reemplazar valor
#         _masterPasswordSecretRef = {
#             # Configure nested fields here
#         } # Reemplazar valor
#         _masterUsername = "example-value" # Reemplazar valor
#         _maxAllocatedStorage = 1 # Reemplazar valor
#         _monitoringInterval = 1 # Reemplazar valor
#         _monitoringRoleArn = "example-value" # Reemplazar valor
#         _monitoringRoleArnRef = {
#             # Configure nested fields here
#         } # Reemplazar valor
#         _monitoringRoleArnSelector = {
#             # Configure nested fields here
#         } # Reemplazar valor
#         _multiAZ = True # Reemplazar valor
#         _optionGroupName = "example-value" # Reemplazar valor
#         _performanceInsightsKMSKeyId = "example-value" # Reemplazar valor
#         _performanceInsightsRetentionPeriod = 1 # Reemplazar valor
#         _port = 1 # Reemplazar valor
#         _preferredBackupWindow = "example-value" # Reemplazar valor
#         _preferredMaintenanceWindow = "example-value" # Reemplazar valor
#         _processorFeatures = [] # Reemplazar valor
#         _promotionTier = 1 # Reemplazar valor
#         _publiclyAccessible = True # Reemplazar valor
#         _region = "example-value" # Reemplazar valor
#         _restoreFrom = {
#             # Configure nested fields here
#         } # Reemplazar valor
#         _scalingConfiguration = {
#             # Configure nested fields here
#         } # Reemplazar valor
#         _skipFinalSnapshotBeforeDeletion = True # Reemplazar valor
#         _storageEncrypted = True # Reemplazar valor
#         _storageThroughput = 1 # Reemplazar valor
#         _storageType = "example-value" # Reemplazar valor
#         _tags = {
#             "Key": "Value"
#         } # Reemplazar valor
#         _timezone = "example-value" # Reemplazar valor
#         _useDefaultProcessorFeatures = True # Reemplazar valor
#         _vpcSecurityGroupIDRefs = [] # Reemplazar valor
#         _vpcSecurityGroupIDSelector = {
#             # Configure nested fields here
#         } # Reemplazar valor
#         _vpcSecurityGroupIds = [] # Reemplazar valor
#     }
# ]
