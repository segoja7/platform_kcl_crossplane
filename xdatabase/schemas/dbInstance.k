# --- Blueprint de Alto Nivel (Generado Automáticamente) ---

import modules.rds_aws_crossplane_io.v1alpha1.rds_aws_crossplane_io_v1alpha1_DBInstance as dbinstance_schema

schema DbinstanceBlueprint(dbinstance_schema.Dbinstance):
    """Este Blueprint simplifica la creación de un recurso Dbinstance,
    exponiendo una selección inteligente de campos requeridos y opcionales comunes."""

    # Parámetros de entrada simplificados para el usuario
    _name: str
    _namespace?: str
    _labels?: {str:str}
    _annotations?: {str:str}
    _providerConfig: str
    _deletionPolicy?: "Orphan" | "Delete"
    _managementPolicies?: ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    _publishConnectionDetailsTo?: dbinstance_schema.DbinstancespecPublishconnectiondetailsto
    _writeConnectionSecretToRef?: dbinstance_schema.DbinstancespecWriteconnectionsecrettoref
    _allocatedStorage?: int
    _allowMajorVersionUpgrade?: bool
    _applyImmediately?: bool
    _autoMinorVersionUpgrade?: bool
    _autogeneratePassword?: bool
    _availabilityZone?: str
    _backupRetentionPeriod?: int
    _backupTarget?: str
    _caCertificateIdentifier?: str
    _characterSetName?: str
    _copyTagsToSnapshot?: bool
    _customIAMInstanceProfile?: str
    _dbClusterIdentifier?: str
    _dbClusterIdentifierRef?: dbinstance_schema.DbinstancespecforproviderDbclusteridentifierref
    _dbClusterIdentifierSelector?: dbinstance_schema.DbinstancespecforproviderDbclusteridentifierselector
    _dbInstanceClass: str
    _dbName?: str
    _dbParameterGroupName?: str
    _dbParameterGroupNameRef?: dbinstance_schema.DbinstancespecforproviderDbparametergroupnameref
    _dbParameterGroupNameSelector?: dbinstance_schema.DbinstancespecforproviderDbparametergroupnameselector
    _dbSecurityGroups?: [str]
    _dbSubnetGroupName?: str
    _dbSubnetGroupNameRef?: dbinstance_schema.DbinstancespecforproviderDbsubnetgroupnameref
    _dbSubnetGroupNameSelector?: dbinstance_schema.DbinstancespecforproviderDbsubnetgroupnameselector
    _dbSystemID?: str
    _dedicatedLogVolume?: bool
    _deleteAutomatedBackups?: bool
    _deletionProtection?: bool
    _domain?: str
    _domainAuthSecretARN?: str
    _domainDNSIPs?: [str]
    _domainFqdn?: str
    _domainIAMRoleName?: str
    _domainIAMRoleNameRef?: dbinstance_schema.DbinstancespecforproviderDomainiamrolenameref
    _domainIAMRoleNameSelector?: dbinstance_schema.DbinstancespecforproviderDomainiamrolenameselector
    _domainOu?: str
    _enableCloudwatchLogsExports?: [str]
    _enableCustomerOwnedIP?: bool
    _enableIAMDatabaseAuthentication?: bool
    _enablePerformanceInsights?: bool
    _engine: str
    _engineVersion?: str
    _finalDBSnapshotIdentifier?: str
    _iops?: int
    _kmsKeyID?: str
    _kmsKeyIDRef?: dbinstance_schema.DbinstancespecforproviderKmskeyidref
    _kmsKeyIDSelector?: dbinstance_schema.DbinstancespecforproviderKmskeyidselector
    _licenseModel?: str
    _manageMasterUserPassword?: bool
    _masterUserPasswordSecretRef?: dbinstance_schema.DbinstancespecforproviderMasteruserpasswordsecretref
    _masterUserSecretKMSKeyID?: str
    _masterUsername?: str
    _maxAllocatedStorage?: int
    _monitoringInterval?: int
    _monitoringRoleARN?: str
    _monitoringRoleArnRef?: dbinstance_schema.DbinstancespecforproviderMonitoringrolearnref
    _monitoringRoleArnSelector?: dbinstance_schema.DbinstancespecforproviderMonitoringrolearnselector
    _multiAZ?: bool
    _multiTenant?: bool
    _ncharCharacterSetName?: str
    _networkType?: str
    _optionGroupName?: str
    _performanceInsightsKMSKeyID?: str
    _performanceInsightsRetentionPeriod?: int
    _port?: int
    _preferredBackupWindow?: str
    _preferredMaintenanceWindow?: str
    _processorFeatures?: [dbinstance_schema.DbinstancespecforproviderProcessorfeaturesitem]
    _promotionTier?: int
    _publiclyAccessible?: bool
    _region: str
    _restoreFrom?: dbinstance_schema.DbinstancespecforproviderRestorefrom
    _skipFinalSnapshot?: bool
    _storageEncrypted?: bool
    _storageThroughput?: int
    _storageType?: str
    _tags?: {str:str}
    _tdeCredentialARN?: str
    _tdeCredentialPassword?: str
    _timezone?: str
    _vpcSecurityGroupIDRefs?: [dbinstance_schema.DbinstancespecforproviderVpcsecuritygroupidrefsitem]
    _vpcSecurityGroupIDSelector?: dbinstance_schema.DbinstancespecforproviderVpcsecuritygroupidselector
    _vpcSecurityGroupIDs?: [str]

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
            applyImmediately = _applyImmediately
            autoMinorVersionUpgrade = _autoMinorVersionUpgrade
            autogeneratePassword = _autogeneratePassword
            availabilityZone = _availabilityZone
            backupRetentionPeriod = _backupRetentionPeriod
            backupTarget = _backupTarget
            caCertificateIdentifier = _caCertificateIdentifier
            characterSetName = _characterSetName
            copyTagsToSnapshot = _copyTagsToSnapshot
            customIAMInstanceProfile = _customIAMInstanceProfile
            dbClusterIdentifier = _dbClusterIdentifier
            dbClusterIdentifierRef = _dbClusterIdentifierRef
            dbClusterIdentifierSelector = _dbClusterIdentifierSelector
            dbInstanceClass = _dbInstanceClass
            dbName = _dbName
            dbParameterGroupName = _dbParameterGroupName
            dbParameterGroupNameRef = _dbParameterGroupNameRef
            dbParameterGroupNameSelector = _dbParameterGroupNameSelector
            dbSecurityGroups = _dbSecurityGroups
            dbSubnetGroupName = _dbSubnetGroupName
            dbSubnetGroupNameRef = _dbSubnetGroupNameRef
            dbSubnetGroupNameSelector = _dbSubnetGroupNameSelector
            dbSystemID = _dbSystemID
            dedicatedLogVolume = _dedicatedLogVolume
            deleteAutomatedBackups = _deleteAutomatedBackups
            deletionProtection = _deletionProtection
            domain = _domain
            domainAuthSecretARN = _domainAuthSecretARN
            domainDNSIPs = _domainDNSIPs
            domainFqdn = _domainFqdn
            domainIAMRoleName = _domainIAMRoleName
            domainIAMRoleNameRef = _domainIAMRoleNameRef
            domainIAMRoleNameSelector = _domainIAMRoleNameSelector
            domainOu = _domainOu
            enableCloudwatchLogsExports = _enableCloudwatchLogsExports
            enableCustomerOwnedIP = _enableCustomerOwnedIP
            enableIAMDatabaseAuthentication = _enableIAMDatabaseAuthentication
            enablePerformanceInsights = _enablePerformanceInsights
            engine = _engine
            engineVersion = _engineVersion
            finalDBSnapshotIdentifier = _finalDBSnapshotIdentifier
            iops = _iops
            kmsKeyID = _kmsKeyID
            kmsKeyIDRef = _kmsKeyIDRef
            kmsKeyIDSelector = _kmsKeyIDSelector
            licenseModel = _licenseModel
            manageMasterUserPassword = _manageMasterUserPassword
            masterUserPasswordSecretRef = _masterUserPasswordSecretRef
            masterUserSecretKMSKeyID = _masterUserSecretKMSKeyID
            masterUsername = _masterUsername
            maxAllocatedStorage = _maxAllocatedStorage
            monitoringInterval = _monitoringInterval
            monitoringRoleARN = _monitoringRoleARN
            monitoringRoleArnRef = _monitoringRoleArnRef
            monitoringRoleArnSelector = _monitoringRoleArnSelector
            multiAZ = _multiAZ
            multiTenant = _multiTenant
            ncharCharacterSetName = _ncharCharacterSetName
            networkType = _networkType
            optionGroupName = _optionGroupName
            performanceInsightsKMSKeyID = _performanceInsightsKMSKeyID
            performanceInsightsRetentionPeriod = _performanceInsightsRetentionPeriod
            port = _port
            preferredBackupWindow = _preferredBackupWindow
            preferredMaintenanceWindow = _preferredMaintenanceWindow
            processorFeatures = _processorFeatures
            promotionTier = _promotionTier
            publiclyAccessible = _publiclyAccessible
            region = _region
            restoreFrom = _restoreFrom
            skipFinalSnapshot = _skipFinalSnapshot
            storageEncrypted = _storageEncrypted
            storageThroughput = _storageThroughput
            storageType = _storageType
            tags = [{"key": k, "value": v} for k, v in _tags] if _tags else []
            tdeCredentialARN = _tdeCredentialARN
            tdeCredentialPassword = _tdeCredentialPassword
            timezone = _timezone
            vpcSecurityGroupIDRefs = _vpcSecurityGroupIDRefs
            vpcSecurityGroupIDSelector = _vpcSecurityGroupIDSelector
            vpcSecurityGroupIDs = _vpcSecurityGroupIDs
        }
        providerConfigRef.name = _providerConfig
    }

