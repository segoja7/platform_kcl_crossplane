"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.

It is based on the provided OpenAPI v2 JSON schema.

DO NOT EDIT MANUALLY.
"""

schema Rdsinstance:
    """
    An RDSInstance is a managed resource that represents an AWS Relational
    Database Service instance.

    Attributes
    ----------
    apiVersion : str, optional
        APIVersion defines the versioned schema of this representation of an object.
        Servers should convert recognized schemas to the latest internal value, and
        may reject unrecognized values.
        More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    kind : str, optional
        Kind is a string value representing the REST resource this object represents.
        Servers may infer this from the endpoint the client submits requests to.
        Cannot be updated.
        In CamelCase.
        More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata : any, optional
        No description available.
    spec : RdsinstanceSpec, required
        An RDSInstanceSpec defines the desired state of an RDSInstance.
    status : RdsinstanceStatus, optional
        An RDSInstanceStatus represents the observed state of an RDSInstance.
    """
    apiVersion : str = "database.aws.crossplane.io/v1beta1"
    kind : str = "RDSInstance"
    metadata? : any
    spec : RdsinstanceSpec
    status? : RdsinstanceStatus

schema RdsinstanceSpec:
    """
    An RDSInstanceSpec defines the desired state of an RDSInstance.

    Attributes
    ----------
    deletionPolicy : "Orphan" | "Delete", optional
        DeletionPolicy specifies what will happen to the underlying external
        when this managed resource is deleted - either "Delete" or "Orphan" the
        external resource.
        This field is planned to be deprecated in favor of the ManagementPolicies
        field in a future release. Currently, both could be set independently and
        non-default values would be honored if the feature flag is enabled.
        See the design doc for more information: https://github.com/crossplane/crossplane/blob/499895a25d1a1a0ba1604944ef98ac7a1a71f197/design/design-doc-observe-only-resources.md?plain=1#L223
    forProvider : RdsinstancespecForprovider, required
        RDSInstanceParameters define the desired state of an AWS Relational Database
        Service instance.
    managementPolicies : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"], optional
        THIS IS A BETA FIELD. It is on by default but can be opted out
        through a Crossplane feature flag.
        ManagementPolicies specify the array of actions Crossplane is allowed to
        take on the managed and external resources.
        This field is planned to replace the DeletionPolicy field in a future
        release. Currently, both could be set independently and non-default
        values would be honored if the feature flag is enabled. If both are
        custom, the DeletionPolicy field will be ignored.
        See the design doc for more information: https://github.com/crossplane/crossplane/blob/499895a25d1a1a0ba1604944ef98ac7a1a71f197/design/design-doc-observe-only-resources.md?plain=1#L223
        and this one: https://github.com/crossplane/crossplane/blob/444267e84783136daa93568b364a5f01228cacbe/design/one-pager-ignore-changes.md
    providerConfigRef : RdsinstancespecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    publishConnectionDetailsTo : RdsinstancespecPublishconnectiondetailsto, optional
        PublishConnectionDetailsTo specifies the connection secret config which
        contains a name, metadata and a reference to secret store config to
        which any connection details for this managed resource should be written.
        Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    writeConnectionSecretToRef : RdsinstancespecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
        This field is planned to be replaced in a future release in favor of
        PublishConnectionDetailsTo. Currently, both could be set independently
        and connection details would be published to both without affecting
        each other.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : RdsinstancespecForprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : RdsinstancespecProviderconfigref
    publishConnectionDetailsTo? : RdsinstancespecPublishconnectiondetailsto
    writeConnectionSecretToRef? : RdsinstancespecWriteconnectionsecrettoref

