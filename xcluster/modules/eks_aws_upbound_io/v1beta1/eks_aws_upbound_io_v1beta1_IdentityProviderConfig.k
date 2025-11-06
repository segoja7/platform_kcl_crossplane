"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.

It is based on the provided OpenAPI v2 JSON schema.

DO NOT EDIT MANUALLY.
"""

schema Identityproviderconfig:
    """
    IdentityProviderConfig is the Schema for the IdentityProviderConfigs API. Manages an EKS Identity Provider Configuration.

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
    spec : IdentityproviderconfigSpec, required
        IdentityProviderConfigSpec defines the desired state of IdentityProviderConfig
    status : IdentityproviderconfigStatus, optional
        IdentityProviderConfigStatus defines the observed state of IdentityProviderConfig.
    """
    apiVersion : str = "eks.aws.upbound.io/v1beta1"
    kind : str = "IdentityProviderConfig"
    metadata? : any
    spec : IdentityproviderconfigSpec
    status? : IdentityproviderconfigStatus

schema IdentityproviderconfigSpec:
    """
    IdentityProviderConfigSpec defines the desired state of IdentityProviderConfig

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
    forProvider : IdentityproviderconfigspecForprovider, required
        No description available.
    initProvider : IdentityproviderconfigspecInitprovider, optional
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
    providerConfigRef : IdentityproviderconfigspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : IdentityproviderconfigspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : IdentityproviderconfigspecForprovider
    initProvider? : IdentityproviderconfigspecInitprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : IdentityproviderconfigspecProviderconfigref
    writeConnectionSecretToRef? : IdentityproviderconfigspecWriteconnectionsecrettoref

schema IdentityproviderconfigspecForprovider:
    """
    IdentityproviderconfigspecForprovider schema.

    Attributes
    ----------
    clusterName : str, optional
        Name of the EKS Cluster.
    clusterNameRef : IdentityproviderconfigspecforproviderClusternameref, optional
        Reference to a Cluster in eks to populate clusterName.
    clusterNameSelector : IdentityproviderconfigspecforproviderClusternameselector, optional
        Selector for a Cluster in eks to populate clusterName.
    oidc : [IdentityproviderconfigspecforproviderOidcitem], optional
        Nested attribute containing OpenID Connect identity provider information for the cluster. Detailed below.
    region : str, required
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    tags : {str:str}, optional
        Key-value map of resource tags.
    """
    clusterName? : str
    clusterNameRef? : IdentityproviderconfigspecforproviderClusternameref
    clusterNameSelector? : IdentityproviderconfigspecforproviderClusternameselector
    oidc? : [IdentityproviderconfigspecforproviderOidcitem]
    region : str
    tags? : {str:str}

schema IdentityproviderconfigspecforproviderClusternameref:
    """
    Reference to a Cluster in eks to populate clusterName.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : IdentityproviderconfigspecforproviderclusternamerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : IdentityproviderconfigspecforproviderclusternamerefPolicy

schema IdentityproviderconfigspecforproviderclusternamerefPolicy:
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

schema IdentityproviderconfigspecforproviderClusternameselector:
    """
    Selector for a Cluster in eks to populate clusterName.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : IdentityproviderconfigspecforproviderclusternameselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : IdentityproviderconfigspecforproviderclusternameselectorPolicy

schema IdentityproviderconfigspecforproviderclusternameselectorPolicy:
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

schema IdentityproviderconfigspecforproviderOidcitem:
    """
    IdentityproviderconfigspecforproviderOidcitem schema.

    Attributes
    ----------
    clientId : str, optional
        Client ID for the OpenID Connect identity provider.
    groupsClaim : str, optional
        The JWT claim that the provider will use to return groups.
    groupsPrefix : str, optional
        A prefix that is prepended to group claims e.g., oidc:.
    issuerUrl : str, optional
        Issuer URL for the OpenID Connect identity provider.
    requiredClaims : {str:str}, optional
        The key value pairs that describe required claims in the identity token.
    usernameClaim : str, optional
        The JWT claim that the provider will use as the username.
    usernamePrefix : str, optional
        A prefix that is prepended to username claims.
    """
    clientId? : str
    groupsClaim? : str
    groupsPrefix? : str
    issuerUrl? : str
    requiredClaims? : {str:str}
    usernameClaim? : str
    usernamePrefix? : str

