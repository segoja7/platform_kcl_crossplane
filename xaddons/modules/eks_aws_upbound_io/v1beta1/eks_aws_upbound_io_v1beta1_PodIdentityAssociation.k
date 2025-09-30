"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.

It is based on the provided OpenAPI v2 JSON schema.

DO NOT EDIT MANUALLY.
"""

schema Podidentityassociation:
    """
    PodIdentityAssociation is the Schema for the PodIdentityAssociations API.

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
    spec : PodidentityassociationSpec, required
        PodIdentityAssociationSpec defines the desired state of PodIdentityAssociation
    status : PodidentityassociationStatus, optional
        PodIdentityAssociationStatus defines the observed state of PodIdentityAssociation.
    """
    apiVersion : str = "eks.aws.upbound.io/v1beta1"
    kind : str = "PodIdentityAssociation"
    metadata? : any
    spec : PodidentityassociationSpec
    status? : PodidentityassociationStatus

schema PodidentityassociationSpec:
    """
    PodIdentityAssociationSpec defines the desired state of PodIdentityAssociation

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
    forProvider : PodidentityassociationspecForprovider, required
        No description available.
    initProvider : PodidentityassociationspecInitprovider, optional
        THIS IS A BETA FIELD. It will be honored
        unless the Management Policies feature flag is disabled.
        InitProvider holds the same fields as ForProvider, with the exception
        of Identifier and other resource reference fields. The fields that are
        in InitProvider are merged into ForProvider when the resource is created.
        The same fields are also added to the terraform ignore_changes hook, to
        avoid updating them after creation. This is useful for fields that are
        required on creation, but we do not desire to update them after creation,
        for example because of an external controller is managing them, like an
        autoscaler.
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
    providerConfigRef : PodidentityassociationspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : PodidentityassociationspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : PodidentityassociationspecForprovider
    initProvider? : PodidentityassociationspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : PodidentityassociationspecProviderconfigref
    writeConnectionSecretToRef? : PodidentityassociationspecWriteconnectionsecrettoref

schema PodidentityassociationspecForprovider:
    """
    PodidentityassociationspecForprovider schema.

    Attributes
    ----------
    clusterName : str, optional
        The name of the cluster to create the association in.
    clusterNameRef : PodidentityassociationspecforproviderClusternameref, optional
        Reference to a Cluster in eks to populate clusterName.
    clusterNameSelector : PodidentityassociationspecforproviderClusternameselector, optional
        Selector for a Cluster in eks to populate clusterName.
    disableSessionTags : bool, optional
        Disable the tags that are automatically added to role session by Amazon EKS.
    namespace : str, optional
        The name of the Kubernetes namespace inside the cluster to create the association in. The service account and the pods that use the service account must be in this namespace.
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    roleArn : str, optional
        The Amazon Resource Name (ARN) of the IAM role to associate with the service account. The EKS Pod Identity agent manages credentials to assume this role for applications in the containers in the pods that use this service account.
    roleArnRef : PodidentityassociationspecforproviderRolearnref, optional
        Reference to a Role in iam to populate roleArn.
    roleArnSelector : PodidentityassociationspecforproviderRolearnselector, optional
        Selector for a Role in iam to populate roleArn.
    serviceAccount : str, optional
        The name of the Kubernetes service account inside the cluster to associate the IAM credentials with.
    tags : {str:str}, optional
        Key-value map of resource tags.
    targetRoleArn : str, optional
        The Amazon Resource Name (ARN) of the IAM role to be chained to the the IAM role specified as role_arn.
    targetRoleArnRef : PodidentityassociationspecforproviderTargetrolearnref, optional
        Reference to a Role in iam to populate targetRoleArn.
    targetRoleArnSelector : PodidentityassociationspecforproviderTargetrolearnselector, optional
        Selector for a Role in iam to populate targetRoleArn.
    """
    clusterName? : str
    clusterNameRef? : PodidentityassociationspecforproviderClusternameref
    clusterNameSelector? : PodidentityassociationspecforproviderClusternameselector
    disableSessionTags? : bool
    namespace? : str
    region : str
    roleArn? : str
    roleArnRef? : PodidentityassociationspecforproviderRolearnref
    roleArnSelector? : PodidentityassociationspecforproviderRolearnselector
    serviceAccount? : str
    tags? : {str:str}
    targetRoleArn? : str
    targetRoleArnRef? : PodidentityassociationspecforproviderTargetrolearnref
    targetRoleArnSelector? : PodidentityassociationspecforproviderTargetrolearnselector