schema RdsinstancespecForprovider:
    """
    RDSInstanceParameters define the desired state of an AWS Relational Database
    Service instance.

    Attributes
    ----------
    allocatedStorage : int, optional
        AllocatedStorage is the amount of storage (in gibibytes) to allocate for the DB instance.
        Type: Integer
        Amazon Aurora
        Not applicable. Aurora cluster volumes automatically grow as the amount of
        data in your database increases, though you are only charged for the space
        that you use in an Aurora cluster volume.
        MySQL
        Constraints to the amount of storage for each storage type are the following:
           * General Purpose (SSD) storage (gp2): Must be an integer from 20 to 16384.
           * Provisioned IOPS storage (io1): Must be an integer from 100 to 16384.
           * Magnetic storage (standard): Must be an integer from 5 to 3072.
        MariaDB
        Constraints to the amount of storage for each storage type are the following:
           * General Purpose (SSD) storage (gp2): Must be an integer from 20 to 16384.
           * Provisioned IOPS storage (io1): Must be an integer from 100 to 16384.
           * Magnetic storage (standard): Must be an integer from 5 to 3072.
        PostgreSQL
        Constraints to the amount of storage for each storage type are the following:
           * General Purpose (SSD) storage (gp2): Must be an integer from 20 to 16384.
           * Provisioned IOPS storage (io1): Must be an integer from 100 to 16384.
           * Magnetic storage (standard): Must be an integer from 5 to 3072.
        Oracle
        Constraints to the amount of storage for each storage type are the following:
           * General Purpose (SSD) storage (gp2): Must be an integer from 20 to 16384.
           * Provisioned IOPS storage (io1): Must be an integer from 100 to 16384.
           * Magnetic storage (standard): Must be an integer from 10 to 3072.
        SQL Server
        Constraints to the amount of storage for each storage type are the following:
           * General Purpose (SSD) storage (gp2):
        Enterprise and Standard editions: Must be an integer from 200 to 16384.
        Web and Express editions: Must be an integer from 20 to 16384.
           * Provisioned IOPS storage (io1):
        Enterprise and Standard editions: Must be an integer from 200 to 16384.
        Web and Express editions: Must be an integer from 100 to 16384.
           * Magnetic storage (standard):
        Enterprise and Standard editions: Must be an integer from 200 to 1024.
        Web and Express editions: Must be an integer from 20 to 1024.
    allowMajorVersionUpgrade : bool, optional
        AllowMajorVersionUpgrade indicates that major version upgrades are allowed. Changing this parameter
        doesn't result in an outage and the change is asynchronously applied as soon
        as possible.
        Constraints: This parameter must be set to true when specifying a value for
        the EngineVersion parameter that is a different major version than the DB
        instance's current version.
    applyModificationsImmediately : bool, optional
        ApplyModificationsImmediately specifies whether the modifications in this request and any pending modifications
        are asynchronously applied as soon as possible, regardless of the PreferredMaintenanceWindow
        setting for the DB instance.
        If this parameter is set to false, changes to the DB instance are applied
        during the next maintenance window. Some parameter changes can cause an outage
        and are applied on the next call to RebootDBInstance, or the next failure
        reboot. Review the table of parameters in Modifying a DB Instance and Using
        the Apply Immediately Parameter (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.DBInstance.Modifying.html)
        in the Amazon RDS User Guide. to see the impact that setting ApplyImmediately
        to true or false has for each modified parameter and to determine when the
        changes are applied.
        Default: false
    autoMinorVersionUpgrade : bool, optional
        AutoMinorVersionUpgrade indicates that minor engine upgrades are applied automatically to the DB
        instance during the maintenance window.
        Default: true
    availabilityZone : str, optional
        AvailabilityZone is the EC2 Availability Zone that the DB instance is created in. For information
        on AWS Regions and Availability Zones, see Regions and Availability Zones
        (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html).
        Default: A random, system-chosen Availability Zone in the endpoint's AWS
        Region.
        Example: us-east-1d
        Constraint: The AvailabilityZone parameter is ignored if the MultiAZ
        is set to true.
        The specified Availability Zone must be in the
        same AWS Region as the current endpoint.
    backupRetentionPeriod : int, optional
        BackupRetentionPeriod is the number of days for which automated backups are retained. Setting this
        parameter to a positive number enables backups. Setting this parameter to
        0 disables automated backups.
        Amazon Aurora
        Not applicable. The retention period for automated backups is managed by
        the DB cluster. For more information, see CreateDBCluster.
        Default: 1
        Constraints:
           * Must be a value from 0 to 35
           * Cannot be set to 0 if the DB instance is a source to Read Replicas
    caCertificateIdentifier : str, optional
        CACertificateIdentifier indicates the certificate that needs to be associated with the instance.
    characterSetName : str, optional
        CharacterSetName indicates that the DB instance should be associated
        with the specified CharacterSet for supported engines,
        Amazon Aurora
        Not applicable. The character set is managed by the DB cluster. For more
        information, see CreateDBCluster.
    cloudwatchLogsExportConfiguration : RdsinstancespecforproviderCloudwatchlogsexportconfiguration, optional
        Deprecated: This field will be removed. Use `enableCloudwatchLogsExports` instead.
        CloudwatchLogsExportConfiguration is the configuration setting for the log types to be enabled for export to CloudWatch
        Logs for a specific DB instance.
    copyTagsToSnapshot : bool, optional
        CopyTagsToSnapshot should be true to copy all tags from the DB instance to snapshots of the DB instance,
        and otherwise false. The default is false.
    dbClusterIdentifier : str, optional
        DBClusterIdentifier is the identifier of the DB cluster that the instance will belong to.
        For information on creating a DB cluster, see CreateDBCluster.
        Type: String
    dbInstanceClass : str, required
        DBInstanceClass is the compute and memory capacity of the DB instance, for example, db.m4.large.
        Not all DB instance classes are available in all AWS Regions, or for all
        database engines. For the full list of DB instance classes, and availability
        for your engine, see DB Instance Class (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html)
        in the Amazon RDS User Guide.
    dbName : str, optional
        DBName is the meaning of this parameter differs according to the database engine you
        use.
        Type: String
        MySQL
        The name of the database to create when the DB instance is created. If this
        parameter is not specified, no database is created in the DB instance.
        Constraints:
           * Must contain 1 to 64 letters or numbers.
           * Cannot be a word reserved by the specified database engine
        MariaDB
        The name of the database to create when the DB instance is created. If this
        parameter is not specified, no database is created in the DB instance.
        Constraints:
           * Must contain 1 to 64 letters or numbers.
           * Cannot be a word reserved by the specified database engine
        PostgreSQL
        The name of the database to create when the DB instance is created. If this
        parameter is not specified, the default "postgres" database is created in
        the DB instance.
        Constraints:
           * Must contain 1 to 63 letters, numbers, or underscores.
           * Must begin with a letter or an underscore. Subsequent characters can
           be letters, underscores, or digits (0-9).
           * Cannot be a word reserved by the specified database engine
        Oracle
        The Oracle System ID (SID) of the created DB instance. If you specify null,
        the default value ORCL is used. You can't specify the string NULL, or any
        other reserved word, for DBName.
        Default: ORCL
        Constraints:
           * Cannot be longer than 8 characters
        SQL Server
        Not applicable. Must be null.
        Amazon Aurora
        The name of the database to create when the primary instance of the DB cluster
        is created. If this parameter is not specified, no database is created in
        the DB instance.
        Constraints:
           * Must contain 1 to 64 letters or numbers.
           * Cannot be a word reserved by the specified database engine
    dbParameterGroupName : str, optional
        DBParameterGroupName is the name of the DB parameter group to associate with this DB instance. If
        this argument is omitted, the default DBParameterGroup for the specified
        engine is used.
        Constraints:
           * Must be 1 to 255 letters, numbers, or hyphens.
           * First character must be a letter
           * Cannot end with a hyphen or contain two consecutive hyphens
    dbSecurityGroups : [str], optional
        DBSecurityGroups is a list of DB security groups to associate with this DB instance.
        Default: The default DB security group for the database engine.
    dbSubnetGroupName : str, optional
        DBSubnetGroupName is a DB subnet group to associate with this DB instance.
        If there is no DB subnet group, then it is a non-VPC DB instance.
    dbSubnetGroupNameRef : RdsinstancespecforproviderDbsubnetgroupnameref, optional
        DBSubnetGroupNameRef is a reference to a DBSubnetGroup used to set
        DBSubnetGroupName.
    dbSubnetGroupNameSelector : RdsinstancespecforproviderDbsubnetgroupnameselector, optional
        DBSubnetGroupNameSelector selects a reference to a DBSubnetGroup used to
        set DBSubnetGroupName.
    deleteAutomatedBackups : bool, optional
        DeleteAutomatedBackups indicates whether to remove automated backups
        immediately after the DB instance is deleted. The default is to
        remove automated backups immediately after the DB instance is
        deleted.
    deletionProtection : bool, optional
        DeletionProtection indicates if the DB instance should have deletion protection enabled. The
        database can't be deleted when this value is set to true. The default is
        false. For more information, see  Deleting a DB Instance (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html).
    domain : str, optional
        Domain specifies the Active Directory Domain to create the instance in.
    domainIAMRoleName : str, optional
        DomainIAMRoleName specifies the name of the IAM role to be used when making API calls to the
        Directory Service.
    domainIAMRoleNameRef : RdsinstancespecforproviderDomainiamrolenameref, optional
        DomainIAMRoleNameRef is a reference to an IAMRole used to set
        DomainIAMRoleName.
    domainIAMRoleNameSelector : RdsinstancespecforproviderDomainiamrolenameselector, optional
        DomainIAMRoleNameSelector selects a reference to an IAMRole used to set
        DomainIAMRoleName.
    enableCloudwatchLogsExports : [str], optional
        EnableCloudwatchLogsExports is the list of log types that need to be enabled for exporting to CloudWatch
        Logs. The values in the list depend on the DB engine being used. For more
        information, see Publishing Database Logs to Amazon CloudWatch Logs  (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch)
        in the Amazon Relational Database Service User Guide.
    enableIAMDatabaseAuthentication : bool, optional
        EnableIAMDatabaseAuthentication should be true to enable mapping of AWS Identity and Access Management (IAM) accounts
        to database accounts, and otherwise false.
        You can enable IAM database authentication for the following database engines:
        Amazon Aurora
        Not applicable. Mapping AWS IAM accounts to database accounts is managed
        by the DB cluster. For more information, see CreateDBCluster.
        MySQL
           * For MySQL 5.6, minor version 5.6.34 or higher
           * For MySQL 5.7, minor version 5.7.16 or higher
        Default: false
    enablePerformanceInsights : bool, optional
        EnablePerformanceInsights should be true to enable Performance Insights for the DB instance, and otherwise false.
        For more information, see Using Amazon Performance Insights (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html)
        in the Amazon Relational Database Service User Guide.
    engine : str, required
        Engine is the name of the database engine to be used for this instance.
        Not every database engine is available for every AWS Region.
        Valid Values:
           * aurora (for MySQL 5.6-compatible Aurora)
           * aurora-mysql (for MySQL 5.7-compatible Aurora)
           * aurora-postgresql
           * mariadb
           * mysql
           * oracle-ee
           * oracle-se2
           * oracle-se1
           * oracle-se
           * postgres
           * sqlserver-ee
           * sqlserver-se
           * sqlserver-ex
           * sqlserver-web
        Engine is a required field
    engineVersion : str, optional
        EngineVersion is the version number of the database engine to use.
        For a list of valid engine versions, call DescribeDBEngineVersions.
        The following are the database engines and links to information about the
        major and minor versions that are available with Amazon RDS. Not every database
        engine is available for every AWS Region.
        Amazon Aurora
        Not applicable. The version number of the database engine to be used by the
        DB instance is managed by the DB cluster. For more information, see CreateDBCluster.
        MariaDB
        See MariaDB on Amazon RDS Versions (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MariaDB.html#MariaDB.Concepts.VersionMgmt)
        in the Amazon RDS User Guide.
        Microsoft SQL Server
        See Version and Feature Support on Amazon RDS (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.FeatureSupport)
        in the Amazon RDS User Guide.
        MySQL
        See MySQL on Amazon RDS Versions (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt)
        in the Amazon RDS User Guide.
        Oracle
        See Oracle Database Engine Release Notes (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.Oracle.PatchComposition.html)
        in the Amazon RDS User Guide.
        PostgreSQL
        See Supported PostgreSQL Database Versions (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts.General.DBVersions)
        in the Amazon RDS User Guide.

        Note: Downgrades are not allowed by AWS and attempts to set a lower version
        will be ignored.
    finalDBSnapshotIdentifier : str, optional
        The DBSnapshotIdentifier of the new DBSnapshot created when SkipFinalSnapshot
        is set to false.
        Specifying this parameter and also setting the SkipFinalShapshot parameter
        to true results in an error.
        Constraints:
           * Must be 1 to 255 letters or numbers.
           * First character must be a letter
           * Cannot end with a hyphen or contain two consecutive hyphens
           * Cannot be specified when deleting a Read Replica.
    iops : int, optional
        IOPS is the amount of Provisioned IOPS (input/output operations per second) to be
        initially allocated for the DB instance. For information about valid IOPS
        values, see Amazon RDS Provisioned IOPS Storage to Improve Performance
        (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#USER_PIOPS)
        in the Amazon RDS User Guide.
        Constraints: Must be a multiple between 1 and 50 of the storage amount for
        the DB instance. Must also be an integer multiple of 1000. For example, if
        the size of your DB instance is 500 GiB, then your IOPS value can be 2000,
        3000, 4000, or 5000.

        For valid IOPS values on DB instances with storage type "gp3",
        see https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#gp3-storage.

        Note: controller considers 0 and null as equivalent
    kmsKeyId : str, optional
        KMSKeyID for an encrypted DB instance.
        The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption
        key. If you are creating a DB instance with the same AWS account that owns
        the KMS encryption key used to encrypt the new DB instance, then you can
        use the KMS key alias instead of the ARN for the KM encryption key.
        Amazon Aurora
        Not applicable. The KMS key identifier is managed by the DB cluster. For
        more information, see CreateDBCluster.
        If the StorageEncrypted parameter is true, and you do not specify a value
        for the KMSKeyID parameter, then Amazon RDS will use your default encryption
        key. AWS KMS creates the default encryption key for your AWS account. Your
        AWS account has a different default encryption key for each AWS Region.
    licenseModel : str, optional
        LicenseModel information for this DB instance.
        Valid values: license-included | bring-your-own-license | general-public-license
    masterPasswordSecretRef : RdsinstancespecforproviderMasterpasswordsecretref, optional
        MasterPasswordSecretRef references the secret that contains the password used
        in the creation of this RDS instance. If no reference is given, a password
        will be auto-generated.
    masterUsername : str, optional
        MasterUsername is the name for the master user.
        Amazon Aurora
        Not applicable. The name for the master user is managed by the DB cluster.
        For more information, see CreateDBCluster.

        Constraints:

           * Must be 1 to 16 letters or numbers.

           * First character must be a letter.

           * Can't be a reserved word for the chosen database engine.
    maxAllocatedStorage : int, optional
        The upper limit to which Amazon RDS can automatically scale the storage of
        the DB instance.

        For more information about this setting, including limitations that apply
        to it, see Managing capacity automatically with Amazon RDS storage autoscaling
        (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PIOPS.StorageTypes.html#USER_PIOPS.Autoscaling)
        in the Amazon RDS User Guide.
    monitoringInterval : int, optional
        MonitoringInterval is the interval, in seconds, between points when Enhanced Monitoring metrics
        are collected for the DB instance. To disable collecting Enhanced Monitoring
        metrics, specify 0. The default is 0.
        If MonitoringRoleARN is specified, then you must also set MonitoringInterval
        to a value other than 0.
        Valid Values: 0, 1, 5, 10, 15, 30, 60
    monitoringRoleArn : str, optional
        MonitoringRoleARN is the ARN for the IAM role that permits RDS to send enhanced monitoring metrics
        to Amazon CloudWatch Logs. For example, arn:aws:iam:123456789012:role/emaccess.
        For information on creating a monitoring role, go to Setting Up and Enabling
        Enhanced Monitoring (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html#USER_Monitoring.OS.Enabling)
        in the Amazon RDS User Guide.
        If MonitoringInterval is set to a value other than 0, then you must supply
        a MonitoringRoleARN value.
    monitoringRoleArnRef : RdsinstancespecforproviderMonitoringrolearnref, optional
        MonitoringRoleARNRef is a reference to an IAMRole used to set
        MonitoringRoleARN.
    monitoringRoleArnSelector : RdsinstancespecforproviderMonitoringrolearnselector, optional
        MonitoringRoleARNSelector selects a reference to an IAMRole used to set
        MonitoringRoleARN.
    multiAZ : bool, optional
        MultiAZ specifies if the DB instance is a Multi-AZ deployment. You can't set the
        AvailabilityZone parameter if the MultiAZ parameter is set to true.
    optionGroupName : str, optional
        OptionGroupName indicates that the DB instance should be associated with the specified option
        group.
        Permanent options, such as the TDE option for Oracle Advanced Security TDE,
        can't be removed from an option group, and that option group can't be removed
        from a DB instance once it is associated with a DB instance
    performanceInsightsKMSKeyId : str, optional
        PerformanceInsightsKMSKeyID is the AWS KMS key identifier for encryption of Performance Insights data. The
        KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or the
        KMS key alias for the KMS encryption key.
    performanceInsightsRetentionPeriod : int, optional
        PerformanceInsightsRetentionPeriod is the amount of time, in days, to
        retain Performance Insights data. Valid values
        are 7 or 731 (2 years).
    port : int, optional
        Port number on which the database accepts connections.
        MySQL
        Default: 3306
        Valid Values: 1150-65535
        Type: Integer
        MariaDB
        Default: 3306
        Valid Values: 1150-65535
        Type: Integer
        PostgreSQL
        Default: 5432
        Valid Values: 1150-65535
        Type: Integer
        Oracle
        Default: 1521
        Valid Values: 1150-65535
        SQL Server
        Default: 1433
        Valid Values: 1150-65535 except for 1434, 3389, 47001, 49152, and 49152 through
        49156.
        Amazon Aurora
        Default: 3306
        Valid Values: 1150-65535
        Type: Integer
    preferredBackupWindow : str, optional
        PreferredBackupWindow is the daily time range during which automated backups are created if automated
        backups are enabled, using the BackupRetentionPeriod parameter. For more
        information, see The Backup Window (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow)
        in the Amazon RDS User Guide.
        Amazon Aurora
        Not applicable. The daily time range for creating automated backups is managed
        by the DB cluster. For more information, see CreateDBCluster.
        The default is a 30-minute window selected at random from an 8-hour block
        of time for each AWS Region. To see the time blocks available, see  Adjusting
        the Preferred DB Instance Maintenance Window (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow)
        in the Amazon RDS User Guide.
        Constraints:
           * Must be in the format hh24:mi-hh24:mi.
           * Must be in Universal Coordinated Time (UTC).
           * Must not conflict with the preferred maintenance window.
           * Must be at least 30 minutes.
    preferredMaintenanceWindow : str, optional
        PreferredMaintenanceWindow is the time range each week during which system maintenance can occur, in Universal
        Coordinated Time (UTC). For more information, see Amazon RDS Maintenance
        Window (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Maintenance.html#Concepts.DBMaintenance).
        Format: ddd:hh24:mi-ddd:hh24:mi
        The default is a 30-minute window selected at random from an 8-hour block
        of time for each AWS Region, occurring on a random day of the week.
        Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
        Constraints: Minimum 30-minute window.
    processorFeatures : [RdsinstancespecforproviderProcessorfeaturesitem], optional
        ProcessorFeatures is the number of CPU cores and the number of threads per core for the DB instance
        class of the DB instance.
    promotionTier : int, optional
        PromotionTier specifies the order in which an Aurora Replica is promoted to
        the primary instance after a failure of the existing primary instance. For
        more information, see  Fault Tolerance for an Aurora DB Cluster (http://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Managing.Backups.html#Aurora.Managing.FaultTolerance)
        in the Amazon Aurora User Guide.
        Default: 1
        Valid Values: 0 - 15
    publiclyAccessible : bool, optional
        PubliclyAccessible specifies the accessibility options for the DB instance. A value of true
        specifies an Internet-facing instance with a publicly resolvable DNS name,
        which resolves to a public IP address. A value of false specifies an internal
        instance with a DNS name that resolves to a private IP address.
        Default: The default behavior varies depending on whether DBSubnetGroupName
        is specified.
        If DBSubnetGroupName is not specified, and PubliclyAccessible is not specified,
        the following applies:
           * If the default VPC in the target region doesn’t have an Internet gateway
           attached to it, the DB instance is private.
           * If the default VPC in the target region has an Internet gateway attached
           to it, the DB instance is public.
        If DBSubnetGroupName is specified, and PubliclyAccessible is not specified,
        the following applies:
           * If the subnets are part of a VPC that doesn’t have an Internet gateway
           attached to it, the DB instance is private.
           * If the subnets are part of a VPC that has an Internet gateway attached
           to it, the DB instance is public.
    region : str, optional
        Region is the region you'd like your RDSInstance to be created in.
    restoreFrom : RdsinstancespecforproviderRestorefrom, optional
        RestoreFrom specifies the details of the backup to restore when creating a new RDS instance. (If the RDS instance already exists, this property will be ignored.)
    scalingConfiguration : RdsinstancespecforproviderScalingconfiguration, optional
        ScalingConfiguration is the scaling properties of the DB cluster. You can only modify scaling properties
        for DB clusters in serverless DB engine mode.
    skipFinalSnapshotBeforeDeletion : bool, optional
        Determines whether a final DB snapshot is created before the DB instance
        is deleted. If true is specified, no DBSnapshot is created. If false is specified,
        a DB snapshot is created before the DB instance is deleted.
        Note that when a DB instance is in a failure state and has a status of 'failed',
        'incompatible-restore', or 'incompatible-network', it can only be deleted
        when the SkipFinalSnapshotBeforeDeletion parameter is set to "true".
        Specify true when deleting a Read Replica.
        The FinalDBSnapshotIdentifier parameter must be specified if SkipFinalSnapshotBeforeDeletion
        is false.
        Default: false
    storageEncrypted : bool, optional
        StorageEncrypted specifies whether the DB instance is encrypted.
        Amazon Aurora
        Not applicable. The encryption for DB instances is managed by the DB cluster.
        For more information, see CreateDBCluster.
        Default: false
    storageThroughput : int, optional
        The storage throughput value for the DB instance.

        This setting applies only to the gp3 storage type.

        This setting doesn't apply to Amazon Aurora or RDS Custom DB instances.

        Note: controller considers 0 and null as equivalent
    storageType : str, optional
        StorageType specifies the storage type to be associated with the DB instance.
        Valid values: standard | gp2 | io1
        If you specify io1, you must also include a value for the IOPS parameter.
        Default: io1 if the IOPS parameter is specified, otherwise standard
    tags : [RdsinstancespecforproviderTagsitem], optional
        Tags. For more information, see Tagging Amazon RDS Resources (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html)
        in the Amazon RDS User Guide.
    timezone : str, optional
        Timezone of the DB instance. The time zone parameter is currently supported
        only by Microsoft SQL Server (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.TimeZone).
    useDefaultProcessorFeatures : bool, optional
        A value that specifies that the DB instance class of the DB instance uses
        its default processor features.
    vpcSecurityGroupIDRefs : [RdsinstancespecforproviderVpcsecuritygroupidrefsitem], optional
        VPCSecurityGroupIDRefs are references to VPCSecurityGroups used to set
        the VPCSecurityGroupIDs.
    vpcSecurityGroupIDSelector : RdsinstancespecforproviderVpcsecuritygroupidselector, optional
        VPCSecurityGroupIDSelector selects references to VPCSecurityGroups used
        to set the VPCSecurityGroupIDs.
    vpcSecurityGroupIds : [str], optional
        VPCSecurityGroupIDs is a list of EC2 VPC security groups to associate with this DB instance.
        Amazon Aurora
        Not applicable. The associated list of EC2 VPC security groups is managed
        by the DB cluster. For more information, see CreateDBCluster.
        Default: The default EC2 VPC security group for the DB subnet group's VPC.
    """
    allocatedStorage? : int
    allowMajorVersionUpgrade? : bool
    applyModificationsImmediately? : bool
    autoMinorVersionUpgrade? : bool
    availabilityZone? : str
    backupRetentionPeriod? : int
    caCertificateIdentifier? : str
    characterSetName? : str
    cloudwatchLogsExportConfiguration? : RdsinstancespecforproviderCloudwatchlogsexportconfiguration
    copyTagsToSnapshot? : bool
    dbClusterIdentifier? : str
    dbInstanceClass : str
    dbName? : str
    dbParameterGroupName? : str
    dbSecurityGroups? : [str]
    dbSubnetGroupName? : str
    dbSubnetGroupNameRef? : RdsinstancespecforproviderDbsubnetgroupnameref
    dbSubnetGroupNameSelector? : RdsinstancespecforproviderDbsubnetgroupnameselector
    deleteAutomatedBackups? : bool
    deletionProtection? : bool
    domain? : str
    domainIAMRoleName? : str
    domainIAMRoleNameRef? : RdsinstancespecforproviderDomainiamrolenameref
    domainIAMRoleNameSelector? : RdsinstancespecforproviderDomainiamrolenameselector
    enableCloudwatchLogsExports? : [str]
    enableIAMDatabaseAuthentication? : bool
    enablePerformanceInsights? : bool
    engine : str
    engineVersion? : str
    finalDBSnapshotIdentifier? : str
    iops? : int
    kmsKeyId? : str
    licenseModel? : str
    masterPasswordSecretRef? : RdsinstancespecforproviderMasterpasswordsecretref
    masterUsername? : str
    maxAllocatedStorage? : int
    monitoringInterval? : int
    monitoringRoleArn? : str
    monitoringRoleArnRef? : RdsinstancespecforproviderMonitoringrolearnref
    monitoringRoleArnSelector? : RdsinstancespecforproviderMonitoringrolearnselector
    multiAZ? : bool
    optionGroupName? : str
    performanceInsightsKMSKeyId? : str
    performanceInsightsRetentionPeriod? : int
    port? : int
    preferredBackupWindow? : str
    preferredMaintenanceWindow? : str
    processorFeatures? : [RdsinstancespecforproviderProcessorfeaturesitem]
    promotionTier? : int
    publiclyAccessible? : bool
    region? : str
    restoreFrom? : RdsinstancespecforproviderRestorefrom
    scalingConfiguration? : RdsinstancespecforproviderScalingconfiguration
    skipFinalSnapshotBeforeDeletion? : bool
    storageEncrypted? : bool
    storageThroughput? : int
    storageType? : str
    tags? : [RdsinstancespecforproviderTagsitem]
    timezone? : str
    useDefaultProcessorFeatures? : bool
    vpcSecurityGroupIDRefs? : [RdsinstancespecforproviderVpcsecuritygroupidrefsitem]
    vpcSecurityGroupIDSelector? : RdsinstancespecforproviderVpcsecuritygroupidselector
    vpcSecurityGroupIds? : [str]

