"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.

It is based on the provided OpenAPI v2 JSON schema.

DO NOT EDIT MANUALLY.
"""

schema Dbsubnetgroup:
    """
    A DBSubnetGroup is a managed resource that represents an AWS VPC Database
    Subnet Group.

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
    spec : DbsubnetgroupSpec, required
        A DBSubnetGroupSpec defines the desired state of a DBSubnetGroup.
    status : DbsubnetgroupStatus, optional
        A DBSubnetGroupStatus represents the observed state of a DBSubnetGroup.
    """
    apiVersion : str = "database.aws.crossplane.io/v1beta1"
    kind : str = "DBSubnetGroup"
    metadata? : any
    spec : DbsubnetgroupSpec
    status? : DbsubnetgroupStatus

schema DbsubnetgroupSpec:
    """
    A DBSubnetGroupSpec defines the desired state of a DBSubnetGroup.

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
    forProvider : DbsubnetgroupspecForprovider, optional
        DBSubnetGroupParameters define the desired state of an AWS VPC Database
        Subnet Group.
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
    providerConfigRef : DbsubnetgroupspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    publishConnectionDetailsTo : DbsubnetgroupspecPublishconnectiondetailsto, optional
        PublishConnectionDetailsTo specifies the connection secret config which
        contains a name, metadata and a reference to secret store config to
        which any connection details for this managed resource should be written.
        Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    writeConnectionSecretToRef : DbsubnetgroupspecWriteconnectionsecrettoref, optional
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
    forProvider? : DbsubnetgroupspecForprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : DbsubnetgroupspecProviderconfigref
    publishConnectionDetailsTo? : DbsubnetgroupspecPublishconnectiondetailsto
    writeConnectionSecretToRef? : DbsubnetgroupspecWriteconnectionsecrettoref

schema DbsubnetgroupspecForprovider:
    """
    DBSubnetGroupParameters define the desired state of an AWS VPC Database
    Subnet Group.

    Attributes
    ----------
    description : str, required
        The description for the DB subnet group.
    region : str, optional
        Region is the region you'd like your DBSubnetGroup to be created in.
    subnetIdRefs : [DbsubnetgroupspecforproviderSubnetidrefsitem], optional
        SubnetIDRefs is a set of references that each retrieve the subnetID from the referenced Subnet
    subnetIdSelector : DbsubnetgroupspecforproviderSubnetidselector, optional
        SubnetIDSelector selects a set of references that each retrieve the subnetID from the referenced Subnet
    subnetIds : [str], optional
        The EC2 Subnet IDs for the DB subnet group.
    tags : [DbsubnetgroupspecforproviderTagsitem], optional
        A list of tags. For more information, see Tagging Amazon RDS Resources (http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html)
        in the Amazon RDS User Guide.
    """
    description : str
    region? : str
    subnetIdRefs? : [DbsubnetgroupspecforproviderSubnetidrefsitem]
    subnetIdSelector? : DbsubnetgroupspecforproviderSubnetidselector
    subnetIds? : [str]
    tags? : [DbsubnetgroupspecforproviderTagsitem]

schema DbsubnetgroupspecforproviderSubnetidrefsitem:
    """
    A Reference to a named object.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : DbsubnetgroupspecforprovidersubnetidrefsitemPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : DbsubnetgroupspecforprovidersubnetidrefsitemPolicy

schema DbsubnetgroupspecforprovidersubnetidrefsitemPolicy:
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

schema DbsubnetgroupspecforproviderSubnetidselector:
    """
    SubnetIDSelector selects a set of references that each retrieve the subnetID from the referenced Subnet

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : DbsubnetgroupspecforprovidersubnetidselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : DbsubnetgroupspecforprovidersubnetidselectorPolicy

schema DbsubnetgroupspecforprovidersubnetidselectorPolicy:
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

schema DbsubnetgroupspecforproviderTagsitem:
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

schema DbsubnetgroupspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : DbsubnetgroupspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : DbsubnetgroupspecproviderconfigrefPolicy

schema DbsubnetgroupspecproviderconfigrefPolicy:
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

schema DbsubnetgroupspecPublishconnectiondetailsto:
    """
    PublishConnectionDetailsTo specifies the connection secret config which
    contains a name, metadata and a reference to secret store config to
    which any connection details for this managed resource should be written.
    Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.

    Attributes
    ----------
    configRef : DbsubnetgroupspecpublishconnectiondetailstoConfigref, optional
        SecretStoreConfigRef specifies which secret store config should be used
        for this ConnectionSecret.
    metadata : DbsubnetgroupspecpublishconnectiondetailstoMetadata, optional
        Metadata is the metadata for connection secret.
    name : str, required
        Name is the name of the connection secret.
    """
    configRef? : DbsubnetgroupspecpublishconnectiondetailstoConfigref
    metadata? : DbsubnetgroupspecpublishconnectiondetailstoMetadata
    name : str

schema DbsubnetgroupspecpublishconnectiondetailstoConfigref:
    """
    SecretStoreConfigRef specifies which secret store config should be used
    for this ConnectionSecret.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : DbsubnetgroupspecpublishconnectiondetailstoconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : DbsubnetgroupspecpublishconnectiondetailstoconfigrefPolicy

schema DbsubnetgroupspecpublishconnectiondetailstoconfigrefPolicy:
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

schema DbsubnetgroupspecpublishconnectiondetailstoMetadata:
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

schema DbsubnetgroupspecWriteconnectionsecrettoref:
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

schema DbsubnetgroupStatus:
    """
    A DBSubnetGroupStatus represents the observed state of a DBSubnetGroup.

    Attributes
    ----------
    atProvider : DbsubnetgroupstatusAtprovider, optional
        DBSubnetGroupObservation is the representation of the current state that is observed
    conditions : [DbsubnetgroupstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : DbsubnetgroupstatusAtprovider
    conditions? : [DbsubnetgroupstatusConditionsitem]
    observedGeneration? : int

schema DbsubnetgroupstatusAtprovider:
    """
    DBSubnetGroupObservation is the representation of the current state that is observed

    Attributes
    ----------
    arn : str, optional
        ARN is the Amazon Resource Name (ARN) for this DB subnet group.
    state : str, optional
        State specifies the current state of this DB subnet group.
    subnets : [DbsubnetgroupstatusatproviderSubnetsitem], optional
        Subnets contains a list of Subnet elements.
    vpcId : str, optional
        VPCID provides the VPCID of the DB subnet group.
    """
    arn? : str
    state? : str
    subnets? : [DbsubnetgroupstatusatproviderSubnetsitem]
    vpcId? : str

schema DbsubnetgroupstatusatproviderSubnetsitem:
    """
    Subnet represents a aws subnet

    Attributes
    ----------
    subnetID : str, required
        Specifies the identifier of the subnet.
    subnetStatus : str, required
        Specifies the status of the subnet.
    """
    subnetID : str
    subnetStatus : str

schema DbsubnetgroupstatusConditionsitem:
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