schema PodidentityassociationspecforproviderClusternameref:
    """
    Reference to a Cluster in eks to populate clusterName.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : PodidentityassociationspecforproviderclusternamerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : PodidentityassociationspecforproviderclusternamerefPolicy

schema PodidentityassociationspecforproviderclusternamerefPolicy:
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

schema PodidentityassociationspecforproviderClusternameselector:
    """
    Selector for a Cluster in eks to populate clusterName.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : PodidentityassociationspecforproviderclusternameselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : PodidentityassociationspecforproviderclusternameselectorPolicy

schema PodidentityassociationspecforproviderclusternameselectorPolicy:
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

schema PodidentityassociationspecforproviderRolearnref:
    """
    Reference to a Role in iam to populate roleArn.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : PodidentityassociationspecforproviderrolearnrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : PodidentityassociationspecforproviderrolearnrefPolicy

schema PodidentityassociationspecforproviderrolearnrefPolicy:
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

schema PodidentityassociationspecforproviderRolearnselector:
    """
    Selector for a Role in iam to populate roleArn.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : PodidentityassociationspecforproviderrolearnselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : PodidentityassociationspecforproviderrolearnselectorPolicy

schema PodidentityassociationspecforproviderrolearnselectorPolicy:
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

schema PodidentityassociationspecforproviderTargetrolearnref:
    """
    Reference to a Role in iam to populate targetRoleArn.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : PodidentityassociationspecforprovidertargetrolearnrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : PodidentityassociationspecforprovidertargetrolearnrefPolicy

schema PodidentityassociationspecforprovidertargetrolearnrefPolicy:
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

schema PodidentityassociationspecforproviderTargetrolearnselector:
    """
    Selector for a Role in iam to populate targetRoleArn.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : PodidentityassociationspecforprovidertargetrolearnselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : PodidentityassociationspecforprovidertargetrolearnselectorPolicy

schema PodidentityassociationspecforprovidertargetrolearnselectorPolicy:
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

schema PodidentityassociationspecInitprovider:
    """
    THIS IS A BETA FIELD. It will be honored
    unless the Management Policies feature flag is disabled.
    InitProvider holds the same fields as ForProvider, with the exception
    of Identifier and other resource reference fields. The fields that are
    in InitProvider are merged into ForProvider when the resource is created.
    The same fields are also added to the terraform ignore_changes hook, to
    avoid updating them after creation. This is useful for fields that are
    required on creation, but we do not desire to update them after creation,
    for example because of an external controller is managing them, like an
    autoscaler.

    Attributes
    ----------
    clusterName : str, optional
        The name of the cluster to create the association in.
    clusterNameRef : PodidentityassociationspecinitproviderClusternameref, optional
        Reference to a Cluster in eks to populate clusterName.
    clusterNameSelector : PodidentityassociationspecinitproviderClusternameselector, optional
        Selector for a Cluster in eks to populate clusterName.
    disableSessionTags : bool, optional
        Disable the tags that are automatically added to role session by Amazon EKS.
    namespace : str, optional
        The name of the Kubernetes namespace inside the cluster to create the association in. The service account and the pods that use the service account must be in this namespace.
    roleArn : str, optional
        The Amazon Resource Name (ARN) of the IAM role to associate with the service account. The EKS Pod Identity agent manages credentials to assume this role for applications in the containers in the pods that use this service account.
    roleArnRef : PodidentityassociationspecinitproviderRolearnref, optional
        Reference to a Role in iam to populate roleArn.
    roleArnSelector : PodidentityassociationspecinitproviderRolearnselector, optional
        Selector for a Role in iam to populate roleArn.
    serviceAccount : str, optional
        The name of the Kubernetes service account inside the cluster to associate the IAM credentials with.
    tags : {str:str}, optional
        Key-value map of resource tags.
    targetRoleArn : str, optional
        The Amazon Resource Name (ARN) of the IAM role to be chained to the the IAM role specified as role_arn.
    targetRoleArnRef : PodidentityassociationspecinitproviderTargetrolearnref, optional
        Reference to a Role in iam to populate targetRoleArn.
    targetRoleArnSelector : PodidentityassociationspecinitproviderTargetrolearnselector, optional
        Selector for a Role in iam to populate targetRoleArn.
    """
    clusterName? : str
    clusterNameRef? : PodidentityassociationspecinitproviderClusternameref
    clusterNameSelector? : PodidentityassociationspecinitproviderClusternameselector
    disableSessionTags? : bool
    namespace? : str
    roleArn? : str
    roleArnRef? : PodidentityassociationspecinitproviderRolearnref
    roleArnSelector? : PodidentityassociationspecinitproviderRolearnselector
    serviceAccount? : str
    tags? : {str:str}
    targetRoleArn? : str
    targetRoleArnRef? : PodidentityassociationspecinitproviderTargetrolearnref
    targetRoleArnSelector? : PodidentityassociationspecinitproviderTargetrolearnselector

