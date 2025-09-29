"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.

It is based on the provided OpenAPI v2 JSON schema.

DO NOT EDIT MANUALLY.
"""

schema Dbparametergroup:
    """
    DBParameterGroup is the Schema for the DBParameterGroups API

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
    spec : DbparametergroupSpec, required
        DBParameterGroupSpec defines the desired state of DBParameterGroup
    status : DbparametergroupStatus, optional
        DBParameterGroupStatus defines the observed state of DBParameterGroup.
    """
    apiVersion : str = "rds.aws.crossplane.io/v1alpha1"
    kind : str = "DBParameterGroup"
    metadata? : any
    spec : DbparametergroupSpec
    status? : DbparametergroupStatus

schema DbparametergroupSpec:
    """
    DBParameterGroupSpec defines the desired state of DBParameterGroup

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
    forProvider : DbparametergroupspecForprovider, required
        DBParameterGroupParameters defines the desired state of DBParameterGroup
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
    providerConfigRef : DbparametergroupspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    publishConnectionDetailsTo : DbparametergroupspecPublishconnectiondetailsto, optional
        PublishConnectionDetailsTo specifies the connection secret config which
        contains a name, metadata and a reference to secret store config to
        which any connection details for this managed resource should be written.
        Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    writeConnectionSecretToRef : DbparametergroupspecWriteconnectionsecrettoref, optional
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
    forProvider : DbparametergroupspecForprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : DbparametergroupspecProviderconfigref
    publishConnectionDetailsTo? : DbparametergroupspecPublishconnectiondetailsto
    writeConnectionSecretToRef? : DbparametergroupspecWriteconnectionsecrettoref

schema DbparametergroupspecForprovider:
    """
    DBParameterGroupParameters defines the desired state of DBParameterGroup

    Attributes
    ----------
    dbParameterGroupFamily : str, optional
        The DB parameter group family name. A DB parameter group can be associated
        with one and only one DB parameter group family, and can be applied only
        to a DB instance running a database engine and engine version compatible
        with that DB parameter group family.

        To list all of the available parameter group families for a DB engine, use
        the following command:

        aws rds describe-db-engine-versions --query "DBEngineVersions[].DBParameterGroupFamily"
        --engine <engine>

        For example, to list all of the available parameter group families for the
        MySQL DB engine, use the following command:

        aws rds describe-db-engine-versions --query "DBEngineVersions[].DBParameterGroupFamily"
        --engine mysql

        The output contains duplicates.

        The following are the valid DB engine values:

           * aurora (for MySQL 5.6-compatible Aurora)

           * aurora-mysql (for MySQL 5.7-compatible Aurora)

           * aurora-postgresql

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

        One of DBParameterGroupFamily or DBParameterGroupFamilySelector is required.
    dbParameterGroupFamilySelector : DbparametergroupspecforproviderDbparametergroupfamilyselector, optional
        DBParameterGroupFamilySelector determines DBParameterGroupFamily from
        the engine and engine version.

        One of DBParameterGroupFamily or DBParameterGroupFamilySelector is required.

        Will not be used if DBParameterGroupFamily is already set.
    description : str, required
        The description for the DB parameter group.
    parameters : [DbparametergroupspecforproviderParametersitem], optional
        A list of parameters to associate with this DB parameter group.
        The fields ApplyMethod, ParameterName and ParameterValue are required
        for every parameter.
        Note: AWS actually only modifies the ApplyMethod of a parameter,
        if the ParameterValue changes too.
    region : str, required
        Region is which region the DBParameterGroup will be created.
    tags : [DbparametergroupspecforproviderTagsitem], optional
        Tags to assign to the DB parameter group.
    """
    dbParameterGroupFamily? : str
    dbParameterGroupFamilySelector? : DbparametergroupspecforproviderDbparametergroupfamilyselector
    description : str
    parameters? : [DbparametergroupspecforproviderParametersitem]
    region : str
    tags? : [DbparametergroupspecforproviderTagsitem]

