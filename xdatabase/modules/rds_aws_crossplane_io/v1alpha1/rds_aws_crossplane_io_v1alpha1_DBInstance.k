"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.

It is based on the provided OpenAPI v2 JSON schema.

DO NOT EDIT MANUALLY.
"""

schema Dbinstance:
    """
    DBInstance is the Schema for the DBInstances API

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
    spec : DbinstanceSpec, required
        DBInstanceSpec defines the desired state of DBInstance
    status : DbinstanceStatus, optional
        DBInstanceStatus defines the observed state of DBInstance.
    """
    apiVersion : str = "rds.aws.crossplane.io/v1alpha1"
    kind : str = "DBInstance"
    metadata? : any
    spec : DbinstanceSpec
    status? : DbinstanceStatus

schema DbinstanceSpec:
    """
    DBInstanceSpec defines the desired state of DBInstance

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
    forProvider : DbinstancespecForprovider, required
        DBInstanceParameters defines the desired state of DBInstance
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
    providerConfigRef : DbinstancespecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    publishConnectionDetailsTo : DbinstancespecPublishconnectiondetailsto, optional
        PublishConnectionDetailsTo specifies the connection secret config which
        contains a name, metadata and a reference to secret store config to
        which any connection details for this managed resource should be written.
        Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    writeConnectionSecretToRef : DbinstancespecWriteconnectionsecrettoref, optional
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
    forProvider : DbinstancespecForprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : DbinstancespecProviderconfigref
    publishConnectionDetailsTo? : DbinstancespecPublishconnectiondetailsto
    writeConnectionSecretToRef? : DbinstancespecWriteconnectionsecrettoref

