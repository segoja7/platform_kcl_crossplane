"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.

It is based on the provided OpenAPI v2 JSON schema.

DO NOT EDIT MANUALLY.
"""

schema Cluster:
    """
    A Cluster is a managed resource that represents an ArgoCD Git Cluster

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
    spec : ClusterSpec, required
        A ClusterSpec defines the desired state of an ArgoCD Cluster.
    status : ClusterStatus, optional
        A ClusterStatus represents the observed state of an ArgoCD Cluster.
    """
    apiVersion : str = "cluster.argocd.crossplane.io/v1alpha1"
    kind : str = "Cluster"
    metadata? : any
    spec : ClusterSpec
    status? : ClusterStatus

schema ClusterSpec:
    """
    A ClusterSpec defines the desired state of an ArgoCD Cluster.

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
    forProvider : ClusterspecForprovider, required
        ClusterParameters define the desired state of an ArgoCD Cluster
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
    providerConfigRef : ClusterspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    writeConnectionSecretToRef : ClusterspecWriteconnectionsecrettoref, optional
        WriteConnectionSecretToReference specifies the namespace and name of a
        Secret to which any connection details for this managed resource should
        be written. Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    """
    deletionPolicy? : "Orphan" | "Delete"
    forProvider : ClusterspecForprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : ClusterspecProviderconfigref
    writeConnectionSecretToRef? : ClusterspecWriteconnectionsecrettoref

schema ClusterspecForprovider:
    """
    ClusterParameters define the desired state of an ArgoCD Cluster

    Attributes
    ----------
    annotations : {str:str}, optional
        Annotations for cluster secret metadata
    config : ClusterspecforproviderConfig, required
        Config holds cluster information for connecting to a cluster
    labels : {str:str}, optional
        Labels for cluster secret metadata
    name : str, optional
        Name of the cluster. If omitted, will use the server address. Optional if using a kubeconfig
    namespaces : [str], optional
        Holds list of namespaces which are accessible in that cluster. Cluster level resources will be ignored if namespace list is not empty.
    project : str, optional
        Reference between project and cluster that allow you automatically to be added as item inside Destinations project entity
    server : str, optional
        Server is the API server URL of the Kubernetes cluster. Optional if using a kubeconfig
    shard : int, optional
        Shard contains optional shard number. Calculated on the fly by the application controller if not specified.
    """
    annotations? : {str:str}
    config : ClusterspecforproviderConfig
    labels? : {str:str}
    name? : str
    namespaces? : [str]
    project? : str
    server? : str
    shard? : int

schema ClusterspecforproviderConfig:
    """
    Config holds cluster information for connecting to a cluster

    Attributes
    ----------
    awsAuthConfig : ClusterspecforproviderconfigAwsauthconfig, optional
        AWSAuthConfig contains IAM authentication configuration
    bearerTokenSecretRef : ClusterspecforproviderconfigBearertokensecretref, optional
        BearerTokenSecretRef contains a reference to a kubernetes secret containing the BearerToken
    execProviderConfig : ClusterspecforproviderconfigExecproviderconfig, optional
        ExecProviderConfig contains configuration for an exec provider
    kubeconfigSecretRef : ClusterspecforproviderconfigKubeconfigsecretref, optional
        KubeconfigSecretRef contains a reference to a Kubernetes secret entry that
        contains a raw kubeconfig in YAML or JSON.
        See https://kubernetes.io/docs/reference/config-api/kubeconfig.v1/ for more
        info about Kubeconfigs
    passwordSecretRef : ClusterspecforproviderconfigPasswordsecretref, optional
        PasswordSecretRef contains a reference to a kubernetes secret containing the Password
    tlsClientConfig : ClusterspecforproviderconfigTlsclientconfig, optional
        TLSClientConfig contains settings to enable transport layer security
    username : str, optional
        Server requires Basic authentication
    """
    awsAuthConfig? : ClusterspecforproviderconfigAwsauthconfig
    bearerTokenSecretRef? : ClusterspecforproviderconfigBearertokensecretref
    execProviderConfig? : ClusterspecforproviderconfigExecproviderconfig
    kubeconfigSecretRef? : ClusterspecforproviderconfigKubeconfigsecretref
    passwordSecretRef? : ClusterspecforproviderconfigPasswordsecretref
    tlsClientConfig? : ClusterspecforproviderconfigTlsclientconfig
    username? : str

schema ClusterspecforproviderconfigAwsauthconfig:
    """
    AWSAuthConfig contains IAM authentication configuration

    Attributes
    ----------
    clusterName : str, optional
        ClusterName contains AWS cluster name
    roleARN : str, optional
        RoleARN contains optional role ARN. If set then AWS IAM Authenticator assume a role to perform cluster operations instead of the default AWS credential provider chain.
    """
    clusterName? : str
    roleARN? : str

schema ClusterspecforproviderconfigBearertokensecretref:
    """
    BearerTokenSecretRef contains a reference to a kubernetes secret containing the BearerToken

    Attributes
    ----------
    key : str, required
        Key whose value will be used.
    name : str, required
        Name of the secret.
    namespace : str, required
        Namespace of the secret.
    """
    key : str
    name : str
    namespace : str

schema ClusterspecforproviderconfigExecproviderconfig:
    """
    ExecProviderConfig contains configuration for an exec provider

    Attributes
    ----------
    apiVersion : str, optional
        Preferred input version of the ExecInfo
    args : [str], optional
        Arguments to pass to the command when executing it
    command : str, optional
        Command to execute
    env : {str:str}, optional
        Env defines additional environment variables to expose to the process
    installHint : str, optional
        This text is shown to the user when the executable doesn't seem to be present
    """
    apiVersion? : str
    args? : [str]
    command? : str
    env? : {str:str}
    installHint? : str

schema ClusterspecforproviderconfigKubeconfigsecretref:
    """
    KubeconfigSecretRef contains a reference to a Kubernetes secret entry that
    contains a raw kubeconfig in YAML or JSON.
    See https://kubernetes.io/docs/reference/config-api/kubeconfig.v1/ for more
    info about Kubeconfigs

    Attributes
    ----------
    key : str, required
        Key whose value will be used.
    name : str, required
        Name of the secret.
    namespace : str, required
        Namespace of the secret.
    """
    key : str
    name : str
    namespace : str

schema ClusterspecforproviderconfigPasswordsecretref:
    """
    PasswordSecretRef contains a reference to a kubernetes secret containing the Password

    Attributes
    ----------
    key : str, required
        Key whose value will be used.
    name : str, required
        Name of the secret.
    namespace : str, required
        Namespace of the secret.
    """
    key : str
    name : str
    namespace : str

schema ClusterspecforproviderconfigTlsclientconfig:
    """
    TLSClientConfig contains settings to enable transport layer security

    Attributes
    ----------
    caData : str, optional
        CAData holds PEM-encoded bytes (typically read from a root certificates bundle).
        CAData takes precedence over CAFile
    caDataSecretRef : ClusterspecforproviderconfigtlsclientconfigCadatasecretref, optional
        CADataSecretRef references a secret holding PEM-encoded bytes (typically read from a root certificates bundle).
    certDataSecretRef : ClusterspecforproviderconfigtlsclientconfigCertdatasecretref, optional
        CertDataSecretRef references a secret holding PEM-encoded bytes (typically read from a client certificate file).
    insecure : bool, required
        Insecure specifies that the server should be accessed without verifying the TLS certificate. For testing only.
    keyDataSecretRef : ClusterspecforproviderconfigtlsclientconfigKeydatasecretref, optional
        KeyDataSecretRef references a secret holding PEM-encoded bytes (typically read from a client certificate key file).
    serverName : str, optional
        ServerName is passed to the server for SNI and is used in the client to check server
        certificates against. If ServerName is empty, the hostname used to contact the
        server is used.
    """
    caData? : str
    caDataSecretRef? : ClusterspecforproviderconfigtlsclientconfigCadatasecretref
    certDataSecretRef? : ClusterspecforproviderconfigtlsclientconfigCertdatasecretref
    insecure : bool
    keyDataSecretRef? : ClusterspecforproviderconfigtlsclientconfigKeydatasecretref
    serverName? : str

schema ClusterspecforproviderconfigtlsclientconfigCadatasecretref:
    """
    CADataSecretRef references a secret holding PEM-encoded bytes (typically read from a root certificates bundle).

    Attributes
    ----------
    key : str, required
        Key whose value will be used.
    name : str, required
        Name of the secret.
    namespace : str, required
        Namespace of the secret.
    """
    key : str
    name : str
    namespace : str

schema ClusterspecforproviderconfigtlsclientconfigCertdatasecretref:
    """
    CertDataSecretRef references a secret holding PEM-encoded bytes (typically read from a client certificate file).

    Attributes
    ----------
    key : str, required
        Key whose value will be used.
    name : str, required
        Name of the secret.
    namespace : str, required
        Namespace of the secret.
    """
    key : str
    name : str
    namespace : str

schema ClusterspecforproviderconfigtlsclientconfigKeydatasecretref:
    """
    KeyDataSecretRef references a secret holding PEM-encoded bytes (typically read from a client certificate key file).

    Attributes
    ----------
    key : str, required
        Key whose value will be used.
    name : str, required
        Name of the secret.
    namespace : str, required
        Namespace of the secret.
    """
    key : str
    name : str
    namespace : str

schema ClusterspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : ClusterspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : ClusterspecproviderconfigrefPolicy

schema ClusterspecproviderconfigrefPolicy:
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

schema ClusterspecWriteconnectionsecrettoref:
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

schema ClusterStatus:
    """
    A ClusterStatus represents the observed state of an ArgoCD Cluster.

    Attributes
    ----------
    atProvider : ClusterstatusAtprovider, optional
        ClusterObservation represents an argocd Cluster.
    conditions : [ClusterstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : ClusterstatusAtprovider
    conditions? : [ClusterstatusConditionsitem]
    observedGeneration? : int

schema ClusterstatusAtprovider:
    """
    ClusterObservation represents an argocd Cluster.

    Attributes
    ----------
    connectionState : ClusterstatusatproviderConnectionstate, optional
        ClusterInfo holds information about cluster cache and state
    kubeconfig : ClusterstatusatproviderKubeconfig, optional
        Kubeconfig tracks changes to a Kubeconfig secret
    """
    connectionState? : ClusterstatusatproviderConnectionstate
    kubeconfig? : ClusterstatusatproviderKubeconfig

schema ClusterstatusatproviderConnectionstate:
    """
    ClusterInfo holds information about cluster cache and state

    Attributes
    ----------
    applicationsCount : int, required
        ApplicationsCount is the number of applications managed by Argo CD on the cluster
    cacheInfo : ClusterstatusatproviderconnectionstateCacheinfo, optional
        CacheInfo contains information about the cluster cache
    connectionState : ClusterstatusatproviderconnectionstateConnectionstate, optional
        ConnectionState contains information about the connection to the cluster
    serverVersion : str, optional
        ServerVersion contains information about the Kubernetes version of the cluster
    """
    applicationsCount : int
    cacheInfo? : ClusterstatusatproviderconnectionstateCacheinfo
    connectionState? : ClusterstatusatproviderconnectionstateConnectionstate
    serverVersion? : str

schema ClusterstatusatproviderconnectionstateCacheinfo:
    """
    CacheInfo contains information about the cluster cache

    Attributes
    ----------
    apisCount : int, optional
        APIsCount holds number of observed Kubernetes API count
    lastCacheSyncTime : str, optional
        LastCacheSyncTime holds time of most recent cache synchronization
    resourcesCount : int, optional
        ResourcesCount holds number of observed Kubernetes resources
    """
    apisCount? : int
    lastCacheSyncTime? : str
    resourcesCount? : int

schema ClusterstatusatproviderconnectionstateConnectionstate:
    """
    ConnectionState contains information about the connection to the cluster

    Attributes
    ----------
    attemptedAt : str, required
        ModifiedAt contains the timestamp when this connection status has been determined
    message : str, required
        Message contains human readable information about the connection status
    status : str, required
        Status contains the current status indicator for the connection
    """
    attemptedAt : str
    message : str
    status : str

schema ClusterstatusatproviderKubeconfig:
    """
    Kubeconfig tracks changes to a Kubeconfig secret

    Attributes
    ----------
    secret : ClusterstatusatproviderkubeconfigSecret, optional
        SecretObservation observes a secret
    """
    secret? : ClusterstatusatproviderkubeconfigSecret

schema ClusterstatusatproviderkubeconfigSecret:
    """
    SecretObservation observes a secret

    Attributes
    ----------
    resourceVersion : str, optional
        ResourceVersion tracks the meta1.ResourceVersion of an Object
    """
    resourceVersion? : str

schema ClusterstatusConditionsitem:
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