schema RdsinstancespecforproviderCloudwatchlogsexportconfiguration:
    """
    Deprecated: This field will be removed. Use `enableCloudwatchLogsExports` instead.
    CloudwatchLogsExportConfiguration is the configuration setting for the log types to be enabled for export to CloudWatch
    Logs for a specific DB instance.

    Attributes
    ----------
    disableLogTypes : [str], optional
        DisableLogTypes is the list of log types to disable.
    enableLogTypes : [str], optional
        EnableLogTypes is the list of log types to enable.
    """
    disableLogTypes? : [str]
    enableLogTypes? : [str]

schema RdsinstancespecforproviderDbsubnetgroupnameref:
    """
    DBSubnetGroupNameRef is a reference to a DBSubnetGroup used to set
    DBSubnetGroupName.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RdsinstancespecforproviderdbsubnetgroupnamerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RdsinstancespecforproviderdbsubnetgroupnamerefPolicy

schema RdsinstancespecforproviderdbsubnetgroupnamerefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RdsinstancespecforproviderDbsubnetgroupnameselector:
    """
    DBSubnetGroupNameSelector selects a reference to a DBSubnetGroup used to
    set DBSubnetGroupName.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RdsinstancespecforproviderdbsubnetgroupnameselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RdsinstancespecforproviderdbsubnetgroupnameselectorPolicy

schema RdsinstancespecforproviderdbsubnetgroupnameselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RdsinstancespecforproviderDomainiamrolenameref:
    """
    DomainIAMRoleNameRef is a reference to an IAMRole used to set
    DomainIAMRoleName.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RdsinstancespecforproviderdomainiamrolenamerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RdsinstancespecforproviderdomainiamrolenamerefPolicy

schema RdsinstancespecforproviderdomainiamrolenamerefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RdsinstancespecforproviderDomainiamrolenameselector:
    """
    DomainIAMRoleNameSelector selects a reference to an IAMRole used to set
    DomainIAMRoleName.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RdsinstancespecforproviderdomainiamrolenameselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RdsinstancespecforproviderdomainiamrolenameselectorPolicy

schema RdsinstancespecforproviderdomainiamrolenameselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RdsinstancespecforproviderMasterpasswordsecretref:
    """
    MasterPasswordSecretRef references the secret that contains the password used
    in the creation of this RDS instance. If no reference is given, a password
    will be auto-generated.

    Attributes
    ----------
    key : str, required
        The key to select.
    name : str, required
        Name of the secret.
    namespace : str, required
        Namespace of the secret.
    """
    key : str
    name : str
    namespace : str

schema RdsinstancespecforproviderMonitoringrolearnref:
    """
    MonitoringRoleARNRef is a reference to an IAMRole used to set
    MonitoringRoleARN.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RdsinstancespecforprovidermonitoringrolearnrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RdsinstancespecforprovidermonitoringrolearnrefPolicy

schema RdsinstancespecforprovidermonitoringrolearnrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RdsinstancespecforproviderMonitoringrolearnselector:
    """
    MonitoringRoleARNSelector selects a reference to an IAMRole used to set
    MonitoringRoleARN.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RdsinstancespecforprovidermonitoringrolearnselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RdsinstancespecforprovidermonitoringrolearnselectorPolicy

schema RdsinstancespecforprovidermonitoringrolearnselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RdsinstancespecforproviderProcessorfeaturesitem:
    """
    ProcessorFeature is a processor feature entry. For more information, see
    Configuring the Processor of the DB Instance Class
    (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html#USER_ConfigureProcessor)
    in the Amazon RDS User Guide.
    Please also see https://docs.aws.amazon.com/goto/WebAPI/rds-2014-10-31/ProcessorFeature

    Attributes
    ----------
    name : str, required
        Name of the processor feature. Valid names are coreCount and threadsPerCore.
    value : str, required
        Value of a processor feature name.
    """
    name : str
    value : str

schema RdsinstancespecforproviderRestorefrom:
    """
    RestoreFrom specifies the details of the backup to restore when creating a new RDS instance. (If the RDS instance already exists, this property will be ignored.)

    Attributes
    ----------
    pointInTime : RdsinstancespecforproviderrestorefromPointintime, optional
        PointInTime specifies the details of the point in time restore.
    s3 : RdsinstancespecforproviderrestorefromS3, optional
        S3 specifies the details of the S3 backup to restore from.
    snapshot : RdsinstancespecforproviderrestorefromSnapshot, optional
        Snapshot specifies the details of the database snapshot to restore from.
    source : "S3" | "Snapshot" | "PointInTime", required
        Source is the type of the backup to restore when creating a new RDS instance.
        S3, Snapshot and PointInTime are supported.
    """
    pointInTime? : RdsinstancespecforproviderrestorefromPointintime
    s3? : RdsinstancespecforproviderrestorefromS3
    snapshot? : RdsinstancespecforproviderrestorefromSnapshot
    source : "S3" | "Snapshot" | "PointInTime"

schema RdsinstancespecforproviderrestorefromPointintime:
    """
    PointInTime specifies the details of the point in time restore.

    Attributes
    ----------
    restoreTime : str, optional
        RestoreTime is the date and time (UTC) to restore from.
        Must be before the latest restorable time for the DB instance.
        Can't be specified if the useLatestRestorableTime parameter is enabled.
        Example: 2011-09-07T23:45:00Z
    sourceDBInstanceAutomatedBackupsArn : str, optional
        SourceDBInstanceAutomatedBackupsArn specifies the Amazon Resource Name (ARN) of the replicated automated backups
        from which to restore. Example: arn:aws:rds:useast-1:123456789012:auto-backup:ab-L2IJCEXJP7XQ7HOJ4SIEXAMPLE
    sourceDBInstanceIdentifier : str, optional
        SourceDBInstanceIdentifier specifies the identifier of the source DB instance from which to restore. Constraints:
        Must match the identifier of an existing DB instance.
    sourceDbiResourceId : str, optional
        SourceDbiResourceID specifies the resource ID of the source DB instance from which to restore.
    useLatestRestorableTime : bool, optional
        UseLatestRestorableTime indicates that the DB instance is restored from the latest backup
        Can't be specified if the restoreTime parameter is provided.
    """
    restoreTime? : str
    sourceDBInstanceAutomatedBackupsArn? : str
    sourceDBInstanceIdentifier? : str
    sourceDbiResourceId? : str
    useLatestRestorableTime? : bool

schema RdsinstancespecforproviderrestorefromS3:
    """
    S3 specifies the details of the S3 backup to restore from.

    Attributes
    ----------
    bucketName : str, optional
        BucketName is the name of the S3 bucket containing the backup to restore.
    bucketNameRef : Rdsinstancespecforproviderrestorefroms3Bucketnameref, optional
        BucketNameRef is a reference to a Bucket used to set
        BucketName.
    bucketNameSelector : Rdsinstancespecforproviderrestorefroms3Bucketnameselector, optional
        BucketNameSelector selects a reference to a Bucket used to
        set BucketName.
    ingestionRoleARN : str, optional
        IngestionRoleARN is the IAM role RDS can assume that will allow it to access the contents of the S3 bucket.
    ingestionRoleARNRef : Rdsinstancespecforproviderrestorefroms3Ingestionrolearnref, optional
        IngestionRoleARNRef is a reference to a IAM Role used to set
        IngestionRoleARN.
    ingestionRoleARNSelector : Rdsinstancespecforproviderrestorefroms3Ingestionrolearnselector, optional
        IngestionRoleARNSelector selects a reference to a IAM Role used to
        set IngestionRoleARN.
    prefix : str, optional
        Prefix is the path prefix of the S3 bucket within which the backup to restore is located.
    sourceEngine : str, required
        SourceEngine is the engine used to create the backup.
        Must be "mysql".
    sourceEngineVersion : str, required
        SourceEngineVersion is the version of the engine used to create the backup.
        Example: "5.7.30"
    """
    bucketName? : str
    bucketNameRef? : Rdsinstancespecforproviderrestorefroms3Bucketnameref
    bucketNameSelector? : Rdsinstancespecforproviderrestorefroms3Bucketnameselector
    ingestionRoleARN? : str
    ingestionRoleARNRef? : Rdsinstancespecforproviderrestorefroms3Ingestionrolearnref
    ingestionRoleARNSelector? : Rdsinstancespecforproviderrestorefroms3Ingestionrolearnselector
    prefix? : str
    sourceEngine : str
    sourceEngineVersion : str

schema Rdsinstancespecforproviderrestorefroms3Bucketnameref:
    """
    BucketNameRef is a reference to a Bucket used to set
    BucketName.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : Rdsinstancespecforproviderrestorefroms3BucketnamerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : Rdsinstancespecforproviderrestorefroms3BucketnamerefPolicy

schema Rdsinstancespecforproviderrestorefroms3BucketnamerefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema Rdsinstancespecforproviderrestorefroms3Bucketnameselector:
    """
    BucketNameSelector selects a reference to a Bucket used to
    set BucketName.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : Rdsinstancespecforproviderrestorefroms3BucketnameselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : Rdsinstancespecforproviderrestorefroms3BucketnameselectorPolicy

schema Rdsinstancespecforproviderrestorefroms3BucketnameselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema Rdsinstancespecforproviderrestorefroms3Ingestionrolearnref:
    """
    IngestionRoleARNRef is a reference to a IAM Role used to set
    IngestionRoleARN.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : Rdsinstancespecforproviderrestorefroms3IngestionrolearnrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : Rdsinstancespecforproviderrestorefroms3IngestionrolearnrefPolicy

schema Rdsinstancespecforproviderrestorefroms3IngestionrolearnrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema Rdsinstancespecforproviderrestorefroms3Ingestionrolearnselector:
    """
    IngestionRoleARNSelector selects a reference to a IAM Role used to
    set IngestionRoleARN.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : Rdsinstancespecforproviderrestorefroms3IngestionrolearnselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : Rdsinstancespecforproviderrestorefroms3IngestionrolearnselectorPolicy

schema Rdsinstancespecforproviderrestorefroms3IngestionrolearnselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RdsinstancespecforproviderrestorefromSnapshot:
    """
    Snapshot specifies the details of the database snapshot to restore from.

    Attributes
    ----------
    snapshotIdentifier : str, required
        SnapshotIdentifier is the identifier of the database snapshot to restore.
    """
    snapshotIdentifier : str