schema DbparametergroupspecforproviderDbparametergroupfamilyselector:
    """
    DBParameterGroupFamilySelector determines DBParameterGroupFamily from
    the engine and engine version.

    One of DBParameterGroupFamily or DBParameterGroupFamilySelector is required.

    Will not be used if DBParameterGroupFamily is already set.

    Attributes
    ----------
    engine : str, required
        Engine is the name of the database engine.
    engineVersion : str, optional
        EngineVersion is the version of the database engine.
        If it is nil, the default engine version given by AWS will be used.
    """
    engine : str
    engineVersion? : str

schema DbparametergroupspecforproviderParametersitem:
    """
    CustomParameter are custom parameters for the Parameter

    Attributes
    ----------
    applyMethod : "immediate" | "pending-reboot", required
        The apply method of the parameter.
        AWS actually only modifies to value set here, if the parameter value changes too.
    parameterName : str, required
        The name of the parameter.
    parameterValue : str, required
        The value of the parameter.
    """
    applyMethod : "immediate" | "pending-reboot"
    parameterName : str
    parameterValue : str

schema DbparametergroupspecforproviderTagsitem:
    """
    DbparametergroupspecforproviderTagsitem schema.

    Attributes
    ----------
    key : str, optional
        No description available.
    value : str, optional
        No description available.
    """
    key? : str
    value? : str

schema DbparametergroupspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : DbparametergroupspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : DbparametergroupspecproviderconfigrefPolicy

schema DbparametergroupspecproviderconfigrefPolicy:
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

schema DbparametergroupspecPublishconnectiondetailsto:
    """
    PublishConnectionDetailsTo specifies the connection secret config which
    contains a name, metadata and a reference to secret store config to
    which any connection details for this managed resource should be written.
    Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.

    Attributes
    ----------
    configRef : DbparametergroupspecpublishconnectiondetailstoConfigref, optional
        SecretStoreConfigRef specifies which secret store config should be used
        for this ConnectionSecret.
    metadata : DbparametergroupspecpublishconnectiondetailstoMetadata, optional
        Metadata is the metadata for connection secret.
    name : str, required
        Name is the name of the connection secret.
    """
    configRef? : DbparametergroupspecpublishconnectiondetailstoConfigref
    metadata? : DbparametergroupspecpublishconnectiondetailstoMetadata
    name : str

schema DbparametergroupspecpublishconnectiondetailstoConfigref:
    """
    SecretStoreConfigRef specifies which secret store config should be used
    for this ConnectionSecret.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : DbparametergroupspecpublishconnectiondetailstoconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : DbparametergroupspecpublishconnectiondetailstoconfigrefPolicy

schema DbparametergroupspecpublishconnectiondetailstoconfigrefPolicy:
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

schema DbparametergroupspecpublishconnectiondetailstoMetadata:
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

schema DbparametergroupspecWriteconnectionsecrettoref:
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

schema DbparametergroupStatus:
    """
    DBParameterGroupStatus defines the observed state of DBParameterGroup.

    Attributes
    ----------
    atProvider : DbparametergroupstatusAtprovider, optional
        DBParameterGroupObservation defines the observed state of DBParameterGroup
    conditions : [DbparametergroupstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : DbparametergroupstatusAtprovider
    conditions? : [DbparametergroupstatusConditionsitem]
    observedGeneration? : int

schema DbparametergroupstatusAtprovider:
    """
    DBParameterGroupObservation defines the observed state of DBParameterGroup

    Attributes
    ----------
    dbParameterGroupARN : str, optional
        The Amazon Resource Name (ARN) for the DB parameter group.
    dbParameterGroupFamily : str, optional
        The name of the DB parameter group family that this DB parameter group is
        compatible with.
    dbParameterGroupName : str, optional
        The name of the DB parameter group.
    """
    dbParameterGroupARN? : str
    dbParameterGroupFamily? : str
    dbParameterGroupName? : str

schema DbparametergroupstatusConditionsitem:
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