schema DbinstancespecForprovider:
    """
    DBInstanceParameters defines the desired state of DBInstance

    Attributes
    ----------
    allocatedStorage : int, optional
        The amount of storage in gibibytes (GiB) to allocate for the DB instance.

        This setting doesn't apply to Amazon Aurora DB instances. Aurora cluster
        volumes automatically grow as the amount of data in your database increases,
        though you are only charged for the space that you use in an Aurora cluster
        volume.

        Amazon RDS Custom

        Constraints to the amount of storage for each storage type are the following:

           * General Purpose (SSD) storage (gp2, gp3): Must be an integer from 40
           to 65536 for RDS Custom for Oracle, 16384 for RDS Custom for SQL Server.

           * Provisioned IOPS storage (io1): Must be an integer from 40 to 65536
           for RDS Custom for Oracle, 16384 for RDS Custom for SQL Server.

        RDS for MariaDB

        Constraints to the amount of storage for each storage type are the following:

           * General Purpose (SSD) storage (gp2, gp3): Must be an integer from 20
           to 65536.

           * Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.

           * Magnetic storage (standard): Must be an integer from 5 to 3072.

        RDS for MySQL

        Constraints to the amount of storage for each storage type are the following:

           * General Purpose (SSD) storage (gp2, gp3): Must be an integer from 20
           to 65536.

           * Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.

           * Magnetic storage (standard): Must be an integer from 5 to 3072.

        RDS for Oracle

        Constraints to the amount of storage for each storage type are the following:

           * General Purpose (SSD) storage (gp2, gp3): Must be an integer from 20
           to 65536.

           * Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.

           * Magnetic storage (standard): Must be an integer from 10 to 3072.

        RDS for PostgreSQL

        Constraints to the amount of storage for each storage type are the following:

           * General Purpose (SSD) storage (gp2, gp3): Must be an integer from 20
           to 65536.

           * Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.

           * Magnetic storage (standard): Must be an integer from 5 to 3072.

        RDS for SQL Server

        Constraints to the amount of storage for each storage type are the following:

           * General Purpose (SSD) storage (gp2, gp3): Enterprise and Standard editions:
           Must be an integer from 20 to 16384. Web and Express editions: Must be
           an integer from 20 to 16384.

           * Provisioned IOPS storage (io1): Enterprise and Standard editions: Must
           be an integer from 100 to 16384. Web and Express editions: Must be an
           integer from 100 to 16384.

           * Magnetic storage (standard): Enterprise and Standard editions: Must
           be an integer from 20 to 1024. Web and Express editions: Must be an integer
           from 20 to 1024.
    allowMajorVersionUpgrade : bool, optional
        Specifies whether major version upgrades are allowed. Changing this parameter
        doesn't result in an outage and the change is asynchronously applied as soon
        as possible.

        This setting doesn't apply to RDS Custom DB instances.

        Constraints:

           * Major version upgrades must be allowed when specifying a value for the
           EngineVersion parameter that's a different major version than the DB instance's
           current version.
    applyImmediately : bool, optional
        A value that indicates whether the modifications in this request and any
        pending modifications are asynchronously applied as soon as possible, regardless
        of the PreferredMaintenanceWindow setting for the DB instance. By default,
        this parameter is disabled.

        If this parameter is disabled, changes to the DB instance are applied during
        the next maintenance window. Some parameter changes can cause an outage and
        are applied on the next call to RebootDBInstance, or the next failure reboot.
        Review the table of parameters in Modifying a DB Instance (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.DBInstance.Modifying.html)
        in the Amazon RDS User Guide. to see the impact of enabling or disabling
        ApplyImmediately for each modified parameter and to determine when the changes
        are applied.
    autoMinorVersionUpgrade : bool, optional
        Specifies whether minor engine upgrades are applied automatically to the
        DB instance during the maintenance window. By default, minor engine upgrades
        are applied automatically.

        If you create an RDS Custom DB instance, you must set AutoMinorVersionUpgrade
        to false.
    autogeneratePassword : bool, optional
        AutogeneratePassword indicates whether the controller should generate
        a random password for the master user if one is not provided via
        MasterUserPasswordSecretRef.

        If a password is generated, it will
        be stored as a secret at the location specified by MasterUserPasswordSecretRef.
    availabilityZone : str, optional
        The Availability Zone (AZ) where the database will be created. For information
        on Amazon Web Services Regions and Availability Zones, see Regions and Availability
        Zones (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html).

        For Amazon Aurora, each Aurora DB cluster hosts copies of its storage in
        three separate Availability Zones. Specify one of these Availability Zones.
        Aurora automatically chooses an appropriate Availability Zone if you don't
        specify one.

        Default: A random, system-chosen Availability Zone in the endpoint's Amazon
        Web Services Region.

        Constraints:

           * The AvailabilityZone parameter can't be specified if the DB instance
           is a Multi-AZ deployment.

           * The specified Availability Zone must be in the same Amazon Web Services
           Region as the current endpoint.

        Example: us-east-1d
    backupRetentionPeriod : int, optional
        The number of days for which automated backups are retained. Setting this
        parameter to a positive number enables backups. Setting this parameter to
        0 disables automated backups.

        This setting doesn't apply to Amazon Aurora DB instances. The retention period
        for automated backups is managed by the DB cluster.

        Default: 1

        Constraints:

           * Must be a value from 0 to 35.

           * Can't be set to 0 if the DB instance is a source to read replicas.

           * Can't be set to 0 for an RDS Custom for Oracle DB instance.
    backupTarget : str, optional
        The location for storing automated backups and manual snapshots.

        Valie Values:

           * outposts (Amazon Web Services Outposts)

           * region (Amazon Web Services Region)

        Default: region

        For more information, see Working with Amazon RDS on Amazon Web Services
        Outposts (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-on-outposts.html)
        in the Amazon RDS User Guide.
    caCertificateIdentifier : str, optional
        The CA certificate identifier to use for the DB instance's server certificate.

        This setting doesn't apply to RDS Custom DB instances.

        For more information, see Using SSL/TLS to encrypt a connection to a DB instance
        (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL.html)
        in the Amazon RDS User Guide and Using SSL/TLS to encrypt a connection to
        a DB cluster (https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.SSL.html)
        in the Amazon Aurora User Guide.
    characterSetName : str, optional
        For supported engines, the character set (CharacterSet) to associate the
        DB instance with.

        This setting doesn't apply to the following DB instances:

           * Amazon Aurora - The character set is managed by the DB cluster. For
           more information, see CreateDBCluster.

           * RDS Custom - However, if you need to change the character set, you can
           change it on the database itself.
    copyTagsToSnapshot : bool, optional
        Specifies whether to copy tags from the DB instance to snapshots of the DB
        instance. By default, tags are not copied.

        This setting doesn't apply to Amazon Aurora DB instances. Copying tags to
        snapshots is managed by the DB cluster. Setting this value for an Aurora
        DB instance has no effect on the DB cluster setting.
    customIAMInstanceProfile : str, optional
        The instance profile associated with the underlying Amazon EC2 instance of
        an RDS Custom DB instance.

        This setting is required for RDS Custom.

        Constraints:

           * The profile must exist in your account.

           * The profile must have an IAM role that Amazon EC2 has permissions to
           assume.

           * The instance profile name and the associated IAM role name must start
           with the prefix AWSRDSCustom.

        For the list of permissions required for the IAM role, see Configure IAM
        and your VPC (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/custom-setup-orcl.html#custom-setup-orcl.iam-vpc)
        in the Amazon RDS User Guide.
    dbClusterIdentifier : str, optional
        The identifier of the DB cluster that this DB instance will belong to.

        This setting doesn't apply to RDS Custom DB instances.
    dbClusterIdentifierRef : DbinstancespecforproviderDbclusteridentifierref, optional
        DBClusterIdentifierRef is a reference to a DBCluster used to set
        DBClusterIdentifier.
    dbClusterIdentifierSelector : DbinstancespecforproviderDbclusteridentifierselector, optional
        DBClusterIdentifierSelector selects a reference to a DBCluster used to
        set DBClusterIdentifier.
    dbInstanceClass : str, required
        The compute and memory capacity of the DB instance, for example db.m5.large.
        Not all DB instance classes are available in all Amazon Web Services Regions,
        or for all database engines. For the full list of DB instance classes, and
        availability for your engine, see DB instance classes (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html)
        in the Amazon RDS User Guide or Aurora DB instance classes (https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.DBInstanceClass.html)
        in the Amazon Aurora User Guide.
    dbName : str, optional
        The meaning of this parameter differs according to the database engine you
        use.

        MySQL

        The name of the database to create when the DB instance is created. If this
        parameter isn't specified, no database is created in the DB instance.

        Constraints:

           * Must contain 1 to 64 letters or numbers.

           * Must begin with a letter. Subsequent characters can be letters, underscores,
           or digits (0-9).

           * Can't be a word reserved by the specified database engine

        MariaDB

        The name of the database to create when the DB instance is created. If this
        parameter isn't specified, no database is created in the DB instance.

        Constraints:

           * Must contain 1 to 64 letters or numbers.

           * Must begin with a letter. Subsequent characters can be letters, underscores,
           or digits (0-9).

           * Can't be a word reserved by the specified database engine

        PostgreSQL

        The name of the database to create when the DB instance is created. If this
        parameter isn't specified, a database named postgres is created in the DB
        instance.

        Constraints:

           * Must contain 1 to 63 letters, numbers, or underscores.

           * Must begin with a letter. Subsequent characters can be letters, underscores,
           or digits (0-9).

           * Can't be a word reserved by the specified database engine

        Oracle

        The Oracle System ID (SID) of the created DB instance. If you don't specify
        a value, the default value is ORCL. You can't specify the string null, or
        any other reserved word, for DBName.

        Default: ORCL

        Constraints:

           * Can't be longer than 8 characters

        Amazon RDS Custom for Oracle

        The Oracle System ID (SID) of the created RDS Custom DB instance. If you
        don't specify a value, the default value is ORCL for non-CDBs and RDSCDB
        for CDBs.

        Default: ORCL

        Constraints:

           * It must contain 1 to 8 alphanumeric characters.

           * It must contain a letter.

           * It can't be a word reserved by the database engine.

        Amazon RDS Custom for SQL Server

        Not applicable. Must be null.

        SQL Server

        Not applicable. Must be null.

        Amazon Aurora MySQL

        The name of the database to create when the primary DB instance of the Aurora
        MySQL DB cluster is created. If this parameter isn't specified for an Aurora
        MySQL DB cluster, no database is created in the DB cluster.

        Constraints:

           * It must contain 1 to 64 alphanumeric characters.

           * It can't be a word reserved by the database engine.

        Amazon Aurora PostgreSQL

        The name of the database to create when the primary DB instance of the Aurora
        PostgreSQL DB cluster is created. If this parameter isn't specified for an
        Aurora PostgreSQL DB cluster, a database named postgres is created in the
        DB cluster.

        Constraints:

           * It must contain 1 to 63 alphanumeric characters.

           * It must begin with a letter. Subsequent characters can be letters, underscores,
           or digits (0 to 9).

           * It can't be a word reserved by the database engine.
    dbParameterGroupName : str, optional
        The name of the DB parameter group to associate with this DB instance. If
        you don't specify a value, then Amazon RDS uses the default DB parameter
        group for the specified DB engine and version.

        This setting doesn't apply to RDS Custom DB instances.

        Constraints:

           * Must be 1 to 255 letters, numbers, or hyphens.

           * The first character must be a letter.

           * Can't end with a hyphen or contain two consecutive hyphens.
    dbParameterGroupNameRef : DbinstancespecforproviderDbparametergroupnameref, optional
        DBParameterGroupNameRef is a reference to a DBParameterGroup used to set
        DBParameterGroupName.
    dbParameterGroupNameSelector : DbinstancespecforproviderDbparametergroupnameselector, optional
        DBParameterGroupNameSelector selects a reference to a DBParameterGroup used to
        set DBParameterGroupName.
    dbSecurityGroups : [str], optional
        A list of database security groups to associate with this DB instance
    dbSubnetGroupName : str, optional
        A DB subnet group to associate with this DB instance.

        Constraints:

           * Must match the name of an existing DB subnet group.

           * Must not be default.

        Example: mydbsubnetgroup
    dbSubnetGroupNameRef : DbinstancespecforproviderDbsubnetgroupnameref, optional
        DBSubnetGroupNameRef is a reference to a DBSubnetGroup used to set
        DBSubnetGroupName.
    dbSubnetGroupNameSelector : DbinstancespecforproviderDbsubnetgroupnameselector, optional
        DBSubnetGroupNameSelector selects a reference to a DBSubnetGroup used to
        set DBSubnetGroupName.
    dbSystemID : str, optional
        The Oracle system identifier (SID), which is the name of the Oracle database
        instance that manages your database files. In this context, the term "Oracle
        database instance" refers exclusively to the system global area (SGA) and
        Oracle background processes. If you don't specify a SID, the value defaults
        to RDSCDB. The Oracle SID is also the name of your CDB.
    dedicatedLogVolume : bool, optional
        Indicates whether the DB instance has a dedicated log volume (DLV) enabled.
    deleteAutomatedBackups : bool, optional
        DeleteAutomatedBackups indicates whether to remove automated backups
        immediately after the DB instance is deleted. The default is to
        remove automated backups immediately after the DB instance is
        deleted.
    deletionProtection : bool, optional
        Specifies whether the DB instance has deletion protection enabled. The database
        can't be deleted when deletion protection is enabled. By default, deletion
        protection isn't enabled. For more information, see Deleting a DB Instance
        (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html).

        This setting doesn't apply to Amazon Aurora DB instances. You can enable
        or disable deletion protection for the DB cluster. For more information,
        see CreateDBCluster. DB instances in a DB cluster can be deleted even when
        deletion protection is enabled for the DB cluster.
    domain : str, optional
        The Active Directory directory ID to create the DB instance in. Currently,
        only Microsoft SQL Server, MySQL, Oracle, and PostgreSQL DB instances can
        be created in an Active Directory Domain.

        For more information, see Kerberos Authentication (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/kerberos-authentication.html)
        in the Amazon RDS User Guide.

        This setting doesn't apply to the following DB instances:

           * Amazon Aurora (The domain is managed by the DB cluster.)

           * RDS Custom
    domainAuthSecretARN : str, optional
        The ARN for the Secrets Manager secret with the credentials for the user
        joining the domain.

        Example: arn:aws:secretsmanager:region:account-number:secret:myselfmanagedADtestsecret-123456
    domainDNSIPs : [str], optional
        The IPv4 DNS IP addresses of your primary and secondary Active Directory
        domain controllers.

        Constraints:

           * Two IP addresses must be provided. If there isn't a secondary domain
           controller, use the IP address of the primary domain controller for both
           entries in the list.

        Example: 123.124.125.126,234.235.236.237
    domainFqdn : str, optional
        The fully qualified domain name (FQDN) of an Active Directory domain.

        Constraints:

           * Can't be longer than 64 characters.

        Example: mymanagedADtest.mymanagedAD.mydomain
    domainIAMRoleName : str, optional
        The name of the IAM role to use when making API calls to the Directory Service.

        This setting doesn't apply to the following DB instances:

           * Amazon Aurora (The domain is managed by the DB cluster.)

           * RDS Custom
    domainIAMRoleNameRef : DbinstancespecforproviderDomainiamrolenameref, optional
        DomainIAMRoleNameRef is a reference to an IAMRole used to set
        DomainIAMRoleName.
    domainIAMRoleNameSelector : DbinstancespecforproviderDomainiamrolenameselector, optional
        DomainIAMRoleNameSelector selects a reference to an IAMRole used to set
        DomainIAMRoleName.
    domainOu : str, optional
        The Active Directory organizational unit for your DB instance to join.

        Constraints:

           * Must be in the distinguished name format.

           * Can't be longer than 64 characters.

        Example: OU=mymanagedADtestOU,DC=mymanagedADtest,DC=mymanagedAD,DC=mydomain
    enableCloudwatchLogsExports : [str], optional
        The list of log types that need to be enabled for exporting to CloudWatch
        Logs. For more information, see Publishing Database Logs to Amazon CloudWatch
        Logs (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch)
        in the Amazon RDS User Guide.

        This setting doesn't apply to the following DB instances:

           * Amazon Aurora (CloudWatch Logs exports are managed by the DB cluster.)

           * RDS Custom

        The following values are valid for each DB engine:

           * RDS for MariaDB - audit | error | general | slowquery

           * RDS for Microsoft SQL Server - agent | error

           * RDS for MySQL - audit | error | general | slowquery

           * RDS for Oracle - alert | audit | listener | trace | oemagent

           * RDS for PostgreSQL - postgresql | upgrade
    enableCustomerOwnedIP : bool, optional
        Specifies whether to enable a customer-owned IP address (CoIP) for an RDS
        on Outposts DB instance.

        A CoIP provides local or external connectivity to resources in your Outpost
        subnets through your on-premises network. For some use cases, a CoIP can
        provide lower latency for connections to the DB instance from outside of
        its virtual private cloud (VPC) on your local network.

        For more information about RDS on Outposts, see Working with Amazon RDS on
        Amazon Web Services Outposts (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-on-outposts.html)
        in the Amazon RDS User Guide.

        For more information about CoIPs, see Customer-owned IP addresses (https://docs.aws.amazon.com/outposts/latest/userguide/routing.html#ip-addressing)
        in the Amazon Web Services Outposts User Guide.
    enableIAMDatabaseAuthentication : bool, optional
        Specifies whether to enable mapping of Amazon Web Services Identity and Access
        Management (IAM) accounts to database accounts. By default, mapping isn't
        enabled.

        For more information, see IAM Database Authentication for MySQL and PostgreSQL
        (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html)
        in the Amazon RDS User Guide.

        This setting doesn't apply to the following DB instances:

           * Amazon Aurora (Mapping Amazon Web Services IAM accounts to database
           accounts is managed by the DB cluster.)

           * RDS Custom
    enablePerformanceInsights : bool, optional
        Specifies whether to enable Performance Insights for the DB instance. For
        more information, see Using Amazon Performance Insights (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html)
        in the Amazon RDS User Guide.

        This setting doesn't apply to RDS Custom DB instances.
    engine : str, required
        The database engine to use for this DB instance.

        Not every database engine is available in every Amazon Web Services Region.

        Valid Values:

           * aurora-mysql (for Aurora MySQL DB instances)

           * aurora-postgresql (for Aurora PostgreSQL DB instances)

           * custom-oracle-ee (for RDS Custom for Oracle DB instances)

           * custom-oracle-ee-cdb (for RDS Custom for Oracle DB instances)

           * custom-sqlserver-ee (for RDS Custom for SQL Server DB instances)

           * custom-sqlserver-se (for RDS Custom for SQL Server DB instances)

           * custom-sqlserver-web (for RDS Custom for SQL Server DB instances)

           * mariadb

           * mysql

           * oracle-ee

           * oracle-ee-cdb

           * oracle-se2

           * oracle-se2-cdb

           * postgres

           * sqlserver-ee

           * sqlserver-se

           * sqlserver-ex

           * sqlserver-web
    engineVersion : str, optional
        The version number of the database engine to use.

        For a list of valid engine versions, use the DescribeDBEngineVersions operation.

        The following are the database engines and links to information about the
        major and minor versions that are available with Amazon RDS. Not every database
        engine is available for every Amazon Web Services Region.

        Amazon Aurora

        Not applicable. The version number of the database engine to be used by the
        DB instance is managed by the DB cluster.

        Amazon RDS Custom for Oracle

        A custom engine version (CEV) that you have previously created. This setting
        is required for RDS Custom for Oracle. The CEV name has the following format:
        19.customized_string. A valid CEV name is 19.my_cev1. For more information,
        see Creating an RDS Custom for Oracle DB instance (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/custom-creating.html#custom-creating.create)
        in the Amazon RDS User Guide.

        Amazon RDS Custom for SQL Server

        See RDS Custom for SQL Server general requirements (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/custom-reqs-limits-MS.html)
        in the Amazon RDS User Guide.

        MariaDB

        For information, see MariaDB on Amazon RDS Versions (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MariaDB.html#MariaDB.Concepts.VersionMgmt)
        in the Amazon RDS User Guide.

        Microsoft SQL Server

        For information, see Microsoft SQL Server Versions on Amazon RDS (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.VersionSupport)
        in the Amazon RDS User Guide.

        MySQL

        For information, see MySQL on Amazon RDS Versions (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt)
        in the Amazon RDS User Guide.

        Oracle

        For information, see Oracle Database Engine Release Notes (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.Oracle.PatchComposition.html)
        in the Amazon RDS User Guide.

        PostgreSQL

        For information, see Amazon RDS for PostgreSQL versions and extensions (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts)
        in the Amazon RDS User Guide.

        Note: Downgrades are not allowed by AWS and attempts to set a lower version
        will be ignored.
    finalDBSnapshotIdentifier : str, optional
        The DB instance snapshot identifier of the new DB instance snapshot created
        when SkipFinalSnapshot is disabled.

        Specifying this parameter and also skipping the creation of a final DB instance
        snapshot with the SkipFinalShapshot parameter results in an error.

        Constraints:

           * Must be 1 to 255 letters, numbers, or hyphens.

           * First character must be a letter

           * Can't end with a hyphen or contain two consecutive hyphens
    iops : int, optional
        The amount of Provisioned IOPS (input/output operations per second) to initially
        allocate for the DB instance. For information about valid IOPS values, see
        Amazon RDS DB instance storage (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html)
        in the Amazon RDS User Guide.

        This setting doesn't apply to Amazon Aurora DB instances. Storage is managed
        by the DB cluster.

        Constraints:

           * For RDS for MariaDB, MySQL, Oracle, and PostgreSQL - Must be a multiple
           between .5 and 50 of the storage amount for the DB instance.

           * For RDS for SQL Server - Must be a multiple between 1 and 50 of the
           storage amount for the DB instance.
    kmsKeyID : str, optional
        The Amazon Web Services KMS key identifier for an encrypted DB instance.

        The Amazon Web Services KMS key identifier is the key ARN, key ID, alias
        ARN, or alias name for the KMS key. To use a KMS key in a different Amazon
        Web Services account, specify the key ARN or alias ARN.

        This setting doesn't apply to Amazon Aurora DB instances. The Amazon Web
        Services KMS key identifier is managed by the DB cluster. For more information,
        see CreateDBCluster.

        If StorageEncrypted is enabled, and you do not specify a value for the KmsKeyId
        parameter, then Amazon RDS uses your default KMS key. There is a default
        KMS key for your Amazon Web Services account. Your Amazon Web Services account
        has a different default KMS key for each Amazon Web Services Region.

        For Amazon RDS Custom, a KMS key is required for DB instances. For most RDS
        engines, if you leave this parameter empty while enabling StorageEncrypted,
        the engine uses the default KMS key. However, RDS Custom doesn't use the
        default key when this parameter is empty. You must explicitly specify a key.
    kmsKeyIDRef : DbinstancespecforproviderKmskeyidref, optional
        KMSKeyIDRef is a reference to a KMS Key used to set KMSKeyID.
    kmsKeyIDSelector : DbinstancespecforproviderKmskeyidselector, optional
        KMSKeyIDSelector selects a reference to a KMS Key used to set KMSKeyID.
    licenseModel : str, optional
        The license model information for this DB instance.

        This setting doesn't apply to Amazon Aurora or RDS Custom DB instances.

        Valid Values:

           * RDS for MariaDB - general-public-license

           * RDS for Microsoft SQL Server - license-included

           * RDS for MySQL - general-public-license

           * RDS for Oracle - bring-your-own-license | license-included

           * RDS for PostgreSQL - postgresql-license
    manageMasterUserPassword : bool, optional
        Specifies whether to manage the master user password with Amazon Web Services
        Secrets Manager.

        For more information, see Password management with Amazon Web Services Secrets
        Manager (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-secrets-manager.html)
        in the Amazon RDS User Guide.

        Constraints:

           * Can't manage the master user password with Amazon Web Services Secrets
           Manager if MasterUserPassword is specified.
    masterUserPasswordSecretRef : DbinstancespecforproviderMasteruserpasswordsecretref, optional
        The password for the master database user. This password can contain any
        printable ASCII character except "/", """, or "@".

        Constraints: Must contain from 8 to 41 characters.
    masterUserSecretKMSKeyID : str, optional
        The Amazon Web Services KMS key identifier to encrypt a secret that is automatically
        generated and managed in Amazon Web Services Secrets Manager.

        This setting is valid only if the master user password is managed by RDS
        in Amazon Web Services Secrets Manager for the DB instance.

        The Amazon Web Services KMS key identifier is the key ARN, key ID, alias
        ARN, or alias name for the KMS key. To use a KMS key in a different Amazon
        Web Services account, specify the key ARN or alias ARN.

        If you don't specify MasterUserSecretKmsKeyId, then the aws/secretsmanager
        KMS key is used to encrypt the secret. If the secret is in a different Amazon
        Web Services account, then you can't use the aws/secretsmanager KMS key to
        encrypt the secret, and you must use a customer managed KMS key.

        There is a default KMS key for your Amazon Web Services account. Your Amazon
        Web Services account has a different default KMS key for each Amazon Web
        Services Region.
    masterUsername : str, optional
        The name for the master user.

        This setting doesn't apply to Amazon Aurora DB instances. The name for the
        master user is managed by the DB cluster.

        This setting is required for RDS DB instances.

        Constraints:

           * Must be 1 to 16 letters, numbers, or underscores.

           * First character must be a letter.

           * Can't be a reserved word for the chosen database engine.
    maxAllocatedStorage : int, optional
        The upper limit in gibibytes (GiB) to which Amazon RDS can automatically
        scale the storage of the DB instance.

        For more information about this setting, including limitations that apply
        to it, see Managing capacity automatically with Amazon RDS storage autoscaling
        (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PIOPS.StorageTypes.html#USER_PIOPS.Autoscaling)
        in the Amazon RDS User Guide.

        This setting doesn't apply to the following DB instances:

           * Amazon Aurora (Storage is managed by the DB cluster.)

           * RDS Custom
    monitoringInterval : int, optional
        The interval, in seconds, between points when Enhanced Monitoring metrics
        are collected for the DB instance. To disable collection of Enhanced Monitoring
        metrics, specify 0.

        If MonitoringRoleArn is specified, then you must set MonitoringInterval to
        a value other than 0.

        This setting doesn't apply to RDS Custom DB instances.

        Valid Values: 0 | 1 | 5 | 10 | 15 | 30 | 60

        Default: 0
    monitoringRoleARN : str, optional
        The ARN for the IAM role that permits RDS to send enhanced monitoring metrics
        to Amazon CloudWatch Logs. For example, arn:aws:iam:123456789012:role/emaccess.
        For information on creating a monitoring role, see Setting Up and Enabling
        Enhanced Monitoring (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html#USER_Monitoring.OS.Enabling)
        in the Amazon RDS User Guide.

        If MonitoringInterval is set to a value other than 0, then you must supply
        a MonitoringRoleArn value.

        This setting doesn't apply to RDS Custom DB instances.
    monitoringRoleArnRef : DbinstancespecforproviderMonitoringrolearnref, optional
        MonitoringRoleARNRef is a reference to an IAMRole used to set
        MonitoringRoleARN.
    monitoringRoleArnSelector : DbinstancespecforproviderMonitoringrolearnselector, optional
        MonitoringRoleARNSelector selects a reference to an IAMRole used to set
        MonitoringRoleARN.
    multiAZ : bool, optional
        Specifies whether the DB instance is a Multi-AZ deployment. You can't set
        the AvailabilityZone parameter if the DB instance is a Multi-AZ deployment.

        This setting doesn't apply to the following DB instances:

           * Amazon Aurora (DB instance Availability Zones (AZs) are managed by the
           DB cluster.)

           * RDS Custom
    multiTenant : bool, optional
        Specifies whether to use the multi-tenant configuration or the single-tenant
        configuration (default). This parameter only applies to RDS for Oracle container
        database (CDB) engines.

        Note the following restrictions:

           * The DB engine that you specify in the request must support the multi-tenant
           configuration. If you attempt to enable the multi-tenant configuration
           on a DB engine that doesn't support it, the request fails.

           * If you specify the multi-tenant configuration when you create your DB
           instance, you can't later modify this DB instance to use the single-tenant
           configuration.
    ncharCharacterSetName : str, optional
        The name of the NCHAR character set for the Oracle DB instance.

        This setting doesn't apply to RDS Custom DB instances.
    networkType : str, optional
        The network type of the DB instance.

        The network type is determined by the DBSubnetGroup specified for the DB
        instance. A DBSubnetGroup can support only the IPv4 protocol or the IPv4
        and the IPv6 protocols (DUAL).

        For more information, see Working with a DB instance in a VPC (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_VPC.WorkingWithRDSInstanceinaVPC.html)
        in the Amazon RDS User Guide.

        Valid Values: IPV4 | DUAL
    optionGroupName : str, optional
        The option group to associate the DB instance with.

        Permanent options, such as the TDE option for Oracle Advanced Security TDE,
        can't be removed from an option group. Also, that option group can't be removed
        from a DB instance after it is associated with a DB instance.

        This setting doesn't apply to Amazon Aurora or RDS Custom DB instances.
    performanceInsightsKMSKeyID : str, optional
        The Amazon Web Services KMS key identifier for encryption of Performance
        Insights data.

        The Amazon Web Services KMS key identifier is the key ARN, key ID, alias
        ARN, or alias name for the KMS key.

        If you don't specify a value for PerformanceInsightsKMSKeyId, then Amazon
        RDS uses your default KMS key. There is a default KMS key for your Amazon
        Web Services account. Your Amazon Web Services account has a different default
        KMS key for each Amazon Web Services Region.

        This setting doesn't apply to RDS Custom DB instances.
    performanceInsightsRetentionPeriod : int, optional
        The number of days to retain Performance Insights data.

        This setting doesn't apply to RDS Custom DB instances.

        Valid Values:

           * 7

           * month * 31, where month is a number of months from 1-23. Examples: 93
           (3 months * 31), 341 (11 months * 31), 589 (19 months * 31)

           * 731

        Default: 7 days

        If you specify a retention period that isn't valid, such as 94, Amazon RDS
        returns an error.
    port : int, optional
        The port number on which the database accepts connections.

        This setting doesn't apply to Aurora DB instances. The port number is managed
        by the cluster.

        Valid Values: 1150-65535

        Default:

           * RDS for MariaDB - 3306

           * RDS for Microsoft SQL Server - 1433

           * RDS for MySQL - 3306

           * RDS for Oracle - 1521

           * RDS for PostgreSQL - 5432

        Constraints:

           * For RDS for Microsoft SQL Server, the value can't be 1234, 1434, 3260,
           3343, 3389, 47001, or 49152-49156.
    preferredBackupWindow : str, optional
        The daily time range during which automated backups are created if automated
        backups are enabled, using the BackupRetentionPeriod parameter. The default
        is a 30-minute window selected at random from an 8-hour block of time for
        each Amazon Web Services Region. For more information, see Backup window
        (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow)
        in the Amazon RDS User Guide.

        This setting doesn't apply to Amazon Aurora DB instances. The daily time
        range for creating automated backups is managed by the DB cluster.

        Constraints:

           * Must be in the format hh24:mi-hh24:mi.

           * Must be in Universal Coordinated Time (UTC).

           * Must not conflict with the preferred maintenance window.

           * Must be at least 30 minutes.
    preferredMaintenanceWindow : str, optional
        The time range each week during which system maintenance can occur. For more
        information, see Amazon RDS Maintenance Window (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Maintenance.html#Concepts.DBMaintenance)
        in the Amazon RDS User Guide.

        The default is a 30-minute window selected at random from an 8-hour block
        of time for each Amazon Web Services Region, occurring on a random day of
        the week.

        Constraints:

           * Must be in the format ddd:hh24:mi-ddd:hh24:mi.

           * The day values must be mon | tue | wed | thu | fri | sat | sun.

           * Must be in Universal Coordinated Time (UTC).

           * Must not conflict with the preferred backup window.

           * Must be at least 30 minutes.
    processorFeatures : [DbinstancespecforproviderProcessorfeaturesitem], optional
        The number of CPU cores and the number of threads per core for the DB instance
        class of the DB instance.

        This setting doesn't apply to Amazon Aurora or RDS Custom DB instances.
    promotionTier : int, optional
        The order of priority in which an Aurora Replica is promoted to the primary
        instance after a failure of the existing primary instance. For more information,
        see Fault Tolerance for an Aurora DB Cluster (https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.AuroraHighAvailability.html#Aurora.Managing.FaultTolerance)
        in the Amazon Aurora User Guide.

        This setting doesn't apply to RDS Custom DB instances.

        Default: 1

        Valid Values: 0 - 15
    publiclyAccessible : bool, optional
        Specifies whether the DB instance is publicly accessible.

        When the DB instance is publicly accessible, its Domain Name System (DNS)
        endpoint resolves to the private IP address from within the DB instance's
        virtual private cloud (VPC). It resolves to the public IP address from outside
        of the DB instance's VPC. Access to the DB instance is ultimately controlled
        by the security group it uses. That public access is not permitted if the
        security group assigned to the DB instance doesn't permit it.

        When the DB instance isn't publicly accessible, it is an internal DB instance
        with a DNS name that resolves to a private IP address.

        Default: The default behavior varies depending on whether DBSubnetGroupName
        is specified.

        If DBSubnetGroupName isn't specified, and PubliclyAccessible isn't specified,
        the following applies:

           * If the default VPC in the target Region doesn’t have an internet gateway
           attached to it, the DB instance is private.

           * If the default VPC in the target Region has an internet gateway attached
           to it, the DB instance is public.

        If DBSubnetGroupName is specified, and PubliclyAccessible isn't specified,
        the following applies:

           * If the subnets are part of a VPC that doesn’t have an internet gateway
           attached to it, the DB instance is private.

           * If the subnets are part of a VPC that has an internet gateway attached
           to it, the DB instance is public.
    region : str, required
        Region is which region the DBInstance will be created.
    restoreFrom : DbinstancespecforproviderRestorefrom, optional
        RestoreFrom specifies the details of the backup to restore when creating a new DBInstance.
    skipFinalSnapshot : bool, optional
        A value that indicates whether to skip the creation of a final DB instance
        snapshot before the DB instance is deleted. If skip is specified, no DB instance
        snapshot is created. If skip isn't specified, a DB instance snapshot is created
        before the DB instance is deleted. By default, skip isn't specified, and the
        DB instance snapshot is created. By default, this parameter is disabled.

        You must specify a FinalDBSnapshotIdentifier parameter if SkipFinalSnapshot
        is disabled.
    storageEncrypted : bool, optional
        Specifes whether the DB instance is encrypted. By default, it isn't encrypted.

        For RDS Custom DB instances, either enable this setting or leave it unset.
        Otherwise, Amazon RDS reports an error.

        This setting doesn't apply to Amazon Aurora DB instances. The encryption
        for DB instances is managed by the DB cluster.
    storageThroughput : int, optional
        The storage throughput value for the DB instance.

        This setting applies only to the gp3 storage type.

        This setting doesn't apply to Amazon Aurora or RDS Custom DB instances.
    storageType : str, optional
        The storage type to associate with the DB instance.

        If you specify io1 or gp3, you must also include a value for the Iops parameter.

        This setting doesn't apply to Amazon Aurora DB instances. Storage is managed
        by the DB cluster.

        Valid Values: gp2 | gp3 | io1 | standard

        Default: io1, if the Iops parameter is specified. Otherwise, gp2.
    tags : [DbinstancespecforproviderTagsitem], optional
        Tags to assign to the DB instance.
    tdeCredentialARN : str, optional
        The ARN from the key store with which to associate the instance for TDE encryption.

        This setting doesn't apply to Amazon Aurora or RDS Custom DB instances.
    tdeCredentialPassword : str, optional
        The password for the given ARN from the key store in order to access the
        device.

        This setting doesn't apply to RDS Custom DB instances.
    timezone : str, optional
        The time zone of the DB instance. The time zone parameter is currently supported
        only by Microsoft SQL Server (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.TimeZone).
    vpcSecurityGroupIDRefs : [DbinstancespecforproviderVpcsecuritygroupidrefsitem], optional
        VPCSecurityGroupIDRefs are references to VPCSecurityGroups used to set
        the VPCSecurityGroupIDs.
    vpcSecurityGroupIDSelector : DbinstancespecforproviderVpcsecuritygroupidselector, optional
        VPCSecurityGroupIDSelector selects references to VPCSecurityGroups used
        to set the VPCSecurityGroupIDs.
    vpcSecurityGroupIDs : [str], optional
        A list of Amazon EC2 VPC security groups to authorize on this DB instance.
        This change is asynchronously applied as soon as possible.

        This setting doesn't apply to RDS Custom.

        Amazon Aurora
        Not applicable. The associated list of EC2 VPC security groups is managed
        by the DB cluster. For more information, see ModifyDBCluster.

        Constraints:
           * If supplied, must match existing VpcSecurityGroupIds.
    """
    allocatedStorage? : int
    allowMajorVersionUpgrade? : bool
    applyImmediately? : bool
    autoMinorVersionUpgrade? : bool
    autogeneratePassword? : bool
    availabilityZone? : str
    backupRetentionPeriod? : int
    backupTarget? : str
    caCertificateIdentifier? : str
    characterSetName? : str
    copyTagsToSnapshot? : bool
    customIAMInstanceProfile? : str
    dbClusterIdentifier? : str
    dbClusterIdentifierRef? : DbinstancespecforproviderDbclusteridentifierref
    dbClusterIdentifierSelector? : DbinstancespecforproviderDbclusteridentifierselector
    dbInstanceClass : str
    dbName? : str
    dbParameterGroupName? : str
    dbParameterGroupNameRef? : DbinstancespecforproviderDbparametergroupnameref
    dbParameterGroupNameSelector? : DbinstancespecforproviderDbparametergroupnameselector
    dbSecurityGroups? : [str]
    dbSubnetGroupName? : str
    dbSubnetGroupNameRef? : DbinstancespecforproviderDbsubnetgroupnameref
    dbSubnetGroupNameSelector? : DbinstancespecforproviderDbsubnetgroupnameselector
    dbSystemID? : str
    dedicatedLogVolume? : bool
    deleteAutomatedBackups? : bool
    deletionProtection? : bool
    domain? : str
    domainAuthSecretARN? : str
    domainDNSIPs? : [str]
    domainFqdn? : str
    domainIAMRoleName? : str
    domainIAMRoleNameRef? : DbinstancespecforproviderDomainiamrolenameref
    domainIAMRoleNameSelector? : DbinstancespecforproviderDomainiamrolenameselector
    domainOu? : str
    enableCloudwatchLogsExports? : [str]
    enableCustomerOwnedIP? : bool
    enableIAMDatabaseAuthentication? : bool
    enablePerformanceInsights? : bool
    engine : str
    engineVersion? : str
    finalDBSnapshotIdentifier? : str
    iops? : int
    kmsKeyID? : str
    kmsKeyIDRef? : DbinstancespecforproviderKmskeyidref
    kmsKeyIDSelector? : DbinstancespecforproviderKmskeyidselector
    licenseModel? : str
    manageMasterUserPassword? : bool
    masterUserPasswordSecretRef? : DbinstancespecforproviderMasteruserpasswordsecretref
    masterUserSecretKMSKeyID? : str
    masterUsername? : str
    maxAllocatedStorage? : int
    monitoringInterval? : int
    monitoringRoleARN? : str
    monitoringRoleArnRef? : DbinstancespecforproviderMonitoringrolearnref
    monitoringRoleArnSelector? : DbinstancespecforproviderMonitoringrolearnselector
    multiAZ? : bool
    multiTenant? : bool
    ncharCharacterSetName? : str
    networkType? : str
    optionGroupName? : str
    performanceInsightsKMSKeyID? : str
    performanceInsightsRetentionPeriod? : int
    port? : int
    preferredBackupWindow? : str
    preferredMaintenanceWindow? : str
    processorFeatures? : [DbinstancespecforproviderProcessorfeaturesitem]
    promotionTier? : int
    publiclyAccessible? : bool
    region : str
    restoreFrom? : DbinstancespecforproviderRestorefrom
    skipFinalSnapshot? : bool
    storageEncrypted? : bool
    storageThroughput? : int
    storageType? : str
    tags? : [DbinstancespecforproviderTagsitem]
    tdeCredentialARN? : str
    tdeCredentialPassword? : str
    timezone? : str
    vpcSecurityGroupIDRefs? : [DbinstancespecforproviderVpcsecuritygroupidrefsitem]
    vpcSecurityGroupIDSelector? : DbinstancespecforproviderVpcsecuritygroupidselector
    vpcSecurityGroupIDs? : [str]

schema DbinstancespecforproviderDbclusteridentifierref:
    """
    DBClusterIdentifierRef is a reference to a DBCluster used to set
    DBClusterIdentifier.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : DbinstancespecforproviderdbclusteridentifierrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : DbinstancespecforproviderdbclusteridentifierrefPolicy

schema DbinstancespecforproviderdbclusteridentifierrefPolicy:
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

schema DbinstancespecforproviderDbclusteridentifierselector:
    """
    DBClusterIdentifierSelector selects a reference to a DBCluster used to
    set DBClusterIdentifier.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : DbinstancespecforproviderdbclusteridentifierselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : DbinstancespecforproviderdbclusteridentifierselectorPolicy

schema DbinstancespecforproviderdbclusteridentifierselectorPolicy:
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

schema DbinstancespecforproviderDbparametergroupnameref:
    """
    DBParameterGroupNameRef is a reference to a DBParameterGroup used to set
    DBParameterGroupName.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : DbinstancespecforproviderdbparametergroupnamerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : DbinstancespecforproviderdbparametergroupnamerefPolicy

schema DbinstancespecforproviderdbparametergroupnamerefPolicy:
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

schema DbinstancespecforproviderDbparametergroupnameselector:
    """
    DBParameterGroupNameSelector selects a reference to a DBParameterGroup used to
    set DBParameterGroupName.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : DbinstancespecforproviderdbparametergroupnameselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : DbinstancespecforproviderdbparametergroupnameselectorPolicy

schema DbinstancespecforproviderdbparametergroupnameselectorPolicy:
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

schema DbinstancespecforproviderDbsubnetgroupnameref:
    """
    DBSubnetGroupNameRef is a reference to a DBSubnetGroup used to set
    DBSubnetGroupName.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : DbinstancespecforproviderdbsubnetgroupnamerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : DbinstancespecforproviderdbsubnetgroupnamerefPolicy

schema DbinstancespecforproviderdbsubnetgroupnamerefPolicy:
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

schema DbinstancespecforproviderDbsubnetgroupnameselector:
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
    policy : DbinstancespecforproviderdbsubnetgroupnameselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : DbinstancespecforproviderdbsubnetgroupnameselectorPolicy

schema DbinstancespecforproviderdbsubnetgroupnameselectorPolicy:
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

schema DbinstancespecforproviderDomainiamrolenameref:
    """
    DomainIAMRoleNameRef is a reference to an IAMRole used to set
    DomainIAMRoleName.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : DbinstancespecforproviderdomainiamrolenamerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : DbinstancespecforproviderdomainiamrolenamerefPolicy

schema DbinstancespecforproviderdomainiamrolenamerefPolicy:
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

schema DbinstancespecforproviderDomainiamrolenameselector:
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
    policy : DbinstancespecforproviderdomainiamrolenameselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : DbinstancespecforproviderdomainiamrolenameselectorPolicy

schema DbinstancespecforproviderdomainiamrolenameselectorPolicy:
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

schema DbinstancespecforproviderKmskeyidref:
    """
    KMSKeyIDRef is a reference to a KMS Key used to set KMSKeyID.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : DbinstancespecforproviderkmskeyidrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : DbinstancespecforproviderkmskeyidrefPolicy

schema DbinstancespecforproviderkmskeyidrefPolicy:
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

schema DbinstancespecforproviderKmskeyidselector:
    """
    KMSKeyIDSelector selects a reference to a KMS Key used to set KMSKeyID.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : DbinstancespecforproviderkmskeyidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : DbinstancespecforproviderkmskeyidselectorPolicy

schema DbinstancespecforproviderkmskeyidselectorPolicy:
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

schema DbinstancespecforproviderMasteruserpasswordsecretref:
    """
    The password for the master database user. This password can contain any
    printable ASCII character except "/", """, or "@".

    Constraints: Must contain from 8 to 41 characters.

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

schema DbinstancespecforproviderMonitoringrolearnref:
    """
    MonitoringRoleARNRef is a reference to an IAMRole used to set
    MonitoringRoleARN.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : DbinstancespecforprovidermonitoringrolearnrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : DbinstancespecforprovidermonitoringrolearnrefPolicy

schema DbinstancespecforprovidermonitoringrolearnrefPolicy:
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

schema DbinstancespecforproviderMonitoringrolearnselector:
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
    policy : DbinstancespecforprovidermonitoringrolearnselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : DbinstancespecforprovidermonitoringrolearnselectorPolicy

schema DbinstancespecforprovidermonitoringrolearnselectorPolicy:
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

schema DbinstancespecforproviderProcessorfeaturesitem:
    """
    DbinstancespecforproviderProcessorfeaturesitem schema.

    Attributes
    ----------
    name : str, optional
        No description available.
    value : str, optional
        No description available.
    """
    name? : str
    value? : str

schema DbinstancespecforproviderRestorefrom:
    """
    RestoreFrom specifies the details of the backup to restore when creating a new DBInstance.

    Attributes
    ----------
    pointInTime : DbinstancespecforproviderrestorefromPointintime, optional
        PointInTime specifies the details of the point in time restore.
    s3 : DbinstancespecforproviderrestorefromS3, optional
        S3 specifies the details of the S3 backup to restore from.
    snapshot : DbinstancespecforproviderrestorefromSnapshot, optional
        Snapshot specifies the details of the snapshot to restore from.
    source : "S3" | "Snapshot" | "PointInTime", required
        Source is the type of the backup to restore when creating a new  DBCluster or DBInstance.
        S3, Snapshot and PointInTime are supported.
    """
    pointInTime? : DbinstancespecforproviderrestorefromPointintime
    s3? : DbinstancespecforproviderrestorefromS3
    snapshot? : DbinstancespecforproviderrestorefromSnapshot
    source : "S3" | "Snapshot" | "PointInTime"

schema DbinstancespecforproviderrestorefromPointintime:
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

schema DbinstancespecforproviderrestorefromS3:
    """
    S3 specifies the details of the S3 backup to restore from.

    Attributes
    ----------
    bucketName : str, required
        BucketName is the name of the S3 bucket containing the backup to restore.
    ingestionRoleARN : str, required
        IngestionRoleARN is the IAM role RDS can assume that will allow it to access the contents of the S3 bucket.
    prefix : str, optional
        Prefix is the path prefix of the S3 bucket within which the backup to restore is located.
    sourceEngine : str, required
        SourceEngine is the engine used to create the backup.
        Must be "mysql".
    sourceEngineVersion : str, required
        SourceEngineVersion is the version of the engine used to create the backup.
        Example: "5.7.30"
    """
    bucketName : str
    ingestionRoleARN : str
    prefix? : str
    sourceEngine : str
    sourceEngineVersion : str

schema DbinstancespecforproviderrestorefromSnapshot:
    """
    Snapshot specifies the details of the snapshot to restore from.

    Attributes
    ----------
    snapshotIdentifier : str, required
        SnapshotIdentifier is the identifier of the snapshot to restore.
    """
    snapshotIdentifier : str

schema DbinstancespecforproviderTagsitem:
    """
    DbinstancespecforproviderTagsitem schema.

    Attributes
    ----------
    key : str, optional
        No description available.
    value : str, optional
        No description available.
    """
    key? : str
    value? : str

schema DbinstancespecforproviderVpcsecuritygroupidrefsitem:
    """
    A Reference to a named object.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : DbinstancespecforprovidervpcsecuritygroupidrefsitemPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : DbinstancespecforprovidervpcsecuritygroupidrefsitemPolicy

schema DbinstancespecforprovidervpcsecuritygroupidrefsitemPolicy:
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

schema DbinstancespecforproviderVpcsecuritygroupidselector:
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
    policy : DbinstancespecforprovidervpcsecuritygroupidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : DbinstancespecforprovidervpcsecuritygroupidselectorPolicy

schema DbinstancespecforprovidervpcsecuritygroupidselectorPolicy:
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

schema DbinstancespecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : DbinstancespecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : DbinstancespecproviderconfigrefPolicy

schema DbinstancespecproviderconfigrefPolicy:
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

schema DbinstancespecPublishconnectiondetailsto:
    """
    PublishConnectionDetailsTo specifies the connection secret config which
    contains a name, metadata and a reference to secret store config to
    which any connection details for this managed resource should be written.
    Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.

    Attributes
    ----------
    configRef : DbinstancespecpublishconnectiondetailstoConfigref, optional
        SecretStoreConfigRef specifies which secret store config should be used
        for this ConnectionSecret.
    metadata : DbinstancespecpublishconnectiondetailstoMetadata, optional
        Metadata is the metadata for connection secret.
    name : str, required
        Name is the name of the connection secret.
    """
    configRef? : DbinstancespecpublishconnectiondetailstoConfigref
    metadata? : DbinstancespecpublishconnectiondetailstoMetadata
    name : str

schema DbinstancespecpublishconnectiondetailstoConfigref:
    """
    SecretStoreConfigRef specifies which secret store config should be used
    for this ConnectionSecret.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : DbinstancespecpublishconnectiondetailstoconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : DbinstancespecpublishconnectiondetailstoconfigrefPolicy

schema DbinstancespecpublishconnectiondetailstoconfigrefPolicy:
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

schema DbinstancespecpublishconnectiondetailstoMetadata:
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

schema DbinstancespecWriteconnectionsecrettoref:
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

schema DbinstanceStatus:
    """
    DBInstanceStatus defines the observed state of DBInstance.

    Attributes
    ----------
    atProvider : DbinstancestatusAtprovider, optional
        DBInstanceObservation defines the observed state of DBInstance
    conditions : [DbinstancestatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : DbinstancestatusAtprovider
    conditions? : [DbinstancestatusConditionsitem]
    observedGeneration? : int

schema DbinstancestatusAtprovider:
    """
    DBInstanceObservation defines the observed state of DBInstance

    Attributes
    ----------
    activityStreamEngineNativeAuditFieldsIncluded : bool, optional
        Indicates whether engine-native audit fields are included in the database
        activity stream.
    activityStreamKMSKeyID : str, optional
        The Amazon Web Services KMS key identifier used for encrypting messages in
        the database activity stream. The Amazon Web Services KMS key identifier
        is the key ARN, key ID, alias ARN, or alias name for the KMS key.
    activityStreamKinesisStreamName : str, optional
        The name of the Amazon Kinesis data stream used for the database activity
        stream.
    activityStreamMode : str, optional
        The mode of the database activity stream. Database events such as a change
        or access generate an activity stream event. RDS for Oracle always handles
        these events asynchronously.
    activityStreamPolicyStatus : str, optional
        The status of the policy state of the activity stream.
    activityStreamStatus : str, optional
        The status of the database activity stream.
    associatedRoles : [DbinstancestatusatproviderAssociatedrolesitem], optional
        The Amazon Web Services Identity and Access Management (IAM) roles associated
        with the DB instance.
    automaticRestartTime : str, optional
        The time when a stopped DB instance is restarted automatically.
    automationMode : str, optional
        The automation mode of the RDS Custom DB instance: full or all paused. If
        full, the DB instance automates monitoring and instance recovery. If all
        paused, the instance pauses automation for the duration set by --resume-full-automation-mode-minutes.
    awsBackupRecoveryPointARN : str, optional
        The Amazon Resource Name (ARN) of the recovery point in Amazon Web Services
        Backup.
    certificateDetails : DbinstancestatusatproviderCertificatedetails, optional
        The details of the DB instance's server certificate.
    customerOwnedIPEnabled : bool, optional
        Indicates whether a customer-owned IP address (CoIP) is enabled for an RDS
        on Outposts DB instance.

        A CoIP provides local or external connectivity to resources in your Outpost
        subnets through your on-premises network. For some use cases, a CoIP can
        provide lower latency for connections to the DB instance from outside of
        its virtual private cloud (VPC) on your local network.

        For more information about RDS on Outposts, see Working with Amazon RDS on
        Amazon Web Services Outposts (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-on-outposts.html)
        in the Amazon RDS User Guide.

        For more information about CoIPs, see Customer-owned IP addresses (https://docs.aws.amazon.com/outposts/latest/userguide/routing.html#ip-addressing)
        in the Amazon Web Services Outposts User Guide.
    dbClusterIdentifier : str, optional
        If the DB instance is a member of a DB cluster, indicates the name of the
        DB cluster that the DB instance is a member of.
    dbInstanceARN : str, optional
        The Amazon Resource Name (ARN) for the DB instance.
    dbInstanceAutomatedBackupsReplications : [DbinstancestatusatproviderDbinstanceautomatedbackupsreplicationsitem], optional
        The list of replicated automated backups associated with the DB instance.
    dbInstanceIdentifier : str, optional
        The user-supplied database identifier. This identifier is the unique key
        that identifies a DB instance.
    dbInstancePort : int, optional
        The port that the DB instance listens on. If the DB instance is part of a
        DB cluster, this can be a different port than the DB cluster port.
    dbInstanceStatus : str, optional
        The current state of this database.

        For information about DB instance statuses, see Viewing DB instance status
        (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/accessing-monitoring.html#Overview.DBInstance.Status)
        in the Amazon RDS User Guide.
    dbParameterGroups : [DbinstancestatusatproviderDbparametergroupsitem], optional
        The list of DB parameter groups applied to this DB instance.
    dbSecurityGroups : [DbinstancestatusatproviderDbsecuritygroupsitem], optional
        A list of DB security group elements containing DBSecurityGroup.Name and
        DBSecurityGroup.Status subelements.
    dbSubnetGroup : DbinstancestatusatproviderDbsubnetgroup, optional
        Information about the subnet group associated with the DB instance, including
        the name, description, and subnets in the subnet group.
    dbiResourceID : str, optional
        The Amazon Web Services Region-unique, immutable identifier for the DB instance.
        This identifier is found in Amazon Web Services CloudTrail log entries whenever
        the Amazon Web Services KMS key for the DB instance is accessed.
    domainMemberships : [DbinstancestatusatproviderDomainmembershipsitem], optional
        The Active Directory Domain membership records associated with the DB instance.
    enabledCloudwatchLogsExports : [str], optional
        A list of log types that this DB instance is configured to export to CloudWatch
        Logs.

        Log types vary by DB engine. For information about the log types for each
        DB engine, see Monitoring Amazon RDS log files (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html)
        in the Amazon RDS User Guide.
    endpoint : DbinstancestatusatproviderEndpoint, optional
        The connection endpoint for the DB instance.

        The endpoint might not be shown for instances with the status of creating.
    engineVersion : str, optional
        The version of the database engine.
    enhancedMonitoringResourceARN : str, optional
        The Amazon Resource Name (ARN) of the Amazon CloudWatch Logs log stream that
        receives the Enhanced Monitoring metrics data for the DB instance.
    iamDatabaseAuthenticationEnabled : bool, optional
        Indicates whether mapping of Amazon Web Services Identity and Access Management
        (IAM) accounts to database accounts is enabled for the DB instance.

        For a list of engine versions that support IAM database authentication, see
        IAM database authentication (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RDS_Fea_Regions_DB-eng.Feature.IamDatabaseAuthentication.html)
        in the Amazon RDS User Guide and IAM database authentication in Aurora (https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.Aurora_Fea_Regions_DB-eng.Feature.IAMdbauth.html)
        in the Amazon Aurora User Guide.
    instanceCreateTime : str, optional
        The date and time when the DB instance was created.
    isStorageConfigUpgradeAvailable : bool, optional
        Indicates whether an upgrade is recommended for the storage file system configuration
        on the DB instance. To migrate to the preferred configuration, you can either
        create a blue/green deployment, or create a read replica from the DB instance.
        For more information, see Upgrading the storage file system for a DB instance
        (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PIOPS.StorageTypes.html#USER_PIOPS.UpgradeFileSystem).
    kmsKeyID : str, optional
        If StorageEncrypted is enabled, the Amazon Web Services KMS key identifier
        for the encrypted DB instance.

        The Amazon Web Services KMS key identifier is the key ARN, key ID, alias
        ARN, or alias name for the KMS key.
    latestRestorableTime : str, optional
        The latest time to which a database in this DB instance can be restored with
        point-in-time restore.
    listenerEndpoint : DbinstancestatusatproviderListenerendpoint, optional
        The listener connection endpoint for SQL Server Always On.
    masterUserSecret : DbinstancestatusatproviderMasterusersecret, optional
        The secret managed by RDS in Amazon Web Services Secrets Manager for the
        master user password.

        For more information, see Password management with Amazon Web Services Secrets
        Manager (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-secrets-manager.html)
        in the Amazon RDS User Guide.
    optionGroupMemberships : [DbinstancestatusatproviderOptiongroupmembershipsitem], optional
        The list of option group memberships for this DB instance.
    pendingModifiedValues : DbinstancestatusatproviderPendingmodifiedvalues, optional
        Information about pending changes to the DB instance. This information is
        returned only when there are pending changes. Specific changes are identified
        by subelements.
    percentProgress : str, optional
        The progress of the storage optimization operation as a percentage.
    performanceInsightsEnabled : bool, optional
        Indicates whether Performance Insights is enabled for the DB instance.
    readReplicaDBClusterIdentifiers : [str], optional
        The identifiers of Aurora DB clusters to which the RDS DB instance is replicated
        as a read replica. For example, when you create an Aurora read replica of
        an RDS for MySQL DB instance, the Aurora MySQL DB cluster for the Aurora
        read replica is shown. This output doesn't contain information about cross-Region
        Aurora read replicas.

        Currently, each RDS DB instance can have only one Aurora read replica.
    readReplicaDBInstanceIdentifiers : [str], optional
        The identifiers of the read replicas associated with this DB instance.
    readReplicaSourceDBClusterIdentifier : str, optional
        The identifier of the source DB cluster if this DB instance is a read replica.
    readReplicaSourceDBInstanceIdentifier : str, optional
        The identifier of the source DB instance if this DB instance is a read replica.
    replicaMode : str, optional
        The open mode of an Oracle read replica. The default is open-read-only. For
        more information, see Working with Oracle Read Replicas for Amazon RDS (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/oracle-read-replicas.html)
        in the Amazon RDS User Guide.

        This attribute is only supported in RDS for Oracle.
    resumeFullAutomationModeTime : str, optional
        The number of minutes to pause the automation. When the time period ends,
        RDS Custom resumes full automation. The minimum value is 60 (default). The
        maximum value is 1,440.
    secondaryAvailabilityZone : str, optional
        If present, specifies the name of the secondary Availability Zone for a DB
        instance with multi-AZ support.
    statusInfos : [DbinstancestatusatproviderStatusinfositem], optional
        The status of a read replica. If the DB instance isn't a read replica, the
        value is blank.
    tagList : [DbinstancestatusatproviderTaglistitem], optional
        No description available.
    vpcSecurityGroups : [DbinstancestatusatproviderVpcsecuritygroupsitem], optional
        The list of Amazon EC2 VPC security groups that the DB instance belongs to.
    """
    activityStreamEngineNativeAuditFieldsIncluded? : bool
    activityStreamKMSKeyID? : str
    activityStreamKinesisStreamName? : str
    activityStreamMode? : str
    activityStreamPolicyStatus? : str
    activityStreamStatus? : str
    associatedRoles? : [DbinstancestatusatproviderAssociatedrolesitem]
    automaticRestartTime? : str
    automationMode? : str
    awsBackupRecoveryPointARN? : str
    certificateDetails? : DbinstancestatusatproviderCertificatedetails
    customerOwnedIPEnabled? : bool
    dbClusterIdentifier? : str
    dbInstanceARN? : str
    dbInstanceAutomatedBackupsReplications? : [DbinstancestatusatproviderDbinstanceautomatedbackupsreplicationsitem]
    dbInstanceIdentifier? : str
    dbInstancePort? : int
    dbInstanceStatus? : str
    dbParameterGroups? : [DbinstancestatusatproviderDbparametergroupsitem]
    dbSecurityGroups? : [DbinstancestatusatproviderDbsecuritygroupsitem]
    dbSubnetGroup? : DbinstancestatusatproviderDbsubnetgroup
    dbiResourceID? : str
    domainMemberships? : [DbinstancestatusatproviderDomainmembershipsitem]
    enabledCloudwatchLogsExports? : [str]
    endpoint? : DbinstancestatusatproviderEndpoint
    engineVersion? : str
    enhancedMonitoringResourceARN? : str
    iamDatabaseAuthenticationEnabled? : bool
    instanceCreateTime? : str
    isStorageConfigUpgradeAvailable? : bool
    kmsKeyID? : str
    latestRestorableTime? : str
    listenerEndpoint? : DbinstancestatusatproviderListenerendpoint
    masterUserSecret? : DbinstancestatusatproviderMasterusersecret
    optionGroupMemberships? : [DbinstancestatusatproviderOptiongroupmembershipsitem]
    pendingModifiedValues? : DbinstancestatusatproviderPendingmodifiedvalues
    percentProgress? : str
    performanceInsightsEnabled? : bool
    readReplicaDBClusterIdentifiers? : [str]
    readReplicaDBInstanceIdentifiers? : [str]
    readReplicaSourceDBClusterIdentifier? : str
    readReplicaSourceDBInstanceIdentifier? : str
    replicaMode? : str
    resumeFullAutomationModeTime? : str
    secondaryAvailabilityZone? : str
    statusInfos? : [DbinstancestatusatproviderStatusinfositem]
    tagList? : [DbinstancestatusatproviderTaglistitem]
    vpcSecurityGroups? : [DbinstancestatusatproviderVpcsecuritygroupsitem]

schema DbinstancestatusatproviderAssociatedrolesitem:
    """
    DbinstancestatusatproviderAssociatedrolesitem schema.

    Attributes
    ----------
    featureName : str, optional
        No description available.
    roleARN : str, optional
        No description available.
    status : str, optional
        No description available.
    """
    featureName? : str
    roleARN? : str
    status? : str

schema DbinstancestatusatproviderCertificatedetails:
    """
    The details of the DB instance's server certificate.

    Attributes
    ----------
    cAIdentifier : str, optional
        No description available.
    validTill : str, optional
        No description available.
    """
    cAIdentifier? : str
    validTill? : str

schema DbinstancestatusatproviderDbinstanceautomatedbackupsreplicationsitem:
    """
    DbinstancestatusatproviderDbinstanceautomatedbackupsreplicationsitem schema.

    Attributes
    ----------
    dbInstanceAutomatedBackupsARN : str, optional
        No description available.
    """
    dbInstanceAutomatedBackupsARN? : str

schema DbinstancestatusatproviderDbparametergroupsitem:
    """
    DbinstancestatusatproviderDbparametergroupsitem schema.

    Attributes
    ----------
    dbParameterGroupName : str, optional
        No description available.
    parameterApplyStatus : str, optional
        No description available.
    """
    dbParameterGroupName? : str
    parameterApplyStatus? : str

schema DbinstancestatusatproviderDbsecuritygroupsitem:
    """
    DbinstancestatusatproviderDbsecuritygroupsitem schema.

    Attributes
    ----------
    dbSecurityGroupName : str, optional
        No description available.
    status : str, optional
        No description available.
    """
    dbSecurityGroupName? : str
    status? : str

schema DbinstancestatusatproviderDbsubnetgroup:
    """
    Information about the subnet group associated with the DB instance, including
    the name, description, and subnets in the subnet group.

    Attributes
    ----------
    dbSubnetGroupARN : str, optional
        No description available.
    dbSubnetGroupDescription : str, optional
        No description available.
    dbSubnetGroupName : str, optional
        No description available.
    subnetGroupStatus : str, optional
        No description available.
    subnets : [DbinstancestatusatproviderdbsubnetgroupSubnetsitem], optional
        No description available.
    supportedNetworkTypes : [str], optional
        No description available.
    vpcID : str, optional
        No description available.
    """
    dbSubnetGroupARN? : str
    dbSubnetGroupDescription? : str
    dbSubnetGroupName? : str
    subnetGroupStatus? : str
    subnets? : [DbinstancestatusatproviderdbsubnetgroupSubnetsitem]
    supportedNetworkTypes? : [str]
    vpcID? : str

schema DbinstancestatusatproviderdbsubnetgroupSubnetsitem:
    """
    DbinstancestatusatproviderdbsubnetgroupSubnetsitem schema.

    Attributes
    ----------
    subnetAvailabilityZone : DbinstancestatusatproviderdbsubnetgroupsubnetsitemSubnetavailabilityzone, optional
        Contains Availability Zone information.

        This data type is used as an element in the OrderableDBInstanceOption data
        type.
    subnetIdentifier : str, optional
        No description available.
    subnetOutpost : DbinstancestatusatproviderdbsubnetgroupsubnetsitemSubnetoutpost, optional
        A data type that represents an Outpost.

        For more information about RDS on Outposts, see Amazon RDS on Amazon Web
        Services Outposts (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-on-outposts.html)
        in the Amazon RDS User Guide.
    subnetStatus : str, optional
        No description available.
    """
    subnetAvailabilityZone? : DbinstancestatusatproviderdbsubnetgroupsubnetsitemSubnetavailabilityzone
    subnetIdentifier? : str
    subnetOutpost? : DbinstancestatusatproviderdbsubnetgroupsubnetsitemSubnetoutpost
    subnetStatus? : str

schema DbinstancestatusatproviderdbsubnetgroupsubnetsitemSubnetavailabilityzone:
    """
    Contains Availability Zone information.

    This data type is used as an element in the OrderableDBInstanceOption data
    type.

    Attributes
    ----------
    name : str, optional
        No description available.
    """
    name? : str

schema DbinstancestatusatproviderdbsubnetgroupsubnetsitemSubnetoutpost:
    """
    A data type that represents an Outpost.

    For more information about RDS on Outposts, see Amazon RDS on Amazon Web
    Services Outposts (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-on-outposts.html)
    in the Amazon RDS User Guide.

    Attributes
    ----------
    arn : str, optional
        No description available.
    """
    arn? : str

schema DbinstancestatusatproviderDomainmembershipsitem:
    """
    DbinstancestatusatproviderDomainmembershipsitem schema.

    Attributes
    ----------
    authSecretARN : str, optional
        No description available.
    dnsIPs : [str], optional
        No description available.
    domain : str, optional
        No description available.
    fQDN : str, optional
        No description available.
    iamRoleName : str, optional
        No description available.
    oU : str, optional
        No description available.
    status : str, optional
        No description available.
    """
    authSecretARN? : str
    dnsIPs? : [str]
    domain? : str
    fQDN? : str
    iamRoleName? : str
    oU? : str
    status? : str

schema DbinstancestatusatproviderEndpoint:
    """
    The connection endpoint for the DB instance.

    The endpoint might not be shown for instances with the status of creating.

    Attributes
    ----------
    address : str, optional
        No description available.
    hostedZoneID : str, optional
        No description available.
    port : int, optional
        No description available.
    """
    address? : str
    hostedZoneID? : str
    port? : int

schema DbinstancestatusatproviderListenerendpoint:
    """
    The listener connection endpoint for SQL Server Always On.

    Attributes
    ----------
    address : str, optional
        No description available.
    hostedZoneID : str, optional
        No description available.
    port : int, optional
        No description available.
    """
    address? : str
    hostedZoneID? : str
    port? : int

schema DbinstancestatusatproviderMasterusersecret:
    """
    The secret managed by RDS in Amazon Web Services Secrets Manager for the
    master user password.

    For more information, see Password management with Amazon Web Services Secrets
    Manager (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-secrets-manager.html)
    in the Amazon RDS User Guide.

    Attributes
    ----------
    kmsKeyID : str, optional
        No description available.
    secretARN : str, optional
        No description available.
    secretStatus : str, optional
        No description available.
    """
    kmsKeyID? : str
    secretARN? : str
    secretStatus? : str

schema DbinstancestatusatproviderOptiongroupmembershipsitem:
    """
    DbinstancestatusatproviderOptiongroupmembershipsitem schema.

    Attributes
    ----------
    optionGroupName : str, optional
        No description available.
    status : str, optional
        No description available.
    """
    optionGroupName? : str
    status? : str

schema DbinstancestatusatproviderPendingmodifiedvalues:
    """
    Information about pending changes to the DB instance. This information is
    returned only when there are pending changes. Specific changes are identified
    by subelements.

    Attributes
    ----------
    allocatedStorage : int, optional
        No description available.
    automationMode : str, optional
        No description available.
    backupRetentionPeriod : int, optional
        No description available.
    caCertificateIdentifier : str, optional
        No description available.
    dbInstanceClass : str, optional
        No description available.
    dbInstanceIdentifier : str, optional
        No description available.
    dbSubnetGroupName : str, optional
        No description available.
    dedicatedLogVolume : bool, optional
        No description available.
    engine : str, optional
        No description available.
    engineVersion : str, optional
        No description available.
    iamDatabaseAuthenticationEnabled : bool, optional
        No description available.
    iops : int, optional
        No description available.
    licenseModel : str, optional
        No description available.
    masterUserPassword : str, optional
        No description available.
    multiAZ : bool, optional
        No description available.
    multiTenant : bool, optional
        No description available.
    pendingCloudwatchLogsExports : DbinstancestatusatproviderpendingmodifiedvaluesPendingcloudwatchlogsexports, optional
        A list of the log types whose configuration is still pending. In other words,
        these log types are in the process of being activated or deactivated.
    port : int, optional
        No description available.
    processorFeatures : [DbinstancestatusatproviderpendingmodifiedvaluesProcessorfeaturesitem], optional
        No description available.
    resumeFullAutomationModeTime : str, optional
        No description available.
    storageThroughput : int, optional
        No description available.
    storageType : str, optional
        No description available.
    """
    allocatedStorage? : int
    automationMode? : str
    backupRetentionPeriod? : int
    caCertificateIdentifier? : str
    dbInstanceClass? : str
    dbInstanceIdentifier? : str
    dbSubnetGroupName? : str
    dedicatedLogVolume? : bool
    engine? : str
    engineVersion? : str
    iamDatabaseAuthenticationEnabled? : bool
    iops? : int
    licenseModel? : str
    masterUserPassword? : str
    multiAZ? : bool
    multiTenant? : bool
    pendingCloudwatchLogsExports? : DbinstancestatusatproviderpendingmodifiedvaluesPendingcloudwatchlogsexports
    port? : int
    processorFeatures? : [DbinstancestatusatproviderpendingmodifiedvaluesProcessorfeaturesitem]
    resumeFullAutomationModeTime? : str
    storageThroughput? : int
    storageType? : str

schema DbinstancestatusatproviderpendingmodifiedvaluesPendingcloudwatchlogsexports:
    """
    A list of the log types whose configuration is still pending. In other words,
    these log types are in the process of being activated or deactivated.

    Attributes
    ----------
    logTypesToDisable : [str], optional
        No description available.
    logTypesToEnable : [str], optional
        No description available.
    """
    logTypesToDisable? : [str]
    logTypesToEnable? : [str]

schema DbinstancestatusatproviderpendingmodifiedvaluesProcessorfeaturesitem:
    """
    DbinstancestatusatproviderpendingmodifiedvaluesProcessorfeaturesitem schema.

    Attributes
    ----------
    name : str, optional
        No description available.
    value : str, optional
        No description available.
    """
    name? : str
    value? : str

schema DbinstancestatusatproviderStatusinfositem:
    """
    DbinstancestatusatproviderStatusinfositem schema.

    Attributes
    ----------
    message : str, optional
        No description available.
    normal : bool, optional
        No description available.
    status : str, optional
        No description available.
    statusType : str, optional
        No description available.
    """
    message? : str
    normal? : bool
    status? : str
    statusType? : str

schema DbinstancestatusatproviderTaglistitem:
    """
    DbinstancestatusatproviderTaglistitem schema.

    Attributes
    ----------
    key : str, optional
        No description available.
    value : str, optional
        No description available.
    """
    key? : str
    value? : str

schema DbinstancestatusatproviderVpcsecuritygroupsitem:
    """
    DbinstancestatusatproviderVpcsecuritygroupsitem schema.

    Attributes
    ----------
    status : str, optional
        No description available.
    vpcSecurityGroupID : str, optional
        No description available.
    """
    status? : str
    vpcSecurityGroupID? : str

schema DbinstancestatusConditionsitem:
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