# --- Ejemplo de Uso ---
# Descomenta y ajusta los valores para usar este Blueprint en tu archivo 'main.k'.
# items = [
#     DbinstanceBlueprint {
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
#         _allocatedStorage = 1 # Reemplazar valor
#         _allowMajorVersionUpgrade = True # Reemplazar valor
#         _applyImmediately = True # Reemplazar valor
#         _autoMinorVersionUpgrade = True # Reemplazar valor
#         _autogeneratePassword = True # Reemplazar valor
#         _availabilityZone = "example-value" # Reemplazar valor
#         _backupRetentionPeriod = 1 # Reemplazar valor
#         _backupTarget = "example-value" # Reemplazar valor
#         _caCertificateIdentifier = "example-value" # Reemplazar valor
#         _characterSetName = "example-value" # Reemplazar valor
#         _copyTagsToSnapshot = True # Reemplazar valor
#         _customIAMInstanceProfile = "example-value" # Reemplazar valor
#         _dbClusterIdentifier = "example-value" # Reemplazar valor
#         _dbClusterIdentifierRef = {
#             name = "example-resource-name"
#         } # Reemplazar valor
#         _dbClusterIdentifierSelector = {
#             matchControllerRef = True
#             # OR use matchLabels:
#             # matchLabels = {
#             #     key = "value"
#             # }
#         } # Reemplazar valor
#         _dbInstanceClass = "example-value" # Reemplazar valor
#         _dbName = "example-value" # Reemplazar valor
#         _dbParameterGroupName = "example-value" # Reemplazar valor
#         _dbParameterGroupNameRef = {
#             name = "example-resource-name"
#         } # Reemplazar valor
#         _dbParameterGroupNameSelector = {
#             matchControllerRef = True
#             # OR use matchLabels:
#             # matchLabels = {
#             #     key = "value"
#             # }
#         } # Reemplazar valor
#         _dbSecurityGroups = [] # Reemplazar valor
#         _dbSubnetGroupName = "example-value" # Reemplazar valor
#         _dbSubnetGroupNameRef = {
#             name = "example-resource-name"
#         } # Reemplazar valor
#         _dbSubnetGroupNameSelector = {
#             matchControllerRef = True
#             # OR use matchLabels:
#             # matchLabels = {
#             #     key = "value"
#             # }
#         } # Reemplazar valor
#         _dbSystemID = "example-value" # Reemplazar valor
#         _dedicatedLogVolume = True # Reemplazar valor
#         _deleteAutomatedBackups = True # Reemplazar valor
#         _deletionProtection = True # Reemplazar valor
#         _domain = "example-value" # Reemplazar valor
#         _domainAuthSecretARN = "example-value" # Reemplazar valor
#         _domainDNSIPs = [] # Reemplazar valor
#         _domainFqdn = "example-value" # Reemplazar valor
#         _domainIAMRoleName = "example-value" # Reemplazar valor
#         _domainIAMRoleNameRef = {
#             name = "example-resource-name"
#         } # Reemplazar valor
#         _domainIAMRoleNameSelector = {
#             matchControllerRef = True
#             # OR use matchLabels:
#             # matchLabels = {
#             #     key = "value"
#             # }
#         } # Reemplazar valor
#         _domainOu = "example-value" # Reemplazar valor
#         _enableCloudwatchLogsExports = [] # Reemplazar valor
#         _enableCustomerOwnedIP = True # Reemplazar valor
#         _enableIAMDatabaseAuthentication = True # Reemplazar valor
#         _enablePerformanceInsights = True # Reemplazar valor
#         _engine = "example-value" # Reemplazar valor
#         _engineVersion = "example-value" # Reemplazar valor
#         _finalDBSnapshotIdentifier = "example-value" # Reemplazar valor
#         _iops = 1 # Reemplazar valor
#         _kmsKeyID = "example-value" # Reemplazar valor
#         _kmsKeyIDRef = {
#             name = "example-resource-name"
#         } # Reemplazar valor
#         _kmsKeyIDSelector = {
#             matchControllerRef = True
#             # OR use matchLabels:
#             # matchLabels = {
#             #     key = "value"
#             # }
#         } # Reemplazar valor
#         _licenseModel = "example-value" # Reemplazar valor
#         _manageMasterUserPassword = True # Reemplazar valor
#         _masterUserPasswordSecretRef = {
#             name = "example-resource-name"
#         } # Reemplazar valor
#         _masterUserSecretKMSKeyID = "example-value" # Reemplazar valor
#         _masterUsername = "example-value" # Reemplazar valor
#         _maxAllocatedStorage = 1 # Reemplazar valor
#         _monitoringInterval = 1 # Reemplazar valor
#         _monitoringRoleARN = "example-value" # Reemplazar valor
#         _monitoringRoleArnRef = {
#             name = "example-resource-name"
#         } # Reemplazar valor
#         _monitoringRoleArnSelector = {
#             matchControllerRef = True
#             # OR use matchLabels:
#             # matchLabels = {
#             #     key = "value"
#             # }
#         } # Reemplazar valor
#         _multiAZ = True # Reemplazar valor
#         _multiTenant = True # Reemplazar valor
#         _ncharCharacterSetName = "example-value" # Reemplazar valor
#         _networkType = "example-value" # Reemplazar valor
#         _optionGroupName = "example-value" # Reemplazar valor
#         _performanceInsightsKMSKeyID = "example-value" # Reemplazar valor
#         _performanceInsightsRetentionPeriod = 1 # Reemplazar valor
#         _port = 1 # Reemplazar valor
#         _preferredBackupWindow = "example-value" # Reemplazar valor
#         _preferredMaintenanceWindow = "example-value" # Reemplazar valor
#         _processorFeatures = [] # Reemplazar valor
#         _promotionTier = 1 # Reemplazar valor
#         _publiclyAccessible = True # Reemplazar valor
#         _region = "example-value" # Reemplazar valor
#         _restoreFrom = {
#             name = "example-resource-name"
#         } # Reemplazar valor
#         _skipFinalSnapshot = True # Reemplazar valor
#         _storageEncrypted = True # Reemplazar valor
#         _storageThroughput = 1 # Reemplazar valor
#         _storageType = "example-value" # Reemplazar valor
#         _tags = {
#             Name = "example-name"
#             Environment = "development"
#         } # Reemplazar valor
#         _tdeCredentialARN = "example-value" # Reemplazar valor
#         _tdeCredentialPassword = "example-value" # Reemplazar valor
#         _timezone = "example-value" # Reemplazar valor
#         _vpcSecurityGroupIDRefs = [] # Reemplazar valor
#         _vpcSecurityGroupIDSelector = {
#             matchControllerRef = True
#             # OR use matchLabels:
#             # matchLabels = {
#             #     key = "value"
#             # }
#         } # Reemplazar valor
#         _vpcSecurityGroupIDs = [] # Reemplazar valor
#     }
# ]