schema IdentityproviderconfigspecInitprovider:
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
        Name of the EKS Cluster.
    clusterNameRef : IdentityproviderconfigspecinitproviderClusternameref, optional
        Reference to a Cluster in eks to populate clusterName.
    clusterNameSelector : IdentityproviderconfigspecinitproviderClusternameselector, optional
        Selector for a Cluster in eks to populate clusterName.
    oidc : [IdentityproviderconfigspecinitproviderOidcitem], optional
        Nested attribute containing OpenID Connect identity provider information for the cluster. Detailed below.
    tags : {str:str}, optional
        Key-value map of resource tags.
    """
    clusterName? : str
    clusterNameRef? : IdentityproviderconfigspecinitproviderClusternameref
    clusterNameSelector? : IdentityproviderconfigspecinitproviderClusternameselector
    oidc? : [IdentityproviderconfigspecinitproviderOidcitem]
    tags? : {str:str}

schema IdentityproviderconfigspecinitproviderClusternameref:
    """
    Reference to a Cluster in eks to populate clusterName.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : IdentityproviderconfigspecinitproviderclusternamerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : IdentityproviderconfigspecinitproviderclusternamerefPolicy

schema IdentityproviderconfigspecinitproviderclusternamerefPolicy:
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

schema IdentityproviderconfigspecinitproviderClusternameselector:
    """
    Selector for a Cluster in eks to populate clusterName.

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : IdentityproviderconfigspecinitproviderclusternameselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : IdentityproviderconfigspecinitproviderclusternameselectorPolicy

schema IdentityproviderconfigspecinitproviderclusternameselectorPolicy:
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

schema IdentityproviderconfigspecinitproviderOidcitem:
    """
    IdentityproviderconfigspecinitproviderOidcitem schema.

    Attributes
    ----------
    clientId : str, optional
        Client ID for the OpenID Connect identity provider.
    groupsClaim : str, optional
        The JWT claim that the provider will use to return groups.
    groupsPrefix : str, optional
        A prefix that is prepended to group claims e.g., oidc:.
    issuerUrl : str, optional
        Issuer URL for the OpenID Connect identity provider.
    requiredClaims : {str:str}, optional
        The key value pairs that describe required claims in the identity token.
    usernameClaim : str, optional
        The JWT claim that the provider will use as the username.
    usernamePrefix : str, optional
        A prefix that is prepended to username claims.
    """
    clientId? : str
    groupsClaim? : str
    groupsPrefix? : str
    issuerUrl? : str
    requiredClaims? : {str:str}
    usernameClaim? : str
    usernamePrefix? : str

schema IdentityproviderconfigspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : IdentityproviderconfigspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : IdentityproviderconfigspecproviderconfigrefPolicy

schema IdentityproviderconfigspecproviderconfigrefPolicy:
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

schema IdentityproviderconfigspecWriteconnectionsecrettoref:
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

schema IdentityproviderconfigStatus:
    """
    IdentityProviderConfigStatus defines the observed state of IdentityProviderConfig.

    Attributes
    ----------
    atProvider : IdentityproviderconfigstatusAtprovider, optional
        No description available.
    conditions : [IdentityproviderconfigstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : IdentityproviderconfigstatusAtprovider
    conditions? : [IdentityproviderconfigstatusConditionsitem]
    observedGeneration? : int

schema IdentityproviderconfigstatusAtprovider:
    """
    IdentityproviderconfigstatusAtprovider schema.

    Attributes
    ----------
    arn : str, optional
        Amazon Resource Name (ARN) of the EKS Identity Provider Configuration.
    clusterName : str, optional
        Name of the EKS Cluster.
    id : str, optional
        EKS Cluster name and EKS Identity Provider Configuration name separated by a colon (:).
    oidc : [IdentityproviderconfigstatusatproviderOidcitem], optional
        Nested attribute containing OpenID Connect identity provider information for the cluster. Detailed below.
    region : str, optional
        Region where this resource will be managed. Defaults to the Region set in the provider configuration.
        Region is the region you'd like your resource to be created in.
    status : str, optional
        Status of the EKS Identity Provider Configuration.
    tags : {str:str}, optional
        Key-value map of resource tags.
    tagsAll : {str:str}, optional
        A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    """
    arn? : str
    clusterName? : str
    id? : str
    oidc? : [IdentityproviderconfigstatusatproviderOidcitem]
    region? : str
    status? : str
    tags? : {str:str}
    tagsAll? : {str:str}

schema IdentityproviderconfigstatusatproviderOidcitem:
    """
    IdentityproviderconfigstatusatproviderOidcitem schema.

    Attributes
    ----------
    clientId : str, optional
        Client ID for the OpenID Connect identity provider.
    groupsClaim : str, optional
        The JWT claim that the provider will use to return groups.
    groupsPrefix : str, optional
        A prefix that is prepended to group claims e.g., oidc:.
    issuerUrl : str, optional
        Issuer URL for the OpenID Connect identity provider.
    requiredClaims : {str:str}, optional
        The key value pairs that describe required claims in the identity token.
    usernameClaim : str, optional
        The JWT claim that the provider will use as the username.
    usernamePrefix : str, optional
        A prefix that is prepended to username claims.
    """
    clientId? : str
    groupsClaim? : str
    groupsPrefix? : str
    issuerUrl? : str
    requiredClaims? : {str:str}
    usernameClaim? : str
    usernamePrefix? : str

schema IdentityproviderconfigstatusConditionsitem:
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