schema PodidentityassociationspecinitproviderClusternameref:
    """
    Reference to a Cluster in eks to populate clusterName.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : PodidentityassociationspecinitproviderclusternamerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : PodidentityassociationspecinitproviderclusternamerefPolicy

schema PodidentityassociationspecinitproviderclusternamerefPolicy:
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

schema PodidentityassociationspecinitproviderClusternameselector:
    """
    Selector for a Cluster in eks to populate clusterName.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : PodidentityassociationspecinitproviderclusternameselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : PodidentityassociationspecinitproviderclusternameselectorPolicy

schema PodidentityassociationspecinitproviderclusternameselectorPolicy:
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

schema PodidentityassociationspecinitproviderRolearnref:
    """
    Reference to a Role in iam to populate roleArn.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : PodidentityassociationspecinitproviderrolearnrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : PodidentityassociationspecinitproviderrolearnrefPolicy

schema PodidentityassociationspecinitproviderrolearnrefPolicy:
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

schema PodidentityassociationspecinitproviderRolearnselector:
    """
    Selector for a Role in iam to populate roleArn.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : PodidentityassociationspecinitproviderrolearnselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : PodidentityassociationspecinitproviderrolearnselectorPolicy

schema PodidentityassociationspecinitproviderrolearnselectorPolicy:
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

schema PodidentityassociationspecinitproviderTargetrolearnref:
    """
    Reference to a Role in iam to populate targetRoleArn.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : PodidentityassociationspecinitprovidertargetrolearnrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : PodidentityassociationspecinitprovidertargetrolearnrefPolicy

schema PodidentityassociationspecinitprovidertargetrolearnrefPolicy:
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

schema PodidentityassociationspecinitproviderTargetrolearnselector:
    """
    Selector for a Role in iam to populate targetRoleArn.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : PodidentityassociationspecinitprovidertargetrolearnselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : PodidentityassociationspecinitprovidertargetrolearnselectorPolicy

schema PodidentityassociationspecinitprovidertargetrolearnselectorPolicy:
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

schema PodidentityassociationspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : PodidentityassociationspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : PodidentityassociationspecproviderconfigrefPolicy

schema PodidentityassociationspecproviderconfigrefPolicy:
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

schema PodidentityassociationspecWriteconnectionsecrettoref:
    """
    WriteConnectionSecretToReference specifies the namespace and name of a
    Secret to which any connection details for this managed resource should
    be written. Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.

    Attributes
    ----------
    name : str, required
        Name of the secret.
    namespace : str, required
        Namespace of the secret.
    """
    name : str
    namespace : str

schema PodidentityassociationStatus:
    """
    PodIdentityAssociationStatus defines the observed state of PodIdentityAssociation.

    Attributes
    ----------
    atProvider : PodidentityassociationstatusAtprovider, optional
        No description available.
    conditions : [PodidentityassociationstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : PodidentityassociationstatusAtprovider
    conditions? : [PodidentityassociationstatusConditionsitem]
    observedGeneration? : int

schema PodidentityassociationstatusAtprovider:
    """
    PodidentityassociationstatusAtprovider schema.

    Attributes
    ----------
    associationArn : str, optional
        The Amazon Resource Name (ARN) of the association.
    associationId : str, optional
        The ID of the association.
    clusterName : str, optional
        The name of the cluster to create the association in.
    disableSessionTags : bool, optional
        Disable the tags that are automatically added to role session by Amazon EKS.
    externalId : str, optional
        The unique identifier for this association for a target IAM role. You put this value in the trust policy of the target role, in a Condition to match the sts.ExternalId.
    id : str, optional
        No description available.
    namespace : str, optional
        The name of the Kubernetes namespace inside the cluster to create the association in. The service account and the pods that use the service account must be in this namespace.
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    roleArn : str, optional
        The Amazon Resource Name (ARN) of the IAM role to associate with the service account. The EKS Pod Identity agent manages credentials to assume this role for applications in the containers in the pods that use this service account.
    serviceAccount : str, optional
        The name of the Kubernetes service account inside the cluster to associate the IAM credentials with.
    tags : {str:str}, optional
        Key-value map of resource tags.
    tagsAll : {str:str}, optional
        A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    targetRoleArn : str, optional
        The Amazon Resource Name (ARN) of the IAM role to be chained to the the IAM role specified as role_arn.
    """
    associationArn? : str
    associationId? : str
    clusterName? : str
    disableSessionTags? : bool
    externalId? : str
    id? : str
    namespace? : str
    region? : str
    roleArn? : str
    serviceAccount? : str
    tags? : {str:str}
    tagsAll? : {str:str}
    targetRoleArn? : str

schema PodidentityassociationstatusConditionsitem:
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