schema RdsinstancespecforproviderScalingconfiguration:
    """
    ScalingConfiguration is the scaling properties of the DB cluster. You can only modify scaling properties
    for DB clusters in serverless DB engine mode.

    Attributes
    ----------
    autoPause : bool, optional
        AutoPause specifies whether to allow or disallow automatic pause for an
        Aurora DB cluster in serverless DB engine mode. A DB cluster can be paused
        only when it's idle (it has no connections).
        If a DB cluster is paused for more than seven days, the DB cluster might
        be backed up with a snapshot. In this case, the DB cluster is restored when
        there is a request to connect to it.
    maxCapacity : int, optional
        MaxCapacity is the maximum capacity for an Aurora DB cluster in serverless DB engine mode.
        Valid capacity values are 2, 4, 8, 16, 32, 64, 128, and 256.
        The maximum capacity must be greater than or equal to the minimum capacity.
    minCapacity : int, optional
        MinCapacity is the minimum capacity for an Aurora DB cluster in serverless DB engine mode.
        Valid capacity values are 2, 4, 8, 16, 32, 64, 128, and 256.
        The minimum capacity must be less than or equal to the maximum capacity.
    secondsUntilAutoPause : int, optional
        SecondsUntilAutoPause is the time, in seconds, before an Aurora DB cluster in serverless mode is paused.
    """
    autoPause? : bool
    maxCapacity? : int
    minCapacity? : int
    secondsUntilAutoPause? : int

schema RdsinstancespecforproviderTagsitem:
    """
    Tag is a metadata assigned to an Amazon RDS resource consisting of a key-value pair.
    Please also see https://docs.aws.amazon.com/goto/WebAPI/rds-2014-10-31/Tag

    Attributes
    ----------
    key : str, optional
        A key is the required name of the tag. The string value can be from 1 to
        128 Unicode characters in length and can't be prefixed with "aws:" or "rds:".
        The string can only contain only the set of Unicode letters, digits, white-space,
        '_', '.', '/', '=', '+', '-' (Java regex: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
    value : str, optional
        A value is the optional value of the tag. The string value can be from 1
        to 256 Unicode characters in length and can't be prefixed with "aws:" or
        "rds:". The string can only contain only the set of Unicode letters, digits,
        white-space, '_', '.', '/', '=', '+', '-' (Java regex: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
    """
    key? : str
    value? : str

schema RdsinstancespecforproviderVpcsecuritygroupidrefsitem:
    """
    A Reference to a named object.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RdsinstancespecforprovidervpcsecuritygroupidrefsitemPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RdsinstancespecforprovidervpcsecuritygroupidrefsitemPolicy

schema RdsinstancespecforprovidervpcsecuritygroupidrefsitemPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RdsinstancespecforproviderVpcsecuritygroupidselector:
    """
    VPCSecurityGroupIDSelector selects references to VPCSecurityGroups used
    to set the VPCSecurityGroupIDs.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : RdsinstancespecforprovidervpcsecuritygroupidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : RdsinstancespecforprovidervpcsecuritygroupidselectorPolicy

schema RdsinstancespecforprovidervpcsecuritygroupidselectorPolicy:
    """
    Policies for selection.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RdsinstancespecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RdsinstancespecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RdsinstancespecproviderconfigrefPolicy

schema RdsinstancespecproviderconfigrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RdsinstancespecPublishconnectiondetailsto:
    """
    PublishConnectionDetailsTo specifies the connection secret config which
    contains a name, metadata and a reference to secret store config to
    which any connection details for this managed resource should be written.
    Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.

    Attributes
    ----------
    configRef : RdsinstancespecpublishconnectiondetailstoConfigref, optional
        SecretStoreConfigRef specifies which secret store config should be used
        for this ConnectionSecret.
    metadata : RdsinstancespecpublishconnectiondetailstoMetadata, optional
        Metadata is the metadata for connection secret.
    name : str, required
        Name is the name of the connection secret.
    """
    configRef? : RdsinstancespecpublishconnectiondetailstoConfigref
    metadata? : RdsinstancespecpublishconnectiondetailstoMetadata
    name : str

schema RdsinstancespecpublishconnectiondetailstoConfigref:
    """
    SecretStoreConfigRef specifies which secret store config should be used
    for this ConnectionSecret.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : RdsinstancespecpublishconnectiondetailstoconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : RdsinstancespecpublishconnectiondetailstoconfigrefPolicy

schema RdsinstancespecpublishconnectiondetailstoconfigrefPolicy:
    """
    Policies for referencing.

    Attributes
    ----------
    resolution : "Required" | "Optional", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : "Always" | "IfNotPresent", optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """
    resolution? : "Required" | "Optional"
    resolve? : "Always" | "IfNotPresent"

schema RdsinstancespecpublishconnectiondetailstoMetadata:
    """
    Metadata is the metadata for connection secret.

    Attributes
    ----------
    annotations : {str:str}, optional
        Annotations are the annotations to be added to connection secret.
        - For Kubernetes secrets, this will be used as "metadata.annotations".
        - It is up to Secret Store implementation for others store types.
    labels : {str:str}, optional
        Labels are the labels/tags to be added to connection secret.
        - For Kubernetes secrets, this will be used as "metadata.labels".
        - It is up to Secret Store implementation for others store types.
    type : str, optional
        Type is the SecretType for the connection secret.
        - Only valid for Kubernetes Secret Stores.
    """
    annotations? : {str:str}
    labels? : {str:str}
    type? : str

schema RdsinstancespecWriteconnectionsecrettoref:
    """
    WriteConnectionSecretToReference specifies the namespace and name of a
    Secret to which any connection details for this managed resource should
    be written. Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.
    This field is planned to be replaced in a future release in favor of
    PublishConnectionDetailsTo. Currently, both could be set independently
    and connection details would be published to both without affecting
    each other.

    Attributes
    ----------
    name : str, required
        Name of the secret.
    namespace : str, required
        Namespace of the secret.
    """
    name : str
    namespace : str

schema RdsinstanceStatus:
    """
    An RDSInstanceStatus represents the observed state of an RDSInstance.

    Attributes
    ----------
    atProvider : RdsinstancestatusAtprovider, optional
        RDSInstanceObservation is the representation of the current state that is observed.
    conditions : [RdsinstancestatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : RdsinstancestatusAtprovider
    conditions? : [RdsinstancestatusConditionsitem]
    observedGeneration? : int

schema RdsinstancestatusAtprovider:
    """
    RDSInstanceObservation is the representation of the current state that is observed.

    Attributes
    ----------
    allocatedStorage : int, optional
        AllocatedStorage is the allocated storage size in gibibytes.
    awsBackupRecoveryPointARN : str, optional
        AWSBackupRecoveryPointARN is the Amazon Resource Name (ARN) of the recovery point in Amazon Web Services Backup.
    backupRetentionPeriod : int, optional
        BackupRetentionPeriod is the number of days for which automated backups are retained.
    dbInstanceArn : str, optional
        DBInstanceArn is the Amazon Resource Name (ARN) for the DB instance.
    dbInstancePort : int, optional
        DBInstancePort specifies the port that the DB instance listens on. If the DB instance is
        part of a DB cluster, this can be a different port than the DB cluster port.
    dbInstanceStatus : str, optional
        DBInstanceStatus specifies the current state of this database.
    dbParameterGroups : [RdsinstancestatusatproviderDbparametergroupsitem], optional
        DBParameterGroups provides the list of DB parameter groups applied to this DB instance.
    dbResourceId : str, optional
        DBResourceID is the AWS Region-unique, immutable identifier for the DB instance. This identifier
        is found in AWS CloudTrail log entries whenever the AWS KMS key for the DB
        instance is accessed.
    dbSecurityGroups : [RdsinstancestatusatproviderDbsecuritygroupsitem], optional
        DBSecurityGroups provides List of DB security group elements containing only DBSecurityGroup.Name
        and DBSecurityGroup.Status subelements.
    dbSubnetGroup : RdsinstancestatusatproviderDbsubnetgroup, optional
        DBSubnetGroup specifies information on the subnet group associated with the DB instance,
        including the name, description, and subnets in the subnet group.
    domainMemberships : [RdsinstancestatusatproviderDomainmembershipsitem], optional
        DomainMemberships is the Active Directory Domain membership records associated with the DB instance.
    enabledCloudwatchLogsExports : [str], optional
        A list of log types that this DB instance is configured to export to CloudWatch
        Logs. Log types vary by DB engine. For information about the log types for each
        DB engine, see Amazon RDS Database Log Files
        (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html) in
        the Amazon RDS User Guide.
    endpoint : RdsinstancestatusatproviderEndpoint, optional
        Endpoint specifies the connection endpoint.
    engineVersion : str, optional
        Indicates the database engine version.
    enhancedMonitoringResourceArn : str, optional
        EnhancedMonitoringResourceArn is the Amazon Resource Name (ARN) of the
        Amazon CloudWatch Logs log stream that receives the Enhanced Monitoring
        metrics data for the DB instance.
    instanceCreateTime : str, optional
        InstanceCreateTime provides the date and time the DB instance was created.
    kmsKeyID : str, optional
        If StorageEncrypted is enabled, the Amazon Web Services KMS key identifier
        for the encrypted DB cluster.

        The Amazon Web Services KMS key identifier is the key ARN, key ID, alias
        ARN, or alias name for the KMS key.
    latestRestorableTime : str, optional
        LatestRestorableTime specifies the latest time to which a database can be
        restored with point-in-time restore.
    optionGroupMemberships : [RdsinstancestatusatproviderOptiongroupmembershipsitem], optional
        OptionGroupMemberships provides the list of option group memberships for this DB instance.
    pendingModifiedValues : RdsinstancestatusatproviderPendingmodifiedvalues, optional
        PendingModifiedValues specifies that changes to the DB instance are pending. This element is only
        included when changes are pending. Specific changes are identified by subelements.
    performanceInsightsEnabled : bool, optional
        PerformanceInsightsEnabled is true if Performance Insights is enabled for
        the DB instance, and otherwise false.
    readReplicaDBClusterIdentifiers : [str], optional
        ReadReplicaDBClusterIdentifiers contains one or more identifiers of Aurora DB clusters to which the RDS DB
        instance is replicated as a Read Replica. For example, when you create an
        Aurora Read Replica of an RDS MySQL DB instance, the Aurora MySQL DB cluster
        for the Aurora Read Replica is shown. This output does not contain information
        about cross region Aurora Read Replicas.
    readReplicaDBInstanceIdentifiers : [str], optional
        ReadReplicaDBInstanceIdentifiers contains one or more identifiers of the Read Replicas associated with this
        DB instance.
    readReplicaSourceDBInstanceIdentifier : str, optional
        ReadReplicaSourceDBInstanceIdentifier contains the identifier of the source DB instance if this DB instance is
        a Read Replica.
    secondaryAvailabilityZone : str, optional
        SecondaryAvailabilityZone specifies the name of the secondary Availability Zone for a DB
        instance with multi-AZ support when it is present.
    statusInfos : [RdsinstancestatusatproviderStatusinfositem], optional
        StatusInfos is the status of a Read Replica. If the instance is not a Read Replica, this
        is blank.
    vpcSecurityGroups : [RdsinstancestatusatproviderVpcsecuritygroupsitem], optional
        VPCSecurityGroups provides a list of VPC security group elements that the DB instance belongs
        to.
    """
    allocatedStorage? : int
    awsBackupRecoveryPointARN? : str
    backupRetentionPeriod? : int
    dbInstanceArn? : str
    dbInstancePort? : int
    dbInstanceStatus? : str
    dbParameterGroups? : [RdsinstancestatusatproviderDbparametergroupsitem]
    dbResourceId? : str
    dbSecurityGroups? : [RdsinstancestatusatproviderDbsecuritygroupsitem]
    dbSubnetGroup? : RdsinstancestatusatproviderDbsubnetgroup
    domainMemberships? : [RdsinstancestatusatproviderDomainmembershipsitem]
    enabledCloudwatchLogsExports? : [str]
    endpoint? : RdsinstancestatusatproviderEndpoint
    engineVersion? : str
    enhancedMonitoringResourceArn? : str
    instanceCreateTime? : str
    kmsKeyID? : str
    latestRestorableTime? : str
    optionGroupMemberships? : [RdsinstancestatusatproviderOptiongroupmembershipsitem]
    pendingModifiedValues? : RdsinstancestatusatproviderPendingmodifiedvalues
    performanceInsightsEnabled? : bool
    readReplicaDBClusterIdentifiers? : [str]
    readReplicaDBInstanceIdentifiers? : [str]
    readReplicaSourceDBInstanceIdentifier? : str
    secondaryAvailabilityZone? : str
    statusInfos? : [RdsinstancestatusatproviderStatusinfositem]
    vpcSecurityGroups? : [RdsinstancestatusatproviderVpcsecuritygroupsitem]

schema RdsinstancestatusatproviderDbparametergroupsitem:
    """
    DBParameterGroupStatus is the status of the DB parameter group.
    This data type is used as a response element in the following actions:
      - CreateDBInstance
      - CreateDBInstanceReadReplica
      - DeleteDBInstance
      - ModifyDBInstance
      - RebootDBInstance
      - RestoreDBInstanceFromDBSnapshot

    Please also see https://docs.aws.amazon.com/goto/WebAPI/rds-2014-10-31/DBParameterGroupStatus

    Attributes
    ----------
    dbParameterGroupName : str, optional
        DBParameterGroupName is the name of the DP parameter group.
    parameterApplyStatus : str, optional
        ParameterApplyStatus is the status of parameter updates.
    """
    dbParameterGroupName? : str
    parameterApplyStatus? : str

schema RdsinstancestatusatproviderDbsecuritygroupsitem:
    """
    DBSecurityGroupMembership is used as a response element in the following actions:
      - ModifyDBInstance
      - RebootDBInstance
      - RestoreDBInstanceFromDBSnapshot
      - RestoreDBInstanceToPointInTime

    Please also see https://docs.aws.amazon.com/goto/WebAPI/rds-2014-10-31/DBSecurityGroupMembership

    Attributes
    ----------
    dbSecurityGroupName : str, optional
        DBSecurityGroupName is the name of the DB security group.
    status : str, optional
        Status is the status of the DB security group.
    """
    dbSecurityGroupName? : str
    status? : str

schema RdsinstancestatusatproviderDbsubnetgroup:
    """
    DBSubnetGroup specifies information on the subnet group associated with the DB instance,
    including the name, description, and subnets in the subnet group.

    Attributes
    ----------
    dbSubnetGroupArn : str, optional
        DBSubnetGroupARN is the Amazon Resource Name (ARN) for the DB subnet group.
    dbSubnetGroupDescription : str, optional
        DBSubnetGroupDescription provides the description of the DB subnet group.
    dbSubnetGroupName : str, optional
        DBSubnetGroupName is the name of the DB subnet group.
    subnetGroupStatus : str, optional
        SubnetGroupStatus provides the status of the DB subnet group.
    subnets : [RdsinstancestatusatproviderdbsubnetgroupSubnetsitem], optional
        Subnets contains a list of Subnet elements.
    vpcId : str, optional
        VPCID provides the VPCID of the DB subnet group.
    """
    dbSubnetGroupArn? : str
    dbSubnetGroupDescription? : str
    dbSubnetGroupName? : str
    subnetGroupStatus? : str
    subnets? : [RdsinstancestatusatproviderdbsubnetgroupSubnetsitem]
    vpcId? : str

schema RdsinstancestatusatproviderdbsubnetgroupSubnetsitem:
    """
    SubnetInRDS is used as a response element in the DescribeDBSubnetGroups
    action.
    Please also see https://docs.aws.amazon.com/goto/WebAPI/rds-2014-10-31/Subnet

    Attributes
    ----------
    subnetAvailabilityZone : RdsinstancestatusatproviderdbsubnetgroupsubnetsitemSubnetavailabilityzone, optional
        SubnetAvailabilityZone contains Availability Zone information.
        This data type is used as an element in the following data type:
           * OrderableDBInstanceOption
    subnetIdentifier : str, optional
        SubnetIdentifier specifies the identifier of the subnet.
    subnetStatus : str, optional
        SubnetStatus specifies the status of the subnet.
    """
    subnetAvailabilityZone? : RdsinstancestatusatproviderdbsubnetgroupsubnetsitemSubnetavailabilityzone
    subnetIdentifier? : str
    subnetStatus? : str

schema RdsinstancestatusatproviderdbsubnetgroupsubnetsitemSubnetavailabilityzone:
    """
    SubnetAvailabilityZone contains Availability Zone information.
    This data type is used as an element in the following data type:
       * OrderableDBInstanceOption

    Attributes
    ----------
    name : str, optional
        Name of the Availability Zone.
    """
    name? : str

schema RdsinstancestatusatproviderDomainmembershipsitem:
    """
    DomainMembership is an Active Directory Domain membership record associated
    with the DB instance.
    Please also see https://docs.aws.amazon.com/goto/WebAPI/rds-2014-10-31/DomainMembership

    Attributes
    ----------
    domain : str, optional
        Domain is the identifier of the Active Directory Domain.
    fqdn : str, optional
        FQDN us the fully qualified domain name of the Active Directory Domain.
    iamRoleName : str, optional
        IAMRoleName is the name of the IAM role to be used when making API calls
        to the Directory Service.
    status : str, optional
        Status of the DB instance's Active Directory Domain membership, such
        as joined, pending-join, failed etc).
    """
    domain? : str
    fqdn? : str
    iamRoleName? : str
    status? : str

schema RdsinstancestatusatproviderEndpoint:
    """
    Endpoint specifies the connection endpoint.

    Attributes
    ----------
    address : str, optional
        Address specifies the DNS address of the DB instance.
    hostedZoneId : str, optional
        HostedZoneID specifies the ID that Amazon Route 53 assigns when you create a hosted zone.
    port : int, optional
        Port specifies the port that the database engine is listening on.
    """
    address? : str
    hostedZoneId? : str
    port? : int

schema RdsinstancestatusatproviderOptiongroupmembershipsitem:
    """
    OptionGroupMembership provides information on the option groups the DB instance is a member of.
    Please also see https://docs.aws.amazon.com/goto/WebAPI/rds-2014-10-31/OptionGroupMembership

    Attributes
    ----------
    optionGroupName : str, optional
        OptionGroupName is the name of the option group that the instance belongs to.
    status : str, optional
        Status is the status of the DB instance's option group membership. Valid values are:
        in-sync, pending-apply, pending-removal, pending-maintenance-apply, pending-maintenance-removal,
        applying, removing, and failed.
    """
    optionGroupName? : str
    status? : str

schema RdsinstancestatusatproviderPendingmodifiedvalues:
    """
    PendingModifiedValues specifies that changes to the DB instance are pending. This element is only
    included when changes are pending. Specific changes are identified by subelements.

    Attributes
    ----------
    allocatedStorage : int, optional
        AllocatedStorage contains the new AllocatedStorage size for the DB instance that will be applied
        or is currently being applied.
    backupRetentionPeriod : int, optional
        BackupRetentionPeriod specifies the pending number of days for which automated backups are retained.
    caCertificateIdentifier : str, optional
        CACertificateIdentifier specifies the identifier of the CA certificate for the DB instance.
    dbInstanceClass : str, optional
        DBInstanceClass contains the new DBInstanceClass for the DB instance that will be applied
        or is currently being applied.
    dbSubnetGroupName : str, optional
        DBSubnetGroupName is the new DB subnet group for the DB instance.
    engineVersion : str, optional
        EngineVersion indicates the database engine version.
    iops : int, optional
        IOPS specifies the new Provisioned IOPS value for the DB instance that will be
        applied or is currently being applied.
    licenseModel : str, optional
        LicenseModel is the license model for the DB instance.
        Valid values: license-included | bring-your-own-license | general-public-license
    multiAZ : bool, optional
        MultiAZ indicates that the Single-AZ DB instance is to change to a Multi-AZ deployment.
    pendingCloudwatchLogsExports : RdsinstancestatusatproviderpendingmodifiedvaluesPendingcloudwatchlogsexports, optional
        PendingCloudwatchLogsExports is a list of the log types whose configuration is still pending. In other words,
        these log types are in the process of being activated or deactivated.
    port : int, optional
        Port specifies the pending port for the DB instance.
    processorFeatures : [RdsinstancestatusatproviderpendingmodifiedvaluesProcessorfeaturesitem], optional
        ProcessorFeatures is the number of CPU cores and the number of threads per core for the DB instance
        class of the DB instance.
    storageThroughput : int, optional
        StorageThroughput indicates the new storage throughput value for the DB instance
        that will be applied or is currently being applied.
    storageType : str, optional
        StorageType specifies the storage type to be associated with the DB instance.
    """
    allocatedStorage? : int
    backupRetentionPeriod? : int
    caCertificateIdentifier? : str
    dbInstanceClass? : str
    dbSubnetGroupName? : str
    engineVersion? : str
    iops? : int
    licenseModel? : str
    multiAZ? : bool
    pendingCloudwatchLogsExports? : RdsinstancestatusatproviderpendingmodifiedvaluesPendingcloudwatchlogsexports
    port? : int
    processorFeatures? : [RdsinstancestatusatproviderpendingmodifiedvaluesProcessorfeaturesitem]
    storageThroughput? : int
    storageType? : str

schema RdsinstancestatusatproviderpendingmodifiedvaluesPendingcloudwatchlogsexports:
    """
    PendingCloudwatchLogsExports is a list of the log types whose configuration is still pending. In other words,
    these log types are in the process of being activated or deactivated.

    Attributes
    ----------
    logTypesToDisable : [str], optional
        LogTypesToDisable is list of log types that are in the process of being
        enabled. After they are enabled, these log types are exported to
        CloudWatch Logs.
    logTypesToEnable : [str], optional
        LogTypesToEnable is the log types that are in the process of being
        deactivated. After they are deactivated, these log types aren't exported
        to CloudWatch Logs.
    """
    logTypesToDisable? : [str]
    logTypesToEnable? : [str]

schema RdsinstancestatusatproviderpendingmodifiedvaluesProcessorfeaturesitem:
    """
    ProcessorFeature is a processor feature entry. For more information, see
    Configuring the Processor of the DB Instance Class
    (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html#USER_ConfigureProcessor)
    in the Amazon RDS User Guide.
    Please also see https://docs.aws.amazon.com/goto/WebAPI/rds-2014-10-31/ProcessorFeature

    Attributes
    ----------
    name : str, required
        Name of the processor feature. Valid names are coreCount and threadsPerCore.
    value : str, required
        Value of a processor feature name.
    """
    name : str
    value : str

schema RdsinstancestatusatproviderStatusinfositem:
    """
    DBInstanceStatusInfo provides a list of status information for a DB instance.
    Please also see https://docs.aws.amazon.com/goto/WebAPI/rds-2014-10-31/DBInstanceStatusInfo

    Attributes
    ----------
    message : str, optional
        Message is the details of the error if there is an error for the instance. If the instance
        is not in an error state, this value is blank.
    normal : bool, optional
        Normal is true if the instance is operating normally, or false
        if the instance is in an error state.
    status : str, optional
        Status of the DB instance. For a StatusType of read replica, the values can
        be replicating, replication stop point set, replication stop point reached,
        error, stopped, or terminated.
    statusType : str, optional
        StatusType is currently "read replication."
    """
    message? : str
    normal? : bool
    status? : str
    statusType? : str

schema RdsinstancestatusatproviderVpcsecuritygroupsitem:
    """
    VPCSecurityGroupMembership is used as a response element for queries on VPC security
    group membership.
    Please also see https://docs.aws.amazon.com/goto/WebAPI/rds-2014-10-31/VpcSecurityGroupMembership

    Attributes
    ----------
    status : str, optional
        Status is the status of the VPC security group.
    vpcSecurityGroupId : str, optional
        VPCSecurityGroupID is the name of the VPC security group.
    """
    status? : str
    vpcSecurityGroupId? : str

schema RdsinstancestatusConditionsitem:
    """
    A Condition that may apply to a resource.

    Attributes
    ----------
    lastTransitionTime : str, required
        LastTransitionTime is the last time this condition transitioned from one
        status to another.
    message : str, optional
        A Message containing details about this condition's last transition from
        one status to another, if any.
    observedGeneration : int, optional
        ObservedGeneration represents the .metadata.generation that the condition was set based upon.
        For instance, if .metadata.generation is currently 12, but the .status.conditions[x].observedGeneration is 9, the condition is out of date
        with respect to the current state of the instance.
    reason : str, required
        A Reason for this condition's last transition from one status to another.
    status : str, required
        Status of this condition; is it currently True, False, or Unknown?
    type : str, required
        Type of this condition. At most one of each condition type may apply to
        a resource at any point in time.
    """
    lastTransitionTime : str
    message? : str
    observedGeneration? : int
    reason : str
    status : str
    type : str