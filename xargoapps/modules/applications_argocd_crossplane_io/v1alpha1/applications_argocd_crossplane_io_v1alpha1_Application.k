"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.

It is based on the provided OpenAPI v2 JSON schema.

DO NOT EDIT MANUALLY.
"""

schema Application:
    """
    An Application is a managed resource that represents an ArgoCD Application

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
    spec : ApplicationSpec, required
        A ApplicationSpec defines the desired state of an ArgoCD Application.
    status : ApplicationStatus, optional
        A ApplicationStatus represents the observed state of an ArgoCD Application.
    """
    apiVersion : str = "applications.argocd.crossplane.io/v1alpha1"
    kind : str = "Application"
    metadata? : any
    spec : ApplicationSpec
    status? : ApplicationStatus

schema ApplicationSpec:
    """
    A ApplicationSpec defines the desired state of an ArgoCD Application.

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
    forProvider : ApplicationspecForprovider, required
        ApplicationParameters define the desired state of an ArgoCD Git Application
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
    providerConfigRef : ApplicationspecProviderconfigref, optional
        ProviderConfigReference specifies how the provider that will be used to
        create, observe, update, and delete this managed resource should be
        configured.
    publishConnectionDetailsTo : ApplicationspecPublishconnectiondetailsto, optional
        PublishConnectionDetailsTo specifies the connection secret config which
        contains a name, metadata and a reference to secret store config to
        which any connection details for this managed resource should be written.
        Connection details frequently include the endpoint, username,
        and password required to connect to the managed resource.
    writeConnectionSecretToRef : ApplicationspecWriteconnectionsecrettoref, optional
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
    forProvider : ApplicationspecForprovider
    managementPolicies? : ["Observe" | "Create" | "Update" | "Delete" | "LateInitialize" | "*"]
    providerConfigRef? : ApplicationspecProviderconfigref
    publishConnectionDetailsTo? : ApplicationspecPublishconnectiondetailsto
    writeConnectionSecretToRef? : ApplicationspecWriteconnectionsecrettoref

schema ApplicationspecForprovider:
    """
    ApplicationParameters define the desired state of an ArgoCD Git Application

    Attributes
    ----------
    annotations : {str:str}, optional
        Annotations that will be applied to the ArgoCD Application
    appNamespace : str, optional
        AppNamespace is the namespace of the application in the ArgoCD server
    deleteCascade : bool, optional
        DeleteCascade indicates whether the delete should be cascaded to the app's underlying resources
    deletePropagationPolicy : str, optional
        DeletePropagationPolicy defines the policy for propagating deletions to the app's resources
    destination : ApplicationspecforproviderDestination, required
        Destination is a reference to the target Kubernetes server and namespace
    finalizers : [str], optional
        Finalizers added to the ArgoCD Application
    ignoreDifferences : [ApplicationspecforproviderIgnoredifferencesitem], optional
        IgnoreDifferences is a list of resources and their fields which should be ignored during comparison
    info : [ApplicationspecforproviderInfoitem], optional
        Info contains a list of information (URLs, email addresses, and plain text) that relates to the application
    project : str, required
        Project is a reference to the project this application belongs to.
        The empty string means that application belongs to the 'default' project.
    revisionHistoryLimit : int, optional
        RevisionHistoryLimit limits the number of items kept in the application's revision history, which is used for informational purposes as well as for rollbacks to previous versions.
        This should only be changed in exceptional circumstances.
        Setting to zero will store no history. This will reduce storage used.
        Increasing will increase the space used to store the history, so we do not recommend increasing it.
        Default is 10.
    source : ApplicationspecforproviderSource, optional
        ApplicationSource contains all required information about the source of an application
    sourceHydrator : ApplicationspecforproviderSourcehydrator, optional
        SourceHydrator provides a way to push hydrated manifests back to git before syncing them to the cluster.
    sources : [ApplicationspecforproviderSourcesitem], optional
        Sources is a reference to the location of the application's manifests or chart
    syncPolicy : ApplicationspecforproviderSyncpolicy, optional
        SyncPolicy controls when and how a sync will be performed
    """
    annotations? : {str:str}
    appNamespace? : str
    deleteCascade? : bool
    deletePropagationPolicy? : str
    destination : ApplicationspecforproviderDestination
    finalizers? : [str]
    ignoreDifferences? : [ApplicationspecforproviderIgnoredifferencesitem]
    info? : [ApplicationspecforproviderInfoitem]
    project : str
    revisionHistoryLimit? : int
    source? : ApplicationspecforproviderSource
    sourceHydrator? : ApplicationspecforproviderSourcehydrator
    sources? : [ApplicationspecforproviderSourcesitem]
    syncPolicy? : ApplicationspecforproviderSyncpolicy

schema ApplicationspecforproviderDestination:
    """
    Destination is a reference to the target Kubernetes server and namespace

    Attributes
    ----------
    name : str, optional
        Name is an alternate way of specifying the target cluster by its symbolic name
    nameRef : ApplicationspecforproviderdestinationNameref, optional
        NameRef is a reference to a Cluster used to set Name
    nameSelector : ApplicationspecforproviderdestinationNameselector, optional
        NameSelector is a reference to a Cluster used to set Name
    namespace : str, optional
        Namespace specifies the target namespace for the application's resources.
        The namespace will only be set for namespace-scoped resources that have not set a value for .metadata.namespace
    server : str, optional
        Server specifies the URL of the target cluster and must be set to the Kubernetes control plane API
    serverRef : ApplicationspecforproviderdestinationServerref, optional
        ServerRef is a reference to Cluster used to set Server
    serverSelector : ApplicationspecforproviderdestinationServerselector, optional
        ServerSelector selects references to Cluster used to set Server
    """
    name? : str
    nameRef? : ApplicationspecforproviderdestinationNameref
    nameSelector? : ApplicationspecforproviderdestinationNameselector
    namespace? : str
    server? : str
    serverRef? : ApplicationspecforproviderdestinationServerref
    serverSelector? : ApplicationspecforproviderdestinationServerselector

schema ApplicationspecforproviderdestinationNameref:
    """
    NameRef is a reference to a Cluster used to set Name

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : ApplicationspecforproviderdestinationnamerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : ApplicationspecforproviderdestinationnamerefPolicy

schema ApplicationspecforproviderdestinationnamerefPolicy:
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

schema ApplicationspecforproviderdestinationNameselector:
    """
    NameSelector is a reference to a Cluster used to set Name

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : ApplicationspecforproviderdestinationnameselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : ApplicationspecforproviderdestinationnameselectorPolicy

schema ApplicationspecforproviderdestinationnameselectorPolicy:
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

schema ApplicationspecforproviderdestinationServerref:
    """
    ServerRef is a reference to Cluster used to set Server

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : ApplicationspecforproviderdestinationserverrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : ApplicationspecforproviderdestinationserverrefPolicy

schema ApplicationspecforproviderdestinationserverrefPolicy:
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

schema ApplicationspecforproviderdestinationServerselector:
    """
    ServerSelector selects references to Cluster used to set Server

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : ApplicationspecforproviderdestinationserverselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : ApplicationspecforproviderdestinationserverselectorPolicy

schema ApplicationspecforproviderdestinationserverselectorPolicy:
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

schema ApplicationspecforproviderIgnoredifferencesitem:
    """
    ResourceIgnoreDifferences contains resource filter and list of json paths which should be ignored during comparison with live state.

    Attributes
    ----------
    group : str, optional
        No description available.
    jqPathExpressions : [str], optional
        No description available.
    jsonPointers : [str], optional
        No description available.
    kind : str, required
        No description available.
    managedFieldsManagers : [str], optional
        ManagedFieldsManagers is a list of trusted managers. Fields mutated by those managers will take precedence over the
        desired state defined in the SCM and won't be displayed in diffs
    name : str, optional
        No description available.
    namespace : str, optional
        No description available.
    """
    group? : str
    jqPathExpressions? : [str]
    jsonPointers? : [str]
    kind : str
    managedFieldsManagers? : [str]
    name? : str
    namespace? : str

schema ApplicationspecforproviderInfoitem:
    """
    Info is a list of informational items for this operation

    Attributes
    ----------
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    name : str
    value : str

schema ApplicationspecforproviderSource:
    """
    ApplicationSource contains all required information about the source of an application

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationspecforprovidersourceDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationspecforprovidersourceHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationspecforprovidersourceKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is the name of the application source
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationspecforprovidersourcePlugin, optional
        Plugin holds config management plugin specific options
    ref : str, optional
        Ref is reference to another source within sources field. This field will not be used if used with a `source` tag.
    repoURL : str, required
        RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
    targetRevision : str, optional
        TargetRevision defines the revision of the source to sync the application to.
        In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
        In case of Helm, this is a semver tag for the Chart's version.
    """
    chart? : str
    directory? : ApplicationspecforprovidersourceDirectory
    helm? : ApplicationspecforprovidersourceHelm
    kustomize? : ApplicationspecforprovidersourceKustomize
    name? : str
    path? : str
    plugin? : ApplicationspecforprovidersourcePlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationspecforprovidersourceDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationspecforprovidersourcedirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationspecforprovidersourcedirectoryJsonnet
    recurse? : bool

schema ApplicationspecforprovidersourcedirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationspecforprovidersourcedirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationspecforprovidersourcedirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationspecforprovidersourcedirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationspecforprovidersourcedirectoryjsonnetTlasitem]

schema ApplicationspecforprovidersourcedirectoryjsonnetExtvarsitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationspecforprovidersourcedirectoryjsonnetTlasitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationspecforprovidersourceHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationspecforprovidersourcehelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationspecforprovidersourcehelmParametersitem], optional
        Parameters is a list of Helm parameters which are passed to the helm template command upon manifest generation
    passCredentials : bool, optional
        PassCredentials pass credentials to all domains (Helm's --pass-credentials)
    releaseName : str, optional
        ReleaseName is the Helm release name to use. If omitted it will use the application name
    skipCrds : bool, optional
        SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
    skipSchemaValidation : bool, optional
        SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
    skipTests : bool, optional
        SkipTests skips test manifest installation step (Helm's --skip-tests).
    valueFiles : [str], optional
        ValuesFiles is a list of Helm value files to use when generating a template
    values : str, optional
        Values specifies Helm values to be passed to helm template, typically defined as a block. ValuesObject takes precedence over Values, so use one or the other.
    valuesObject : any, optional
        ValuesObject specifies Helm values to be passed to helm template, defined as a map. This takes precedence over Values.
    version : str, optional
        Version is the Helm version to use for templating ("3")
    """
    apiVersions? : [str]
    fileParameters? : [ApplicationspecforprovidersourcehelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationspecforprovidersourcehelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationspecforprovidersourcehelmFileparametersitem:
    """
    HelmFileParameter is a file parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    name : str, optional
        Name is the name of the Helm parameter
    path : str, optional
        Path is the path to the file containing the values for the Helm parameter
    """
    name? : str
    path? : str

schema ApplicationspecforprovidersourcehelmParametersitem:
    """
    HelmParameter is a parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    forceString : bool, optional
        ForceString determines whether to tell Helm to interpret booleans and numbers as strings
    name : str, optional
        Name is the name of the Helm parameter
    value : str, optional
        Value is the value for the Helm parameter
    """
    forceString? : bool
    name? : str
    value? : str

schema ApplicationspecforprovidersourceKustomize:
    """
    Kustomize holds kustomize specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    commonAnnotations : {str:str}, optional
        CommonAnnotations is a list of additional annotations to add to rendered manifests
    commonAnnotationsEnvsubst : bool, optional
        CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for annotation values
    commonLabels : {str:str}, optional
        CommonLabels is a list of additional labels to add to rendered manifests
    components : [str], optional
        Components specifies a list of kustomize components to add to the kustomization before building
    forceCommonAnnotations : bool, optional
        ForceCommonAnnotations specifies whether to force applying common annotations to resources for Kustomize apps
    forceCommonLabels : bool, optional
        ForceCommonLabels specifies whether to force applying common labels to resources for Kustomize apps
    ignoreMissingComponents : bool, optional
        IgnoreMissingComponents prevents kustomize from failing when components do not exist locally by not appending them to kustomization file
    images : [str], optional
        Images is a list of Kustomize image override specifications
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    labelIncludeTemplates : bool, optional
        LabelIncludeTemplates specifies whether to apply common labels to resource templates or not
    labelWithoutSelector : bool, optional
        LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
    namePrefix : str, optional
        NamePrefix is a prefix appended to resources for Kustomize apps
    nameSuffix : str, optional
        NameSuffix is a suffix appended to resources for Kustomize apps
    namespace : str, optional
        Namespace sets the namespace that Kustomize adds to all resources
    patches : [ApplicationspecforprovidersourcekustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationspecforprovidersourcekustomizeReplicasitem], optional
        Replicas is a list of Kustomize Replicas override specifications
    version : str, optional
        Version controls which version of Kustomize to use for rendering manifests
    """
    apiVersions? : [str]
    commonAnnotations? : {str:str}
    commonAnnotationsEnvsubst? : bool
    commonLabels? : {str:str}
    components? : [str]
    forceCommonAnnotations? : bool
    forceCommonLabels? : bool
    ignoreMissingComponents? : bool
    images? : [str]
    kubeVersion? : str
    labelIncludeTemplates? : bool
    labelWithoutSelector? : bool
    namePrefix? : str
    nameSuffix? : str
    namespace? : str
    patches? : [ApplicationspecforprovidersourcekustomizePatchesitem]
    replicas? : [ApplicationspecforprovidersourcekustomizeReplicasitem]
    version? : str

schema ApplicationspecforprovidersourcekustomizePatchesitem:
    """
    KustomizePatch is a kustomize patch

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationspecforprovidersourcekustomizepatchesitemTarget, optional
        KustomizeSelector is a selector of a Kustomize Patch
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationspecforprovidersourcekustomizepatchesitemTarget

schema ApplicationspecforprovidersourcekustomizepatchesitemTarget:
    """
    KustomizeSelector is a selector of a Kustomize Patch

    Attributes
    ----------
    annotationSelector : str, optional
        No description available.
    group : str, optional
        No description available.
    kind : str, optional
        No description available.
    labelSelector : str, optional
        No description available.
    name : str, optional
        No description available.
    namespace : str, optional
        No description available.
    version : str, optional
        No description available.
    """
    annotationSelector? : str
    group? : str
    kind? : str
    labelSelector? : str
    name? : str
    namespace? : str
    version? : str

schema ApplicationspecforprovidersourcekustomizeReplicasitem:
    """
    KustomizeReplica override specifications

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationspecforprovidersourcePlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationspecforprovidersourcepluginEnvitem], optional
        Env holds options specific to config management plugins
    name : str, optional
        No description available.
    parameters : [ApplicationspecforprovidersourcepluginParametersitem], optional
        ApplicationSourcePluginParameters is a list of specific config management parameters
    """
    env? : [ApplicationspecforprovidersourcepluginEnvitem]
    name? : str
    parameters? : [ApplicationspecforprovidersourcepluginParametersitem]

schema ApplicationspecforprovidersourcepluginEnvitem:
    """
    EnvEntry represents an entry in the application's environment

    Attributes
    ----------
    name : str, required
        Name is the name of the variable, usually expressed in uppercase
    value : str, required
        Value is the value of the variable
    """
    name : str
    value : str

schema ApplicationspecforprovidersourcepluginParametersitem:
    """
    ApplicationSourcePluginParameter holds options specific to config management parameters

    Attributes
    ----------
    array : [str], optional
        Array is the value of an array type parameter.
    map : {str:str}, optional
        Map is the value of a map type parameter.
    name : str, optional
        Name is the name identifying a parameter.
    string : str, optional
        String_ is the value of a string type parameter.
    """
    array? : [str]
    map? : {str:str}
    name? : str
    string? : str

schema ApplicationspecforproviderSourcehydrator:
    """
    SourceHydrator provides a way to push hydrated manifests back to git before syncing them to the cluster.

    Attributes
    ----------
    drySource : ApplicationspecforprovidersourcehydratorDrysource, required
        DrySource specifies where the dry "don't repeat yourself" manifest source lives.
    hydrateTo : ApplicationspecforprovidersourcehydratorHydrateto, optional
        HydrateTo specifies an optional "staging" location to push hydrated manifests to. An external system would then
        have to move manifests to the SyncSource, e.g. by pull request.
    syncSource : ApplicationspecforprovidersourcehydratorSyncsource, required
        SyncSource specifies where to sync hydrated manifests from.
    """
    drySource : ApplicationspecforprovidersourcehydratorDrysource
    hydrateTo? : ApplicationspecforprovidersourcehydratorHydrateto
    syncSource : ApplicationspecforprovidersourcehydratorSyncsource

schema ApplicationspecforprovidersourcehydratorDrysource:
    """
    DrySource specifies where the dry "don't repeat yourself" manifest source lives.

    Attributes
    ----------
    path : str, required
        Path is a directory path within the Git repository where the manifests are located
    repoURL : str, required
        RepoURL is the URL to the git repository that contains the application manifests
    targetRevision : str, required
        TargetRevision defines the revision of the source to hydrate
    """
    path : str
    repoURL : str
    targetRevision : str

schema ApplicationspecforprovidersourcehydratorHydrateto:
    """
    HydrateTo specifies an optional "staging" location to push hydrated manifests to. An external system would then
    have to move manifests to the SyncSource, e.g. by pull request.

    Attributes
    ----------
    targetBranch : str, required
        TargetBranch is the branch to which hydrated manifests should be committed
    """
    targetBranch : str

schema ApplicationspecforprovidersourcehydratorSyncsource:
    """
    SyncSource specifies where to sync hydrated manifests from.

    Attributes
    ----------
    path : str, required
        Path is a directory path within the git repository where hydrated manifests should be committed to and synced
        from. If hydrateTo is set, this is just the path from which hydrated manifests will be synced.
    targetBranch : str, required
        TargetBranch is the branch to which hydrated manifests should be committed
    """
    path : str
    targetBranch : str

schema ApplicationspecforproviderSourcesitem:
    """
    ApplicationSource contains all required information about the source of an application

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationspecforprovidersourcesitemDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationspecforprovidersourcesitemHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationspecforprovidersourcesitemKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is the name of the application source
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationspecforprovidersourcesitemPlugin, optional
        Plugin holds config management plugin specific options
    ref : str, optional
        Ref is reference to another source within sources field. This field will not be used if used with a `source` tag.
    repoURL : str, required
        RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
    targetRevision : str, optional
        TargetRevision defines the revision of the source to sync the application to.
        In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
        In case of Helm, this is a semver tag for the Chart's version.
    """
    chart? : str
    directory? : ApplicationspecforprovidersourcesitemDirectory
    helm? : ApplicationspecforprovidersourcesitemHelm
    kustomize? : ApplicationspecforprovidersourcesitemKustomize
    name? : str
    path? : str
    plugin? : ApplicationspecforprovidersourcesitemPlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationspecforprovidersourcesitemDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationspecforprovidersourcesitemdirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationspecforprovidersourcesitemdirectoryJsonnet
    recurse? : bool

schema ApplicationspecforprovidersourcesitemdirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationspecforprovidersourcesitemdirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationspecforprovidersourcesitemdirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationspecforprovidersourcesitemdirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationspecforprovidersourcesitemdirectoryjsonnetTlasitem]

schema ApplicationspecforprovidersourcesitemdirectoryjsonnetExtvarsitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationspecforprovidersourcesitemdirectoryjsonnetTlasitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationspecforprovidersourcesitemHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationspecforprovidersourcesitemhelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationspecforprovidersourcesitemhelmParametersitem], optional
        Parameters is a list of Helm parameters which are passed to the helm template command upon manifest generation
    passCredentials : bool, optional
        PassCredentials pass credentials to all domains (Helm's --pass-credentials)
    releaseName : str, optional
        ReleaseName is the Helm release name to use. If omitted it will use the application name
    skipCrds : bool, optional
        SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
    skipSchemaValidation : bool, optional
        SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
    skipTests : bool, optional
        SkipTests skips test manifest installation step (Helm's --skip-tests).
    valueFiles : [str], optional
        ValuesFiles is a list of Helm value files to use when generating a template
    values : str, optional
        Values specifies Helm values to be passed to helm template, typically defined as a block. ValuesObject takes precedence over Values, so use one or the other.
    valuesObject : any, optional
        ValuesObject specifies Helm values to be passed to helm template, defined as a map. This takes precedence over Values.
    version : str, optional
        Version is the Helm version to use for templating ("3")
    """
    apiVersions? : [str]
    fileParameters? : [ApplicationspecforprovidersourcesitemhelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationspecforprovidersourcesitemhelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationspecforprovidersourcesitemhelmFileparametersitem:
    """
    HelmFileParameter is a file parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    name : str, optional
        Name is the name of the Helm parameter
    path : str, optional
        Path is the path to the file containing the values for the Helm parameter
    """
    name? : str
    path? : str

schema ApplicationspecforprovidersourcesitemhelmParametersitem:
    """
    HelmParameter is a parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    forceString : bool, optional
        ForceString determines whether to tell Helm to interpret booleans and numbers as strings
    name : str, optional
        Name is the name of the Helm parameter
    value : str, optional
        Value is the value for the Helm parameter
    """
    forceString? : bool
    name? : str
    value? : str

schema ApplicationspecforprovidersourcesitemKustomize:
    """
    Kustomize holds kustomize specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    commonAnnotations : {str:str}, optional
        CommonAnnotations is a list of additional annotations to add to rendered manifests
    commonAnnotationsEnvsubst : bool, optional
        CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for annotation values
    commonLabels : {str:str}, optional
        CommonLabels is a list of additional labels to add to rendered manifests
    components : [str], optional
        Components specifies a list of kustomize components to add to the kustomization before building
    forceCommonAnnotations : bool, optional
        ForceCommonAnnotations specifies whether to force applying common annotations to resources for Kustomize apps
    forceCommonLabels : bool, optional
        ForceCommonLabels specifies whether to force applying common labels to resources for Kustomize apps
    ignoreMissingComponents : bool, optional
        IgnoreMissingComponents prevents kustomize from failing when components do not exist locally by not appending them to kustomization file
    images : [str], optional
        Images is a list of Kustomize image override specifications
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    labelIncludeTemplates : bool, optional
        LabelIncludeTemplates specifies whether to apply common labels to resource templates or not
    labelWithoutSelector : bool, optional
        LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
    namePrefix : str, optional
        NamePrefix is a prefix appended to resources for Kustomize apps
    nameSuffix : str, optional
        NameSuffix is a suffix appended to resources for Kustomize apps
    namespace : str, optional
        Namespace sets the namespace that Kustomize adds to all resources
    patches : [ApplicationspecforprovidersourcesitemkustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationspecforprovidersourcesitemkustomizeReplicasitem], optional
        Replicas is a list of Kustomize Replicas override specifications
    version : str, optional
        Version controls which version of Kustomize to use for rendering manifests
    """
    apiVersions? : [str]
    commonAnnotations? : {str:str}
    commonAnnotationsEnvsubst? : bool
    commonLabels? : {str:str}
    components? : [str]
    forceCommonAnnotations? : bool
    forceCommonLabels? : bool
    ignoreMissingComponents? : bool
    images? : [str]
    kubeVersion? : str
    labelIncludeTemplates? : bool
    labelWithoutSelector? : bool
    namePrefix? : str
    nameSuffix? : str
    namespace? : str
    patches? : [ApplicationspecforprovidersourcesitemkustomizePatchesitem]
    replicas? : [ApplicationspecforprovidersourcesitemkustomizeReplicasitem]
    version? : str

schema ApplicationspecforprovidersourcesitemkustomizePatchesitem:
    """
    KustomizePatch is a kustomize patch

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationspecforprovidersourcesitemkustomizepatchesitemTarget, optional
        KustomizeSelector is a selector of a Kustomize Patch
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationspecforprovidersourcesitemkustomizepatchesitemTarget

schema ApplicationspecforprovidersourcesitemkustomizepatchesitemTarget:
    """
    KustomizeSelector is a selector of a Kustomize Patch

    Attributes
    ----------
    annotationSelector : str, optional
        No description available.
    group : str, optional
        No description available.
    kind : str, optional
        No description available.
    labelSelector : str, optional
        No description available.
    name : str, optional
        No description available.
    namespace : str, optional
        No description available.
    version : str, optional
        No description available.
    """
    annotationSelector? : str
    group? : str
    kind? : str
    labelSelector? : str
    name? : str
    namespace? : str
    version? : str

schema ApplicationspecforprovidersourcesitemkustomizeReplicasitem:
    """
    KustomizeReplica override specifications

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationspecforprovidersourcesitemPlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationspecforprovidersourcesitempluginEnvitem], optional
        Env holds options specific to config management plugins
    name : str, optional
        No description available.
    parameters : [ApplicationspecforprovidersourcesitempluginParametersitem], optional
        ApplicationSourcePluginParameters is a list of specific config management parameters
    """
    env? : [ApplicationspecforprovidersourcesitempluginEnvitem]
    name? : str
    parameters? : [ApplicationspecforprovidersourcesitempluginParametersitem]

schema ApplicationspecforprovidersourcesitempluginEnvitem:
    """
    EnvEntry represents an entry in the application's environment

    Attributes
    ----------
    name : str, required
        Name is the name of the variable, usually expressed in uppercase
    value : str, required
        Value is the value of the variable
    """
    name : str
    value : str

schema ApplicationspecforprovidersourcesitempluginParametersitem:
    """
    ApplicationSourcePluginParameter holds options specific to config management parameters

    Attributes
    ----------
    array : [str], optional
        Array is the value of an array type parameter.
    map : {str:str}, optional
        Map is the value of a map type parameter.
    name : str, optional
        Name is the name identifying a parameter.
    string : str, optional
        String_ is the value of a string type parameter.
    """
    array? : [str]
    map? : {str:str}
    name? : str
    string? : str

schema ApplicationspecforproviderSyncpolicy:
    """
    SyncPolicy controls when and how a sync will be performed

    Attributes
    ----------
    automated : ApplicationspecforprovidersyncpolicyAutomated, optional
        Automated will keep an application synced to the target revision
    managedNamespaceMetadata : ApplicationspecforprovidersyncpolicyManagednamespacemetadata, optional
        ManagedNamespaceMetadata controls metadata in the given namespace (if CreateNamespace=true)
    retry : ApplicationspecforprovidersyncpolicyRetry, optional
        Retry controls failed sync retry behavior
    syncOptions : [str], optional
        Options allow you to specify whole app sync-options
    """
    automated? : ApplicationspecforprovidersyncpolicyAutomated
    managedNamespaceMetadata? : ApplicationspecforprovidersyncpolicyManagednamespacemetadata
    retry? : ApplicationspecforprovidersyncpolicyRetry
    syncOptions? : [str]

schema ApplicationspecforprovidersyncpolicyAutomated:
    """
    Automated will keep an application synced to the target revision

    Attributes
    ----------
    allowEmpty : bool, optional
        AllowEmpty allows apps have zero live resources (default: false)
    prune : bool, optional
        Prune specifies whether to delete resources from the cluster that are not found in the sources anymore as part of automated sync (default: false)
    selfHeal : bool, optional
        SelfHeal specifes whether to revert resources back to their desired state upon modification in the cluster (default: false)
    """
    allowEmpty? : bool
    prune? : bool
    selfHeal? : bool

schema ApplicationspecforprovidersyncpolicyManagednamespacemetadata:
    """
    ManagedNamespaceMetadata controls metadata in the given namespace (if CreateNamespace=true)

    Attributes
    ----------
    annotations : {str:str}, optional
        No description available.
    labels : {str:str}, optional
        No description available.
    """
    annotations? : {str:str}
    labels? : {str:str}

schema ApplicationspecforprovidersyncpolicyRetry:
    """
    Retry controls failed sync retry behavior

    Attributes
    ----------
    backoff : ApplicationspecforprovidersyncpolicyretryBackoff, optional
        Backoff controls how to backoff on subsequent retries of failed syncs
    limit : int, optional
        Limit is the maximum number of attempts for retrying a failed sync. If set to 0, no retries will be performed.
    """
    backoff? : ApplicationspecforprovidersyncpolicyretryBackoff
    limit? : int

schema ApplicationspecforprovidersyncpolicyretryBackoff:
    """
    Backoff controls how to backoff on subsequent retries of failed syncs

    Attributes
    ----------
    duration : str, optional
        Duration is the amount to back off. Default unit is seconds, but could also be a duration (e.g. "2m", "1h")
    factor : int, optional
        Factor is a factor to multiply the base duration after each failed retry
    maxDuration : str, optional
        MaxDuration is the maximum amount of time allowed for the backoff strategy
    """
    duration? : str
    factor? : int
    maxDuration? : str

schema ApplicationspecProviderconfigref:
    """
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : ApplicationspecproviderconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : ApplicationspecproviderconfigrefPolicy

schema ApplicationspecproviderconfigrefPolicy:
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

schema ApplicationspecPublishconnectiondetailsto:
    """
    PublishConnectionDetailsTo specifies the connection secret config which
    contains a name, metadata and a reference to secret store config to
    which any connection details for this managed resource should be written.
    Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.

    Attributes
    ----------
    configRef : ApplicationspecpublishconnectiondetailstoConfigref, optional
        SecretStoreConfigRef specifies which secret store config should be used
        for this ConnectionSecret.
    metadata : ApplicationspecpublishconnectiondetailstoMetadata, optional
        Metadata is the metadata for connection secret.
    name : str, required
        Name is the name of the connection secret.
    """
    configRef? : ApplicationspecpublishconnectiondetailstoConfigref
    metadata? : ApplicationspecpublishconnectiondetailstoMetadata
    name : str

schema ApplicationspecpublishconnectiondetailstoConfigref:
    """
    SecretStoreConfigRef specifies which secret store config should be used
    for this ConnectionSecret.

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : ApplicationspecpublishconnectiondetailstoconfigrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : ApplicationspecpublishconnectiondetailstoconfigrefPolicy

schema ApplicationspecpublishconnectiondetailstoconfigrefPolicy:
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

schema ApplicationspecpublishconnectiondetailstoMetadata:
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

schema ApplicationspecWriteconnectionsecrettoref:
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

schema ApplicationStatus:
    """
    A ApplicationStatus represents the observed state of an ArgoCD Application.

    Attributes
    ----------
    atProvider : ApplicationstatusAtprovider, optional
        ArgoApplicationStatus contains status information for the application
    conditions : [ApplicationstatusConditionsitem], optional
        Conditions of the resource.
    observedGeneration : int, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """
    atProvider? : ApplicationstatusAtprovider
    conditions? : [ApplicationstatusConditionsitem]
    observedGeneration? : int

schema ApplicationstatusAtprovider:
    """
    ArgoApplicationStatus contains status information for the application

    Attributes
    ----------
    conditions : [ApplicationstatusatproviderConditionsitem], optional
        Conditions is a list of currently observed application conditions
    health : ApplicationstatusatproviderHealth, optional
        Health contains information about the application's current health status
    history : [ApplicationstatusatproviderHistoryitem], optional
        History contains information about the application's sync history
    observedAt : str, optional
        ObservedAt indicates when the application state was updated without querying latest git state
        Deprecated: controller no longer updates ObservedAt field
    operationState : ApplicationstatusatproviderOperationstate, optional
        OperationState contains information about any ongoing operations, such as a sync
    reconciledAt : str, optional
        ReconciledAt indicates when the application state was reconciled using the latest git version
    resourceHealthSource : str, optional
        ResourceHealthSource indicates where the resource health status is stored: inline if not set or appTree
    resources : [ApplicationstatusatproviderResourcesitem], optional
        Resources is a list of Kubernetes resources managed by this application
    sourceType : str, optional
        SourceType specifies the type of this application
    sourceTypes : [str], optional
        SourceTypes specifies the type of the sources included in the application
    summary : ApplicationstatusatproviderSummary, optional
        Summary contains a list of URLs and container images used by this application
    sync : ApplicationstatusatproviderSync, optional
        Sync contains information about the application's current sync status
    """
    conditions? : [ApplicationstatusatproviderConditionsitem]
    health? : ApplicationstatusatproviderHealth
    history? : [ApplicationstatusatproviderHistoryitem]
    observedAt? : str
    operationState? : ApplicationstatusatproviderOperationstate
    reconciledAt? : str
    resourceHealthSource? : str
    resources? : [ApplicationstatusatproviderResourcesitem]
    sourceType? : str
    sourceTypes? : [str]
    summary? : ApplicationstatusatproviderSummary
    sync? : ApplicationstatusatproviderSync

schema ApplicationstatusatproviderConditionsitem:
    """
    ApplicationCondition contains details about an application condition, which is usually an error or warning

    Attributes
    ----------
    lastTransitionTime : str, optional
        LastTransitionTime is the time the condition was last observed
    message : str, required
        Message contains human-readable message indicating details about condition
    type : str, required
        Type is an application condition type
    """
    lastTransitionTime? : str
    message : str
    type : str

schema ApplicationstatusatproviderHealth:
    """
    Health contains information about the application's current health status

    Attributes
    ----------
    lastTransitionTime : str, optional
        LastTransitionTime is the time the HealthStatus was set or updated
    message : str, optional
        Message is a human-readable informational message describing the health status
    status : str, optional
        Status holds the status code of the application or resource
    """
    lastTransitionTime? : str
    message? : str
    status? : str

schema ApplicationstatusatproviderHistoryitem:
    """
    RevisionHistory contains history information about a previous sync

    Attributes
    ----------
    deployStartedAt : str, optional
        DeployStartedAt holds the time the sync operation started
    deployedAt : str, optional
        DeployedAt holds the time the sync operation completed
    id : int, required
        ID is an auto incrementing identifier of the RevisionHistory
    revision : str, optional
        Revision holds the revision the sync was performed against
    revisions : [str], optional
        Revisions holds the revision of each source in sources field the sync was performed against
    source : ApplicationstatusatproviderhistoryitemSource, optional
        Source is a reference to the application source used for the sync operation
    sources : [ApplicationstatusatproviderhistoryitemSourcesitem], optional
        Sources is a reference to the application sources used for the sync operation
    """
    deployStartedAt? : str
    deployedAt? : str
    id : int
    revision? : str
    revisions? : [str]
    source? : ApplicationstatusatproviderhistoryitemSource
    sources? : [ApplicationstatusatproviderhistoryitemSourcesitem]

schema ApplicationstatusatproviderhistoryitemSource:
    """
    Source is a reference to the application source used for the sync operation

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatusatproviderhistoryitemsourceDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatusatproviderhistoryitemsourceHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatusatproviderhistoryitemsourceKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is the name of the application source
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatusatproviderhistoryitemsourcePlugin, optional
        Plugin holds config management plugin specific options
    ref : str, optional
        Ref is reference to another source within sources field. This field will not be used if used with a `source` tag.
    repoURL : str, required
        RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
    targetRevision : str, optional
        TargetRevision defines the revision of the source to sync the application to.
        In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
        In case of Helm, this is a semver tag for the Chart's version.
    """
    chart? : str
    directory? : ApplicationstatusatproviderhistoryitemsourceDirectory
    helm? : ApplicationstatusatproviderhistoryitemsourceHelm
    kustomize? : ApplicationstatusatproviderhistoryitemsourceKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatusatproviderhistoryitemsourcePlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatusatproviderhistoryitemsourceDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatusatproviderhistoryitemsourcedirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatusatproviderhistoryitemsourcedirectoryJsonnet
    recurse? : bool

schema ApplicationstatusatproviderhistoryitemsourcedirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatusatproviderhistoryitemsourcedirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatusatproviderhistoryitemsourcedirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatusatproviderhistoryitemsourcedirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatusatproviderhistoryitemsourcedirectoryjsonnetTlasitem]

schema ApplicationstatusatproviderhistoryitemsourcedirectoryjsonnetExtvarsitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatproviderhistoryitemsourcedirectoryjsonnetTlasitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatproviderhistoryitemsourceHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatusatproviderhistoryitemsourcehelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatusatproviderhistoryitemsourcehelmParametersitem], optional
        Parameters is a list of Helm parameters which are passed to the helm template command upon manifest generation
    passCredentials : bool, optional
        PassCredentials pass credentials to all domains (Helm's --pass-credentials)
    releaseName : str, optional
        ReleaseName is the Helm release name to use. If omitted it will use the application name
    skipCrds : bool, optional
        SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
    skipSchemaValidation : bool, optional
        SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
    skipTests : bool, optional
        SkipTests skips test manifest installation step (Helm's --skip-tests).
    valueFiles : [str], optional
        ValuesFiles is a list of Helm value files to use when generating a template
    values : str, optional
        Values specifies Helm values to be passed to helm template, typically defined as a block. ValuesObject takes precedence over Values, so use one or the other.
    valuesObject : any, optional
        ValuesObject specifies Helm values to be passed to helm template, defined as a map. This takes precedence over Values.
    version : str, optional
        Version is the Helm version to use for templating ("3")
    """
    apiVersions? : [str]
    fileParameters? : [ApplicationstatusatproviderhistoryitemsourcehelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatusatproviderhistoryitemsourcehelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatusatproviderhistoryitemsourcehelmFileparametersitem:
    """
    HelmFileParameter is a file parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    name : str, optional
        Name is the name of the Helm parameter
    path : str, optional
        Path is the path to the file containing the values for the Helm parameter
    """
    name? : str
    path? : str

schema ApplicationstatusatproviderhistoryitemsourcehelmParametersitem:
    """
    HelmParameter is a parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    forceString : bool, optional
        ForceString determines whether to tell Helm to interpret booleans and numbers as strings
    name : str, optional
        Name is the name of the Helm parameter
    value : str, optional
        Value is the value for the Helm parameter
    """
    forceString? : bool
    name? : str
    value? : str

schema ApplicationstatusatproviderhistoryitemsourceKustomize:
    """
    Kustomize holds kustomize specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    commonAnnotations : {str:str}, optional
        CommonAnnotations is a list of additional annotations to add to rendered manifests
    commonAnnotationsEnvsubst : bool, optional
        CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for annotation values
    commonLabels : {str:str}, optional
        CommonLabels is a list of additional labels to add to rendered manifests
    components : [str], optional
        Components specifies a list of kustomize components to add to the kustomization before building
    forceCommonAnnotations : bool, optional
        ForceCommonAnnotations specifies whether to force applying common annotations to resources for Kustomize apps
    forceCommonLabels : bool, optional
        ForceCommonLabels specifies whether to force applying common labels to resources for Kustomize apps
    ignoreMissingComponents : bool, optional
        IgnoreMissingComponents prevents kustomize from failing when components do not exist locally by not appending them to kustomization file
    images : [str], optional
        Images is a list of Kustomize image override specifications
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    labelIncludeTemplates : bool, optional
        LabelIncludeTemplates specifies whether to apply common labels to resource templates or not
    labelWithoutSelector : bool, optional
        LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
    namePrefix : str, optional
        NamePrefix is a prefix appended to resources for Kustomize apps
    nameSuffix : str, optional
        NameSuffix is a suffix appended to resources for Kustomize apps
    namespace : str, optional
        Namespace sets the namespace that Kustomize adds to all resources
    patches : [ApplicationstatusatproviderhistoryitemsourcekustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatusatproviderhistoryitemsourcekustomizeReplicasitem], optional
        Replicas is a list of Kustomize Replicas override specifications
    version : str, optional
        Version controls which version of Kustomize to use for rendering manifests
    """
    apiVersions? : [str]
    commonAnnotations? : {str:str}
    commonAnnotationsEnvsubst? : bool
    commonLabels? : {str:str}
    components? : [str]
    forceCommonAnnotations? : bool
    forceCommonLabels? : bool
    ignoreMissingComponents? : bool
    images? : [str]
    kubeVersion? : str
    labelIncludeTemplates? : bool
    labelWithoutSelector? : bool
    namePrefix? : str
    nameSuffix? : str
    namespace? : str
    patches? : [ApplicationstatusatproviderhistoryitemsourcekustomizePatchesitem]
    replicas? : [ApplicationstatusatproviderhistoryitemsourcekustomizeReplicasitem]
    version? : str

schema ApplicationstatusatproviderhistoryitemsourcekustomizePatchesitem:
    """
    KustomizePatch is a kustomize patch

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatusatproviderhistoryitemsourcekustomizepatchesitemTarget, optional
        KustomizeSelector is a selector of a Kustomize Patch
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatusatproviderhistoryitemsourcekustomizepatchesitemTarget

schema ApplicationstatusatproviderhistoryitemsourcekustomizepatchesitemTarget:
    """
    KustomizeSelector is a selector of a Kustomize Patch

    Attributes
    ----------
    annotationSelector : str, optional
        No description available.
    group : str, optional
        No description available.
    kind : str, optional
        No description available.
    labelSelector : str, optional
        No description available.
    name : str, optional
        No description available.
    namespace : str, optional
        No description available.
    version : str, optional
        No description available.
    """
    annotationSelector? : str
    group? : str
    kind? : str
    labelSelector? : str
    name? : str
    namespace? : str
    version? : str

schema ApplicationstatusatproviderhistoryitemsourcekustomizeReplicasitem:
    """
    KustomizeReplica override specifications

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatusatproviderhistoryitemsourcePlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatusatproviderhistoryitemsourcepluginEnvitem], optional
        Env holds options specific to config management plugins
    name : str, optional
        No description available.
    parameters : [ApplicationstatusatproviderhistoryitemsourcepluginParametersitem], optional
        ApplicationSourcePluginParameters is a list of specific config management parameters
    """
    env? : [ApplicationstatusatproviderhistoryitemsourcepluginEnvitem]
    name? : str
    parameters? : [ApplicationstatusatproviderhistoryitemsourcepluginParametersitem]

schema ApplicationstatusatproviderhistoryitemsourcepluginEnvitem:
    """
    EnvEntry represents an entry in the application's environment

    Attributes
    ----------
    name : str, required
        Name is the name of the variable, usually expressed in uppercase
    value : str, required
        Value is the value of the variable
    """
    name : str
    value : str

schema ApplicationstatusatproviderhistoryitemsourcepluginParametersitem:
    """
    ApplicationSourcePluginParameter holds options specific to config management parameters

    Attributes
    ----------
    array : [str], optional
        Array is the value of an array type parameter.
    map : {str:str}, optional
        Map is the value of a map type parameter.
    name : str, optional
        Name is the name identifying a parameter.
    string : str, optional
        String_ is the value of a string type parameter.
    """
    array? : [str]
    map? : {str:str}
    name? : str
    string? : str

schema ApplicationstatusatproviderhistoryitemSourcesitem:
    """
    ApplicationSource contains all required information about the source of an application

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatusatproviderhistoryitemsourcesitemDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatusatproviderhistoryitemsourcesitemHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatusatproviderhistoryitemsourcesitemKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is the name of the application source
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatusatproviderhistoryitemsourcesitemPlugin, optional
        Plugin holds config management plugin specific options
    ref : str, optional
        Ref is reference to another source within sources field. This field will not be used if used with a `source` tag.
    repoURL : str, required
        RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
    targetRevision : str, optional
        TargetRevision defines the revision of the source to sync the application to.
        In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
        In case of Helm, this is a semver tag for the Chart's version.
    """
    chart? : str
    directory? : ApplicationstatusatproviderhistoryitemsourcesitemDirectory
    helm? : ApplicationstatusatproviderhistoryitemsourcesitemHelm
    kustomize? : ApplicationstatusatproviderhistoryitemsourcesitemKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatusatproviderhistoryitemsourcesitemPlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatusatproviderhistoryitemsourcesitemDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatusatproviderhistoryitemsourcesitemdirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatusatproviderhistoryitemsourcesitemdirectoryJsonnet
    recurse? : bool

schema ApplicationstatusatproviderhistoryitemsourcesitemdirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatusatproviderhistoryitemsourcesitemdirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatusatproviderhistoryitemsourcesitemdirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatusatproviderhistoryitemsourcesitemdirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatusatproviderhistoryitemsourcesitemdirectoryjsonnetTlasitem]

schema ApplicationstatusatproviderhistoryitemsourcesitemdirectoryjsonnetExtvarsitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatproviderhistoryitemsourcesitemdirectoryjsonnetTlasitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatproviderhistoryitemsourcesitemHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatusatproviderhistoryitemsourcesitemhelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatusatproviderhistoryitemsourcesitemhelmParametersitem], optional
        Parameters is a list of Helm parameters which are passed to the helm template command upon manifest generation
    passCredentials : bool, optional
        PassCredentials pass credentials to all domains (Helm's --pass-credentials)
    releaseName : str, optional
        ReleaseName is the Helm release name to use. If omitted it will use the application name
    skipCrds : bool, optional
        SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
    skipSchemaValidation : bool, optional
        SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
    skipTests : bool, optional
        SkipTests skips test manifest installation step (Helm's --skip-tests).
    valueFiles : [str], optional
        ValuesFiles is a list of Helm value files to use when generating a template
    values : str, optional
        Values specifies Helm values to be passed to helm template, typically defined as a block. ValuesObject takes precedence over Values, so use one or the other.
    valuesObject : any, optional
        ValuesObject specifies Helm values to be passed to helm template, defined as a map. This takes precedence over Values.
    version : str, optional
        Version is the Helm version to use for templating ("3")
    """
    apiVersions? : [str]
    fileParameters? : [ApplicationstatusatproviderhistoryitemsourcesitemhelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatusatproviderhistoryitemsourcesitemhelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatusatproviderhistoryitemsourcesitemhelmFileparametersitem:
    """
    HelmFileParameter is a file parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    name : str, optional
        Name is the name of the Helm parameter
    path : str, optional
        Path is the path to the file containing the values for the Helm parameter
    """
    name? : str
    path? : str

schema ApplicationstatusatproviderhistoryitemsourcesitemhelmParametersitem:
    """
    HelmParameter is a parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    forceString : bool, optional
        ForceString determines whether to tell Helm to interpret booleans and numbers as strings
    name : str, optional
        Name is the name of the Helm parameter
    value : str, optional
        Value is the value for the Helm parameter
    """
    forceString? : bool
    name? : str
    value? : str

schema ApplicationstatusatproviderhistoryitemsourcesitemKustomize:
    """
    Kustomize holds kustomize specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    commonAnnotations : {str:str}, optional
        CommonAnnotations is a list of additional annotations to add to rendered manifests
    commonAnnotationsEnvsubst : bool, optional
        CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for annotation values
    commonLabels : {str:str}, optional
        CommonLabels is a list of additional labels to add to rendered manifests
    components : [str], optional
        Components specifies a list of kustomize components to add to the kustomization before building
    forceCommonAnnotations : bool, optional
        ForceCommonAnnotations specifies whether to force applying common annotations to resources for Kustomize apps
    forceCommonLabels : bool, optional
        ForceCommonLabels specifies whether to force applying common labels to resources for Kustomize apps
    ignoreMissingComponents : bool, optional
        IgnoreMissingComponents prevents kustomize from failing when components do not exist locally by not appending them to kustomization file
    images : [str], optional
        Images is a list of Kustomize image override specifications
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    labelIncludeTemplates : bool, optional
        LabelIncludeTemplates specifies whether to apply common labels to resource templates or not
    labelWithoutSelector : bool, optional
        LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
    namePrefix : str, optional
        NamePrefix is a prefix appended to resources for Kustomize apps
    nameSuffix : str, optional
        NameSuffix is a suffix appended to resources for Kustomize apps
    namespace : str, optional
        Namespace sets the namespace that Kustomize adds to all resources
    patches : [ApplicationstatusatproviderhistoryitemsourcesitemkustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatusatproviderhistoryitemsourcesitemkustomizeReplicasitem], optional
        Replicas is a list of Kustomize Replicas override specifications
    version : str, optional
        Version controls which version of Kustomize to use for rendering manifests
    """
    apiVersions? : [str]
    commonAnnotations? : {str:str}
    commonAnnotationsEnvsubst? : bool
    commonLabels? : {str:str}
    components? : [str]
    forceCommonAnnotations? : bool
    forceCommonLabels? : bool
    ignoreMissingComponents? : bool
    images? : [str]
    kubeVersion? : str
    labelIncludeTemplates? : bool
    labelWithoutSelector? : bool
    namePrefix? : str
    nameSuffix? : str
    namespace? : str
    patches? : [ApplicationstatusatproviderhistoryitemsourcesitemkustomizePatchesitem]
    replicas? : [ApplicationstatusatproviderhistoryitemsourcesitemkustomizeReplicasitem]
    version? : str

schema ApplicationstatusatproviderhistoryitemsourcesitemkustomizePatchesitem:
    """
    KustomizePatch is a kustomize patch

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatusatproviderhistoryitemsourcesitemkustomizepatchesitemTarget, optional
        KustomizeSelector is a selector of a Kustomize Patch
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatusatproviderhistoryitemsourcesitemkustomizepatchesitemTarget

schema ApplicationstatusatproviderhistoryitemsourcesitemkustomizepatchesitemTarget:
    """
    KustomizeSelector is a selector of a Kustomize Patch

    Attributes
    ----------
    annotationSelector : str, optional
        No description available.
    group : str, optional
        No description available.
    kind : str, optional
        No description available.
    labelSelector : str, optional
        No description available.
    name : str, optional
        No description available.
    namespace : str, optional
        No description available.
    version : str, optional
        No description available.
    """
    annotationSelector? : str
    group? : str
    kind? : str
    labelSelector? : str
    name? : str
    namespace? : str
    version? : str

schema ApplicationstatusatproviderhistoryitemsourcesitemkustomizeReplicasitem:
    """
    KustomizeReplica override specifications

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatusatproviderhistoryitemsourcesitemPlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatusatproviderhistoryitemsourcesitempluginEnvitem], optional
        Env holds options specific to config management plugins
    name : str, optional
        No description available.
    parameters : [ApplicationstatusatproviderhistoryitemsourcesitempluginParametersitem], optional
        ApplicationSourcePluginParameters is a list of specific config management parameters
    """
    env? : [ApplicationstatusatproviderhistoryitemsourcesitempluginEnvitem]
    name? : str
    parameters? : [ApplicationstatusatproviderhistoryitemsourcesitempluginParametersitem]

schema ApplicationstatusatproviderhistoryitemsourcesitempluginEnvitem:
    """
    EnvEntry represents an entry in the application's environment

    Attributes
    ----------
    name : str, required
        Name is the name of the variable, usually expressed in uppercase
    value : str, required
        Value is the value of the variable
    """
    name : str
    value : str

schema ApplicationstatusatproviderhistoryitemsourcesitempluginParametersitem:
    """
    ApplicationSourcePluginParameter holds options specific to config management parameters

    Attributes
    ----------
    array : [str], optional
        Array is the value of an array type parameter.
    map : {str:str}, optional
        Map is the value of a map type parameter.
    name : str, optional
        Name is the name identifying a parameter.
    string : str, optional
        String_ is the value of a string type parameter.
    """
    array? : [str]
    map? : {str:str}
    name? : str
    string? : str

schema ApplicationstatusatproviderOperationstate:
    """
    OperationState contains information about any ongoing operations, such as a sync

    Attributes
    ----------
    finishedAt : str, optional
        FinishedAt contains time of operation completion
    message : str, optional
        Message holds any pertinent messages when attempting to perform operation (typically errors).
    operation : ApplicationstatusatprovideroperationstateOperation, optional
        Operation is the original requested operation
    phase : str, optional
        Phase is the current phase of the operation
    retryCount : int, optional
        RetryCount contains time of operation retries
    startedAt : str, optional
        StartedAt contains time of operation start
    syncResult : ApplicationstatusatprovideroperationstateSyncresult, optional
        SyncResult is the result of a Sync operation
    """
    finishedAt? : str
    message? : str
    operation? : ApplicationstatusatprovideroperationstateOperation
    phase? : str
    retryCount? : int
    startedAt? : str
    syncResult? : ApplicationstatusatprovideroperationstateSyncresult

schema ApplicationstatusatprovideroperationstateOperation:
    """
    Operation is the original requested operation

    Attributes
    ----------
    info : [ApplicationstatusatprovideroperationstateoperationInfoitem], optional
        Info is a list of informational items for this operation
    initiatedBy : ApplicationstatusatprovideroperationstateoperationInitiatedby, optional
        InitiatedBy contains information about who initiated the operations
    retry : ApplicationstatusatprovideroperationstateoperationRetry, optional
        Retry controls the strategy to apply if a sync fails
    sync : ApplicationstatusatprovideroperationstateoperationSync, optional
        Sync contains parameters for the operation
    """
    info? : [ApplicationstatusatprovideroperationstateoperationInfoitem]
    initiatedBy? : ApplicationstatusatprovideroperationstateoperationInitiatedby
    retry? : ApplicationstatusatprovideroperationstateoperationRetry
    sync? : ApplicationstatusatprovideroperationstateoperationSync

schema ApplicationstatusatprovideroperationstateoperationInfoitem:
    """
    Info is a list of informational items for this operation

    Attributes
    ----------
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    name : str
    value : str

schema ApplicationstatusatprovideroperationstateoperationInitiatedby:
    """
    InitiatedBy contains information about who initiated the operations

    Attributes
    ----------
    automated : bool, optional
        Automated is set to true if operation was initiated automatically by the application controller.
    username : str, optional
        Username contains the name of a user who started operation
    """
    automated? : bool
    username? : str

schema ApplicationstatusatprovideroperationstateoperationRetry:
    """
    Retry controls the strategy to apply if a sync fails

    Attributes
    ----------
    backoff : ApplicationstatusatprovideroperationstateoperationretryBackoff, optional
        Backoff controls how to backoff on subsequent retries of failed syncs
    limit : int, optional
        Limit is the maximum number of attempts for retrying a failed sync. If set to 0, no retries will be performed.
    """
    backoff? : ApplicationstatusatprovideroperationstateoperationretryBackoff
    limit? : int

schema ApplicationstatusatprovideroperationstateoperationretryBackoff:
    """
    Backoff controls how to backoff on subsequent retries of failed syncs

    Attributes
    ----------
    duration : str, optional
        Duration is the amount to back off. Default unit is seconds, but could also be a duration (e.g. "2m", "1h")
    factor : int, optional
        Factor is a factor to multiply the base duration after each failed retry
    maxDuration : str, optional
        MaxDuration is the maximum amount of time allowed for the backoff strategy
    """
    duration? : str
    factor? : int
    maxDuration? : str

schema ApplicationstatusatprovideroperationstateoperationSync:
    """
    Sync contains parameters for the operation

    Attributes
    ----------
    dryRun : bool, optional
        DryRun specifies to perform a `kubectl apply --dry-run` without actually performing the sync
    manifests : [str], optional
        Manifests is an optional field that overrides sync source with a local directory for development
    prune : bool, optional
        Prune specifies to delete resources from the cluster that are no longer tracked in git
    resources : [ApplicationstatusatprovideroperationstateoperationsyncResourcesitem], optional
        Resources describes which resources shall be part of the sync
    revision : str, optional
        Revision is the revision (Git) or chart version (Helm) which to sync the application to
        If omitted, will use the revision specified in app spec.
    revisions : [str], optional
        Revisions is the list of revision (Git) or chart version (Helm) which to sync each source in sources field for the application to
        If omitted, will use the revision specified in app spec.
    source : ApplicationstatusatprovideroperationstateoperationsyncSource, optional
        Source overrides the source definition set in the application.
        This is typically set in a Rollback operation and is nil during a Sync operation
    sources : [ApplicationstatusatprovideroperationstateoperationsyncSourcesitem], optional
        Sources overrides the source definition set in the application.
        This is typically set in a Rollback operation and is nil during a Sync operation
    syncOptions : [str], optional
        SyncOptions provide per-sync sync-options, e.g. Validate=false
    syncStrategy : ApplicationstatusatprovideroperationstateoperationsyncSyncstrategy, optional
        SyncStrategy describes how to perform the sync
    """
    dryRun? : bool
    manifests? : [str]
    prune? : bool
    resources? : [ApplicationstatusatprovideroperationstateoperationsyncResourcesitem]
    revision? : str
    revisions? : [str]
    source? : ApplicationstatusatprovideroperationstateoperationsyncSource
    sources? : [ApplicationstatusatprovideroperationstateoperationsyncSourcesitem]
    syncOptions? : [str]
    syncStrategy? : ApplicationstatusatprovideroperationstateoperationsyncSyncstrategy

schema ApplicationstatusatprovideroperationstateoperationsyncResourcesitem:
    """
    SyncOperationResource contains resources to sync.

    Attributes
    ----------
    group : str, optional
        No description available.
    kind : str, required
        No description available.
    name : str, required
        No description available.
    namespace : str, optional
        No description available.
    """
    group? : str
    kind : str
    name : str
    namespace? : str

schema ApplicationstatusatprovideroperationstateoperationsyncSource:
    """
    Source overrides the source definition set in the application.
    This is typically set in a Rollback operation and is nil during a Sync operation

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatusatprovideroperationstateoperationsyncsourceDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatusatprovideroperationstateoperationsyncsourceHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatusatprovideroperationstateoperationsyncsourceKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is the name of the application source
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatusatprovideroperationstateoperationsyncsourcePlugin, optional
        Plugin holds config management plugin specific options
    ref : str, optional
        Ref is reference to another source within sources field. This field will not be used if used with a `source` tag.
    repoURL : str, required
        RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
    targetRevision : str, optional
        TargetRevision defines the revision of the source to sync the application to.
        In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
        In case of Helm, this is a semver tag for the Chart's version.
    """
    chart? : str
    directory? : ApplicationstatusatprovideroperationstateoperationsyncsourceDirectory
    helm? : ApplicationstatusatprovideroperationstateoperationsyncsourceHelm
    kustomize? : ApplicationstatusatprovideroperationstateoperationsyncsourceKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatusatprovideroperationstateoperationsyncsourcePlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourceDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatusatprovideroperationstateoperationsyncsourcedirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatusatprovideroperationstateoperationsyncsourcedirectoryJsonnet
    recurse? : bool

schema ApplicationstatusatprovideroperationstateoperationsyncsourcedirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatusatprovideroperationstateoperationsyncsourcedirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatusatprovideroperationstateoperationsyncsourcedirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatusatprovideroperationstateoperationsyncsourcedirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatusatprovideroperationstateoperationsyncsourcedirectoryjsonnetTlasitem]

schema ApplicationstatusatprovideroperationstateoperationsyncsourcedirectoryjsonnetExtvarsitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcedirectoryjsonnetTlasitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourceHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatusatprovideroperationstateoperationsyncsourcehelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatusatprovideroperationstateoperationsyncsourcehelmParametersitem], optional
        Parameters is a list of Helm parameters which are passed to the helm template command upon manifest generation
    passCredentials : bool, optional
        PassCredentials pass credentials to all domains (Helm's --pass-credentials)
    releaseName : str, optional
        ReleaseName is the Helm release name to use. If omitted it will use the application name
    skipCrds : bool, optional
        SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
    skipSchemaValidation : bool, optional
        SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
    skipTests : bool, optional
        SkipTests skips test manifest installation step (Helm's --skip-tests).
    valueFiles : [str], optional
        ValuesFiles is a list of Helm value files to use when generating a template
    values : str, optional
        Values specifies Helm values to be passed to helm template, typically defined as a block. ValuesObject takes precedence over Values, so use one or the other.
    valuesObject : any, optional
        ValuesObject specifies Helm values to be passed to helm template, defined as a map. This takes precedence over Values.
    version : str, optional
        Version is the Helm version to use for templating ("3")
    """
    apiVersions? : [str]
    fileParameters? : [ApplicationstatusatprovideroperationstateoperationsyncsourcehelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatusatprovideroperationstateoperationsyncsourcehelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcehelmFileparametersitem:
    """
    HelmFileParameter is a file parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    name : str, optional
        Name is the name of the Helm parameter
    path : str, optional
        Path is the path to the file containing the values for the Helm parameter
    """
    name? : str
    path? : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcehelmParametersitem:
    """
    HelmParameter is a parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    forceString : bool, optional
        ForceString determines whether to tell Helm to interpret booleans and numbers as strings
    name : str, optional
        Name is the name of the Helm parameter
    value : str, optional
        Value is the value for the Helm parameter
    """
    forceString? : bool
    name? : str
    value? : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourceKustomize:
    """
    Kustomize holds kustomize specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    commonAnnotations : {str:str}, optional
        CommonAnnotations is a list of additional annotations to add to rendered manifests
    commonAnnotationsEnvsubst : bool, optional
        CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for annotation values
    commonLabels : {str:str}, optional
        CommonLabels is a list of additional labels to add to rendered manifests
    components : [str], optional
        Components specifies a list of kustomize components to add to the kustomization before building
    forceCommonAnnotations : bool, optional
        ForceCommonAnnotations specifies whether to force applying common annotations to resources for Kustomize apps
    forceCommonLabels : bool, optional
        ForceCommonLabels specifies whether to force applying common labels to resources for Kustomize apps
    ignoreMissingComponents : bool, optional
        IgnoreMissingComponents prevents kustomize from failing when components do not exist locally by not appending them to kustomization file
    images : [str], optional
        Images is a list of Kustomize image override specifications
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    labelIncludeTemplates : bool, optional
        LabelIncludeTemplates specifies whether to apply common labels to resource templates or not
    labelWithoutSelector : bool, optional
        LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
    namePrefix : str, optional
        NamePrefix is a prefix appended to resources for Kustomize apps
    nameSuffix : str, optional
        NameSuffix is a suffix appended to resources for Kustomize apps
    namespace : str, optional
        Namespace sets the namespace that Kustomize adds to all resources
    patches : [ApplicationstatusatprovideroperationstateoperationsyncsourcekustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatusatprovideroperationstateoperationsyncsourcekustomizeReplicasitem], optional
        Replicas is a list of Kustomize Replicas override specifications
    version : str, optional
        Version controls which version of Kustomize to use for rendering manifests
    """
    apiVersions? : [str]
    commonAnnotations? : {str:str}
    commonAnnotationsEnvsubst? : bool
    commonLabels? : {str:str}
    components? : [str]
    forceCommonAnnotations? : bool
    forceCommonLabels? : bool
    ignoreMissingComponents? : bool
    images? : [str]
    kubeVersion? : str
    labelIncludeTemplates? : bool
    labelWithoutSelector? : bool
    namePrefix? : str
    nameSuffix? : str
    namespace? : str
    patches? : [ApplicationstatusatprovideroperationstateoperationsyncsourcekustomizePatchesitem]
    replicas? : [ApplicationstatusatprovideroperationstateoperationsyncsourcekustomizeReplicasitem]
    version? : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcekustomizePatchesitem:
    """
    KustomizePatch is a kustomize patch

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatusatprovideroperationstateoperationsyncsourcekustomizepatchesitemTarget, optional
        KustomizeSelector is a selector of a Kustomize Patch
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatusatprovideroperationstateoperationsyncsourcekustomizepatchesitemTarget

schema ApplicationstatusatprovideroperationstateoperationsyncsourcekustomizepatchesitemTarget:
    """
    KustomizeSelector is a selector of a Kustomize Patch

    Attributes
    ----------
    annotationSelector : str, optional
        No description available.
    group : str, optional
        No description available.
    kind : str, optional
        No description available.
    labelSelector : str, optional
        No description available.
    name : str, optional
        No description available.
    namespace : str, optional
        No description available.
    version : str, optional
        No description available.
    """
    annotationSelector? : str
    group? : str
    kind? : str
    labelSelector? : str
    name? : str
    namespace? : str
    version? : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcekustomizeReplicasitem:
    """
    KustomizeReplica override specifications

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcePlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatusatprovideroperationstateoperationsyncsourcepluginEnvitem], optional
        Env holds options specific to config management plugins
    name : str, optional
        No description available.
    parameters : [ApplicationstatusatprovideroperationstateoperationsyncsourcepluginParametersitem], optional
        ApplicationSourcePluginParameters is a list of specific config management parameters
    """
    env? : [ApplicationstatusatprovideroperationstateoperationsyncsourcepluginEnvitem]
    name? : str
    parameters? : [ApplicationstatusatprovideroperationstateoperationsyncsourcepluginParametersitem]

schema ApplicationstatusatprovideroperationstateoperationsyncsourcepluginEnvitem:
    """
    EnvEntry represents an entry in the application's environment

    Attributes
    ----------
    name : str, required
        Name is the name of the variable, usually expressed in uppercase
    value : str, required
        Value is the value of the variable
    """
    name : str
    value : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcepluginParametersitem:
    """
    ApplicationSourcePluginParameter holds options specific to config management parameters

    Attributes
    ----------
    array : [str], optional
        Array is the value of an array type parameter.
    map : {str:str}, optional
        Map is the value of a map type parameter.
    name : str, optional
        Name is the name identifying a parameter.
    string : str, optional
        String_ is the value of a string type parameter.
    """
    array? : [str]
    map? : {str:str}
    name? : str
    string? : str

schema ApplicationstatusatprovideroperationstateoperationsyncSourcesitem:
    """
    ApplicationSource contains all required information about the source of an application

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatusatprovideroperationstateoperationsyncsourcesitemDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatusatprovideroperationstateoperationsyncsourcesitemHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatusatprovideroperationstateoperationsyncsourcesitemKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is the name of the application source
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatusatprovideroperationstateoperationsyncsourcesitemPlugin, optional
        Plugin holds config management plugin specific options
    ref : str, optional
        Ref is reference to another source within sources field. This field will not be used if used with a `source` tag.
    repoURL : str, required
        RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
    targetRevision : str, optional
        TargetRevision defines the revision of the source to sync the application to.
        In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
        In case of Helm, this is a semver tag for the Chart's version.
    """
    chart? : str
    directory? : ApplicationstatusatprovideroperationstateoperationsyncsourcesitemDirectory
    helm? : ApplicationstatusatprovideroperationstateoperationsyncsourcesitemHelm
    kustomize? : ApplicationstatusatprovideroperationstateoperationsyncsourcesitemKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatusatprovideroperationstateoperationsyncsourcesitemPlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcesitemDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatusatprovideroperationstateoperationsyncsourcesitemdirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatusatprovideroperationstateoperationsyncsourcesitemdirectoryJsonnet
    recurse? : bool

schema ApplicationstatusatprovideroperationstateoperationsyncsourcesitemdirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitemdirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitemdirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitemdirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitemdirectoryjsonnetTlasitem]

schema ApplicationstatusatprovideroperationstateoperationsyncsourcesitemdirectoryjsonnetExtvarsitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcesitemdirectoryjsonnetTlasitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcesitemHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitemhelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitemhelmParametersitem], optional
        Parameters is a list of Helm parameters which are passed to the helm template command upon manifest generation
    passCredentials : bool, optional
        PassCredentials pass credentials to all domains (Helm's --pass-credentials)
    releaseName : str, optional
        ReleaseName is the Helm release name to use. If omitted it will use the application name
    skipCrds : bool, optional
        SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
    skipSchemaValidation : bool, optional
        SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
    skipTests : bool, optional
        SkipTests skips test manifest installation step (Helm's --skip-tests).
    valueFiles : [str], optional
        ValuesFiles is a list of Helm value files to use when generating a template
    values : str, optional
        Values specifies Helm values to be passed to helm template, typically defined as a block. ValuesObject takes precedence over Values, so use one or the other.
    valuesObject : any, optional
        ValuesObject specifies Helm values to be passed to helm template, defined as a map. This takes precedence over Values.
    version : str, optional
        Version is the Helm version to use for templating ("3")
    """
    apiVersions? : [str]
    fileParameters? : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitemhelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitemhelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcesitemhelmFileparametersitem:
    """
    HelmFileParameter is a file parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    name : str, optional
        Name is the name of the Helm parameter
    path : str, optional
        Path is the path to the file containing the values for the Helm parameter
    """
    name? : str
    path? : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcesitemhelmParametersitem:
    """
    HelmParameter is a parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    forceString : bool, optional
        ForceString determines whether to tell Helm to interpret booleans and numbers as strings
    name : str, optional
        Name is the name of the Helm parameter
    value : str, optional
        Value is the value for the Helm parameter
    """
    forceString? : bool
    name? : str
    value? : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcesitemKustomize:
    """
    Kustomize holds kustomize specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    commonAnnotations : {str:str}, optional
        CommonAnnotations is a list of additional annotations to add to rendered manifests
    commonAnnotationsEnvsubst : bool, optional
        CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for annotation values
    commonLabels : {str:str}, optional
        CommonLabels is a list of additional labels to add to rendered manifests
    components : [str], optional
        Components specifies a list of kustomize components to add to the kustomization before building
    forceCommonAnnotations : bool, optional
        ForceCommonAnnotations specifies whether to force applying common annotations to resources for Kustomize apps
    forceCommonLabels : bool, optional
        ForceCommonLabels specifies whether to force applying common labels to resources for Kustomize apps
    ignoreMissingComponents : bool, optional
        IgnoreMissingComponents prevents kustomize from failing when components do not exist locally by not appending them to kustomization file
    images : [str], optional
        Images is a list of Kustomize image override specifications
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    labelIncludeTemplates : bool, optional
        LabelIncludeTemplates specifies whether to apply common labels to resource templates or not
    labelWithoutSelector : bool, optional
        LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
    namePrefix : str, optional
        NamePrefix is a prefix appended to resources for Kustomize apps
    nameSuffix : str, optional
        NameSuffix is a suffix appended to resources for Kustomize apps
    namespace : str, optional
        Namespace sets the namespace that Kustomize adds to all resources
    patches : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitemkustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitemkustomizeReplicasitem], optional
        Replicas is a list of Kustomize Replicas override specifications
    version : str, optional
        Version controls which version of Kustomize to use for rendering manifests
    """
    apiVersions? : [str]
    commonAnnotations? : {str:str}
    commonAnnotationsEnvsubst? : bool
    commonLabels? : {str:str}
    components? : [str]
    forceCommonAnnotations? : bool
    forceCommonLabels? : bool
    ignoreMissingComponents? : bool
    images? : [str]
    kubeVersion? : str
    labelIncludeTemplates? : bool
    labelWithoutSelector? : bool
    namePrefix? : str
    nameSuffix? : str
    namespace? : str
    patches? : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitemkustomizePatchesitem]
    replicas? : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitemkustomizeReplicasitem]
    version? : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcesitemkustomizePatchesitem:
    """
    KustomizePatch is a kustomize patch

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatusatprovideroperationstateoperationsyncsourcesitemkustomizepatchesitemTarget, optional
        KustomizeSelector is a selector of a Kustomize Patch
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatusatprovideroperationstateoperationsyncsourcesitemkustomizepatchesitemTarget

schema ApplicationstatusatprovideroperationstateoperationsyncsourcesitemkustomizepatchesitemTarget:
    """
    KustomizeSelector is a selector of a Kustomize Patch

    Attributes
    ----------
    annotationSelector : str, optional
        No description available.
    group : str, optional
        No description available.
    kind : str, optional
        No description available.
    labelSelector : str, optional
        No description available.
    name : str, optional
        No description available.
    namespace : str, optional
        No description available.
    version : str, optional
        No description available.
    """
    annotationSelector? : str
    group? : str
    kind? : str
    labelSelector? : str
    name? : str
    namespace? : str
    version? : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcesitemkustomizeReplicasitem:
    """
    KustomizeReplica override specifications

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcesitemPlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitempluginEnvitem], optional
        Env holds options specific to config management plugins
    name : str, optional
        No description available.
    parameters : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitempluginParametersitem], optional
        ApplicationSourcePluginParameters is a list of specific config management parameters
    """
    env? : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitempluginEnvitem]
    name? : str
    parameters? : [ApplicationstatusatprovideroperationstateoperationsyncsourcesitempluginParametersitem]

schema ApplicationstatusatprovideroperationstateoperationsyncsourcesitempluginEnvitem:
    """
    EnvEntry represents an entry in the application's environment

    Attributes
    ----------
    name : str, required
        Name is the name of the variable, usually expressed in uppercase
    value : str, required
        Value is the value of the variable
    """
    name : str
    value : str

schema ApplicationstatusatprovideroperationstateoperationsyncsourcesitempluginParametersitem:
    """
    ApplicationSourcePluginParameter holds options specific to config management parameters

    Attributes
    ----------
    array : [str], optional
        Array is the value of an array type parameter.
    map : {str:str}, optional
        Map is the value of a map type parameter.
    name : str, optional
        Name is the name identifying a parameter.
    string : str, optional
        String_ is the value of a string type parameter.
    """
    array? : [str]
    map? : {str:str}
    name? : str
    string? : str

schema ApplicationstatusatprovideroperationstateoperationsyncSyncstrategy:
    """
    SyncStrategy describes how to perform the sync

    Attributes
    ----------
    apply : ApplicationstatusatprovideroperationstateoperationsyncsyncstrategyApply, optional
        Apply will perform a `kubectl apply` to perform the sync.
    hook : ApplicationstatusatprovideroperationstateoperationsyncsyncstrategyHook, optional
        Hook will submit any referenced resources to perform the sync. This is the default strategy
    """
    apply? : ApplicationstatusatprovideroperationstateoperationsyncsyncstrategyApply
    hook? : ApplicationstatusatprovideroperationstateoperationsyncsyncstrategyHook

schema ApplicationstatusatprovideroperationstateoperationsyncsyncstrategyApply:
    """
    Apply will perform a `kubectl apply` to perform the sync.

    Attributes
    ----------
    force : bool, optional
        Force indicates whether or not to supply the --force flag to `kubectl apply`.
        The --force flag deletes and re-create the resource, when PATCH encounters conflict and has
        retried for 5 times.
    """
    force? : bool

schema ApplicationstatusatprovideroperationstateoperationsyncsyncstrategyHook:
    """
    Hook will submit any referenced resources to perform the sync. This is the default strategy

    Attributes
    ----------
    force : bool, optional
        Force indicates whether or not to supply the --force flag to `kubectl apply`.
        The --force flag deletes and re-create the resource, when PATCH encounters conflict and has
        retried for 5 times.
    """
    force? : bool

schema ApplicationstatusatprovideroperationstateSyncresult:
    """
    SyncResult is the result of a Sync operation

    Attributes
    ----------
    resources : [ApplicationstatusatprovideroperationstatesyncresultResourcesitem], optional
        Resources contains a list of sync result items for each individual resource in a sync operation
    revision : str, required
        Revision holds the revision this sync operation was performed to
    revisions : [str], optional
        Revisions holds the revision this sync operation was performed for respective indexed source in sources field
    source : ApplicationstatusatprovideroperationstatesyncresultSource, optional
        Source records the application source information of the sync, used for comparing auto-sync
    sources : [ApplicationstatusatprovideroperationstatesyncresultSourcesitem], optional
        Source records the application source information of the sync, used for comparing auto-sync
    """
    resources? : [ApplicationstatusatprovideroperationstatesyncresultResourcesitem]
    revision : str
    revisions? : [str]
    source? : ApplicationstatusatprovideroperationstatesyncresultSource
    sources? : [ApplicationstatusatprovideroperationstatesyncresultSourcesitem]

schema ApplicationstatusatprovideroperationstatesyncresultResourcesitem:
    """
    ResourceResult holds the operation result details of a specific resource

    Attributes
    ----------
    group : str, required
        Group specifies the API group of the resource
    hookPhase : str, optional
        HookPhase contains the state of any operation associated with this resource OR hook
        This can also contain values for non-hook resources.
    hookType : str, optional
        HookType specifies the type of the hook. Empty for non-hook resources
    kind : str, required
        Kind specifies the API kind of the resource
    message : str, optional
        Message contains an informational or error message for the last sync OR operation
    name : str, required
        Name specifies the name of the resource
    namespace : str, required
        Namespace specifies the target namespace of the resource
    status : str, optional
        Status holds the final result of the sync. Will be empty if the resources is yet to be applied/pruned and is always zero-value for hooks
    syncPhase : str, optional
        SyncPhase indicates the particular phase of the sync that this result was acquired in
    version : str, required
        Version specifies the API version of the resource
    """
    group : str
    hookPhase? : str
    hookType? : str
    kind : str
    message? : str
    name : str
    namespace : str
    status? : str
    syncPhase? : str
    version : str

schema ApplicationstatusatprovideroperationstatesyncresultSource:
    """
    Source records the application source information of the sync, used for comparing auto-sync

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatusatprovideroperationstatesyncresultsourceDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatusatprovideroperationstatesyncresultsourceHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatusatprovideroperationstatesyncresultsourceKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is the name of the application source
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatusatprovideroperationstatesyncresultsourcePlugin, optional
        Plugin holds config management plugin specific options
    ref : str, optional
        Ref is reference to another source within sources field. This field will not be used if used with a `source` tag.
    repoURL : str, required
        RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
    targetRevision : str, optional
        TargetRevision defines the revision of the source to sync the application to.
        In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
        In case of Helm, this is a semver tag for the Chart's version.
    """
    chart? : str
    directory? : ApplicationstatusatprovideroperationstatesyncresultsourceDirectory
    helm? : ApplicationstatusatprovideroperationstatesyncresultsourceHelm
    kustomize? : ApplicationstatusatprovideroperationstatesyncresultsourceKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatusatprovideroperationstatesyncresultsourcePlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatusatprovideroperationstatesyncresultsourceDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatusatprovideroperationstatesyncresultsourcedirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatusatprovideroperationstatesyncresultsourcedirectoryJsonnet
    recurse? : bool

schema ApplicationstatusatprovideroperationstatesyncresultsourcedirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatusatprovideroperationstatesyncresultsourcedirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatusatprovideroperationstatesyncresultsourcedirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatusatprovideroperationstatesyncresultsourcedirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatusatprovideroperationstatesyncresultsourcedirectoryjsonnetTlasitem]

schema ApplicationstatusatprovideroperationstatesyncresultsourcedirectoryjsonnetExtvarsitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcedirectoryjsonnetTlasitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatprovideroperationstatesyncresultsourceHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatusatprovideroperationstatesyncresultsourcehelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatusatprovideroperationstatesyncresultsourcehelmParametersitem], optional
        Parameters is a list of Helm parameters which are passed to the helm template command upon manifest generation
    passCredentials : bool, optional
        PassCredentials pass credentials to all domains (Helm's --pass-credentials)
    releaseName : str, optional
        ReleaseName is the Helm release name to use. If omitted it will use the application name
    skipCrds : bool, optional
        SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
    skipSchemaValidation : bool, optional
        SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
    skipTests : bool, optional
        SkipTests skips test manifest installation step (Helm's --skip-tests).
    valueFiles : [str], optional
        ValuesFiles is a list of Helm value files to use when generating a template
    values : str, optional
        Values specifies Helm values to be passed to helm template, typically defined as a block. ValuesObject takes precedence over Values, so use one or the other.
    valuesObject : any, optional
        ValuesObject specifies Helm values to be passed to helm template, defined as a map. This takes precedence over Values.
    version : str, optional
        Version is the Helm version to use for templating ("3")
    """
    apiVersions? : [str]
    fileParameters? : [ApplicationstatusatprovideroperationstatesyncresultsourcehelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatusatprovideroperationstatesyncresultsourcehelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcehelmFileparametersitem:
    """
    HelmFileParameter is a file parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    name : str, optional
        Name is the name of the Helm parameter
    path : str, optional
        Path is the path to the file containing the values for the Helm parameter
    """
    name? : str
    path? : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcehelmParametersitem:
    """
    HelmParameter is a parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    forceString : bool, optional
        ForceString determines whether to tell Helm to interpret booleans and numbers as strings
    name : str, optional
        Name is the name of the Helm parameter
    value : str, optional
        Value is the value for the Helm parameter
    """
    forceString? : bool
    name? : str
    value? : str

schema ApplicationstatusatprovideroperationstatesyncresultsourceKustomize:
    """
    Kustomize holds kustomize specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    commonAnnotations : {str:str}, optional
        CommonAnnotations is a list of additional annotations to add to rendered manifests
    commonAnnotationsEnvsubst : bool, optional
        CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for annotation values
    commonLabels : {str:str}, optional
        CommonLabels is a list of additional labels to add to rendered manifests
    components : [str], optional
        Components specifies a list of kustomize components to add to the kustomization before building
    forceCommonAnnotations : bool, optional
        ForceCommonAnnotations specifies whether to force applying common annotations to resources for Kustomize apps
    forceCommonLabels : bool, optional
        ForceCommonLabels specifies whether to force applying common labels to resources for Kustomize apps
    ignoreMissingComponents : bool, optional
        IgnoreMissingComponents prevents kustomize from failing when components do not exist locally by not appending them to kustomization file
    images : [str], optional
        Images is a list of Kustomize image override specifications
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    labelIncludeTemplates : bool, optional
        LabelIncludeTemplates specifies whether to apply common labels to resource templates or not
    labelWithoutSelector : bool, optional
        LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
    namePrefix : str, optional
        NamePrefix is a prefix appended to resources for Kustomize apps
    nameSuffix : str, optional
        NameSuffix is a suffix appended to resources for Kustomize apps
    namespace : str, optional
        Namespace sets the namespace that Kustomize adds to all resources
    patches : [ApplicationstatusatprovideroperationstatesyncresultsourcekustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatusatprovideroperationstatesyncresultsourcekustomizeReplicasitem], optional
        Replicas is a list of Kustomize Replicas override specifications
    version : str, optional
        Version controls which version of Kustomize to use for rendering manifests
    """
    apiVersions? : [str]
    commonAnnotations? : {str:str}
    commonAnnotationsEnvsubst? : bool
    commonLabels? : {str:str}
    components? : [str]
    forceCommonAnnotations? : bool
    forceCommonLabels? : bool
    ignoreMissingComponents? : bool
    images? : [str]
    kubeVersion? : str
    labelIncludeTemplates? : bool
    labelWithoutSelector? : bool
    namePrefix? : str
    nameSuffix? : str
    namespace? : str
    patches? : [ApplicationstatusatprovideroperationstatesyncresultsourcekustomizePatchesitem]
    replicas? : [ApplicationstatusatprovideroperationstatesyncresultsourcekustomizeReplicasitem]
    version? : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcekustomizePatchesitem:
    """
    KustomizePatch is a kustomize patch

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatusatprovideroperationstatesyncresultsourcekustomizepatchesitemTarget, optional
        KustomizeSelector is a selector of a Kustomize Patch
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatusatprovideroperationstatesyncresultsourcekustomizepatchesitemTarget

schema ApplicationstatusatprovideroperationstatesyncresultsourcekustomizepatchesitemTarget:
    """
    KustomizeSelector is a selector of a Kustomize Patch

    Attributes
    ----------
    annotationSelector : str, optional
        No description available.
    group : str, optional
        No description available.
    kind : str, optional
        No description available.
    labelSelector : str, optional
        No description available.
    name : str, optional
        No description available.
    namespace : str, optional
        No description available.
    version : str, optional
        No description available.
    """
    annotationSelector? : str
    group? : str
    kind? : str
    labelSelector? : str
    name? : str
    namespace? : str
    version? : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcekustomizeReplicasitem:
    """
    KustomizeReplica override specifications

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcePlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatusatprovideroperationstatesyncresultsourcepluginEnvitem], optional
        Env holds options specific to config management plugins
    name : str, optional
        No description available.
    parameters : [ApplicationstatusatprovideroperationstatesyncresultsourcepluginParametersitem], optional
        ApplicationSourcePluginParameters is a list of specific config management parameters
    """
    env? : [ApplicationstatusatprovideroperationstatesyncresultsourcepluginEnvitem]
    name? : str
    parameters? : [ApplicationstatusatprovideroperationstatesyncresultsourcepluginParametersitem]

schema ApplicationstatusatprovideroperationstatesyncresultsourcepluginEnvitem:
    """
    EnvEntry represents an entry in the application's environment

    Attributes
    ----------
    name : str, required
        Name is the name of the variable, usually expressed in uppercase
    value : str, required
        Value is the value of the variable
    """
    name : str
    value : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcepluginParametersitem:
    """
    ApplicationSourcePluginParameter holds options specific to config management parameters

    Attributes
    ----------
    array : [str], optional
        Array is the value of an array type parameter.
    map : {str:str}, optional
        Map is the value of a map type parameter.
    name : str, optional
        Name is the name identifying a parameter.
    string : str, optional
        String_ is the value of a string type parameter.
    """
    array? : [str]
    map? : {str:str}
    name? : str
    string? : str

schema ApplicationstatusatprovideroperationstatesyncresultSourcesitem:
    """
    ApplicationSource contains all required information about the source of an application

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatusatprovideroperationstatesyncresultsourcesitemDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatusatprovideroperationstatesyncresultsourcesitemHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatusatprovideroperationstatesyncresultsourcesitemKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is the name of the application source
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatusatprovideroperationstatesyncresultsourcesitemPlugin, optional
        Plugin holds config management plugin specific options
    ref : str, optional
        Ref is reference to another source within sources field. This field will not be used if used with a `source` tag.
    repoURL : str, required
        RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
    targetRevision : str, optional
        TargetRevision defines the revision of the source to sync the application to.
        In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
        In case of Helm, this is a semver tag for the Chart's version.
    """
    chart? : str
    directory? : ApplicationstatusatprovideroperationstatesyncresultsourcesitemDirectory
    helm? : ApplicationstatusatprovideroperationstatesyncresultsourcesitemHelm
    kustomize? : ApplicationstatusatprovideroperationstatesyncresultsourcesitemKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatusatprovideroperationstatesyncresultsourcesitemPlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcesitemDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatusatprovideroperationstatesyncresultsourcesitemdirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatusatprovideroperationstatesyncresultsourcesitemdirectoryJsonnet
    recurse? : bool

schema ApplicationstatusatprovideroperationstatesyncresultsourcesitemdirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatusatprovideroperationstatesyncresultsourcesitemdirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatusatprovideroperationstatesyncresultsourcesitemdirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatusatprovideroperationstatesyncresultsourcesitemdirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatusatprovideroperationstatesyncresultsourcesitemdirectoryjsonnetTlasitem]

schema ApplicationstatusatprovideroperationstatesyncresultsourcesitemdirectoryjsonnetExtvarsitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcesitemdirectoryjsonnetTlasitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcesitemHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatusatprovideroperationstatesyncresultsourcesitemhelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatusatprovideroperationstatesyncresultsourcesitemhelmParametersitem], optional
        Parameters is a list of Helm parameters which are passed to the helm template command upon manifest generation
    passCredentials : bool, optional
        PassCredentials pass credentials to all domains (Helm's --pass-credentials)
    releaseName : str, optional
        ReleaseName is the Helm release name to use. If omitted it will use the application name
    skipCrds : bool, optional
        SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
    skipSchemaValidation : bool, optional
        SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
    skipTests : bool, optional
        SkipTests skips test manifest installation step (Helm's --skip-tests).
    valueFiles : [str], optional
        ValuesFiles is a list of Helm value files to use when generating a template
    values : str, optional
        Values specifies Helm values to be passed to helm template, typically defined as a block. ValuesObject takes precedence over Values, so use one or the other.
    valuesObject : any, optional
        ValuesObject specifies Helm values to be passed to helm template, defined as a map. This takes precedence over Values.
    version : str, optional
        Version is the Helm version to use for templating ("3")
    """
    apiVersions? : [str]
    fileParameters? : [ApplicationstatusatprovideroperationstatesyncresultsourcesitemhelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatusatprovideroperationstatesyncresultsourcesitemhelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcesitemhelmFileparametersitem:
    """
    HelmFileParameter is a file parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    name : str, optional
        Name is the name of the Helm parameter
    path : str, optional
        Path is the path to the file containing the values for the Helm parameter
    """
    name? : str
    path? : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcesitemhelmParametersitem:
    """
    HelmParameter is a parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    forceString : bool, optional
        ForceString determines whether to tell Helm to interpret booleans and numbers as strings
    name : str, optional
        Name is the name of the Helm parameter
    value : str, optional
        Value is the value for the Helm parameter
    """
    forceString? : bool
    name? : str
    value? : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcesitemKustomize:
    """
    Kustomize holds kustomize specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    commonAnnotations : {str:str}, optional
        CommonAnnotations is a list of additional annotations to add to rendered manifests
    commonAnnotationsEnvsubst : bool, optional
        CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for annotation values
    commonLabels : {str:str}, optional
        CommonLabels is a list of additional labels to add to rendered manifests
    components : [str], optional
        Components specifies a list of kustomize components to add to the kustomization before building
    forceCommonAnnotations : bool, optional
        ForceCommonAnnotations specifies whether to force applying common annotations to resources for Kustomize apps
    forceCommonLabels : bool, optional
        ForceCommonLabels specifies whether to force applying common labels to resources for Kustomize apps
    ignoreMissingComponents : bool, optional
        IgnoreMissingComponents prevents kustomize from failing when components do not exist locally by not appending them to kustomization file
    images : [str], optional
        Images is a list of Kustomize image override specifications
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    labelIncludeTemplates : bool, optional
        LabelIncludeTemplates specifies whether to apply common labels to resource templates or not
    labelWithoutSelector : bool, optional
        LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
    namePrefix : str, optional
        NamePrefix is a prefix appended to resources for Kustomize apps
    nameSuffix : str, optional
        NameSuffix is a suffix appended to resources for Kustomize apps
    namespace : str, optional
        Namespace sets the namespace that Kustomize adds to all resources
    patches : [ApplicationstatusatprovideroperationstatesyncresultsourcesitemkustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatusatprovideroperationstatesyncresultsourcesitemkustomizeReplicasitem], optional
        Replicas is a list of Kustomize Replicas override specifications
    version : str, optional
        Version controls which version of Kustomize to use for rendering manifests
    """
    apiVersions? : [str]
    commonAnnotations? : {str:str}
    commonAnnotationsEnvsubst? : bool
    commonLabels? : {str:str}
    components? : [str]
    forceCommonAnnotations? : bool
    forceCommonLabels? : bool
    ignoreMissingComponents? : bool
    images? : [str]
    kubeVersion? : str
    labelIncludeTemplates? : bool
    labelWithoutSelector? : bool
    namePrefix? : str
    nameSuffix? : str
    namespace? : str
    patches? : [ApplicationstatusatprovideroperationstatesyncresultsourcesitemkustomizePatchesitem]
    replicas? : [ApplicationstatusatprovideroperationstatesyncresultsourcesitemkustomizeReplicasitem]
    version? : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcesitemkustomizePatchesitem:
    """
    KustomizePatch is a kustomize patch

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatusatprovideroperationstatesyncresultsourcesitemkustomizepatchesitemTarget, optional
        KustomizeSelector is a selector of a Kustomize Patch
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatusatprovideroperationstatesyncresultsourcesitemkustomizepatchesitemTarget

schema ApplicationstatusatprovideroperationstatesyncresultsourcesitemkustomizepatchesitemTarget:
    """
    KustomizeSelector is a selector of a Kustomize Patch

    Attributes
    ----------
    annotationSelector : str, optional
        No description available.
    group : str, optional
        No description available.
    kind : str, optional
        No description available.
    labelSelector : str, optional
        No description available.
    name : str, optional
        No description available.
    namespace : str, optional
        No description available.
    version : str, optional
        No description available.
    """
    annotationSelector? : str
    group? : str
    kind? : str
    labelSelector? : str
    name? : str
    namespace? : str
    version? : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcesitemkustomizeReplicasitem:
    """
    KustomizeReplica override specifications

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcesitemPlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatusatprovideroperationstatesyncresultsourcesitempluginEnvitem], optional
        Env holds options specific to config management plugins
    name : str, optional
        No description available.
    parameters : [ApplicationstatusatprovideroperationstatesyncresultsourcesitempluginParametersitem], optional
        ApplicationSourcePluginParameters is a list of specific config management parameters
    """
    env? : [ApplicationstatusatprovideroperationstatesyncresultsourcesitempluginEnvitem]
    name? : str
    parameters? : [ApplicationstatusatprovideroperationstatesyncresultsourcesitempluginParametersitem]

schema ApplicationstatusatprovideroperationstatesyncresultsourcesitempluginEnvitem:
    """
    EnvEntry represents an entry in the application's environment

    Attributes
    ----------
    name : str, required
        Name is the name of the variable, usually expressed in uppercase
    value : str, required
        Value is the value of the variable
    """
    name : str
    value : str

schema ApplicationstatusatprovideroperationstatesyncresultsourcesitempluginParametersitem:
    """
    ApplicationSourcePluginParameter holds options specific to config management parameters

    Attributes
    ----------
    array : [str], optional
        Array is the value of an array type parameter.
    map : {str:str}, optional
        Map is the value of a map type parameter.
    name : str, optional
        Name is the name identifying a parameter.
    string : str, optional
        String_ is the value of a string type parameter.
    """
    array? : [str]
    map? : {str:str}
    name? : str
    string? : str

schema ApplicationstatusatproviderResourcesitem:
    """
    ResourceStatus holds the current sync and health status of a resource

    Attributes
    ----------
    group : str, optional
        No description available.
    health : ApplicationstatusatproviderresourcesitemHealth, optional
        HealthStatus contains information about the currently observed health state of an application or resource
    hook : bool, optional
        No description available.
    kind : str, optional
        No description available.
    name : str, optional
        No description available.
    namespace : str, optional
        No description available.
    requiresDeletionConfirmation : bool, optional
        No description available.
    requiresPruning : bool, optional
        No description available.
    status : str, optional
        No description available.
    syncWave : int, optional
        No description available.
    version : str, optional
        No description available.
    """
    group? : str
    health? : ApplicationstatusatproviderresourcesitemHealth
    hook? : bool
    kind? : str
    name? : str
    namespace? : str
    requiresDeletionConfirmation? : bool
    requiresPruning? : bool
    status? : str
    syncWave? : int
    version? : str

schema ApplicationstatusatproviderresourcesitemHealth:
    """
    HealthStatus contains information about the currently observed health state of an application or resource

    Attributes
    ----------
    lastTransitionTime : str, optional
        LastTransitionTime is the time the HealthStatus was set or updated
    message : str, optional
        Message is a human-readable informational message describing the health status
    status : str, optional
        Status holds the status code of the application or resource
    """
    lastTransitionTime? : str
    message? : str
    status? : str

schema ApplicationstatusatproviderSummary:
    """
    Summary contains a list of URLs and container images used by this application

    Attributes
    ----------
    externalURLs : [str], optional
        ExternalURLs holds all external URLs of application child resources.
    images : [str], optional
        Images holds all images of application child resources.
    """
    externalURLs? : [str]
    images? : [str]

schema ApplicationstatusatproviderSync:
    """
    Sync contains information about the application's current sync status

    Attributes
    ----------
    comparedTo : ApplicationstatusatprovidersyncComparedto, optional
        ComparedTo contains information about what has been compared
    revision : str, optional
        Revision contains information about the revision the comparison has been performed to
    revisions : [str], optional
        Revisions contains information about the revisions of multiple sources the comparison has been performed to
    status : str, required
        Status is the sync state of the comparison
    """
    comparedTo? : ApplicationstatusatprovidersyncComparedto
    revision? : str
    revisions? : [str]
    status : str

schema ApplicationstatusatprovidersyncComparedto:
    """
    ComparedTo contains information about what has been compared

    Attributes
    ----------
    destination : ApplicationstatusatprovidersynccomparedtoDestination, required
        Destination is a reference to the application's destination used for comparison
    source : ApplicationstatusatprovidersynccomparedtoSource, optional
        Source is a reference to the application's source used for comparison
    sources : [ApplicationstatusatprovidersynccomparedtoSourcesitem], optional
        Sources is a reference to the application's multiple sources used for comparison
    """
    destination : ApplicationstatusatprovidersynccomparedtoDestination
    source? : ApplicationstatusatprovidersynccomparedtoSource
    sources? : [ApplicationstatusatprovidersynccomparedtoSourcesitem]

schema ApplicationstatusatprovidersynccomparedtoDestination:
    """
    Destination is a reference to the application's destination used for comparison

    Attributes
    ----------
    name : str, optional
        Name is an alternate way of specifying the target cluster by its symbolic name
    nameRef : ApplicationstatusatprovidersynccomparedtodestinationNameref, optional
        NameRef is a reference to a Cluster used to set Name
    nameSelector : ApplicationstatusatprovidersynccomparedtodestinationNameselector, optional
        NameSelector is a reference to a Cluster used to set Name
    namespace : str, optional
        Namespace specifies the target namespace for the application's resources.
        The namespace will only be set for namespace-scoped resources that have not set a value for .metadata.namespace
    server : str, optional
        Server specifies the URL of the target cluster and must be set to the Kubernetes control plane API
    serverRef : ApplicationstatusatprovidersynccomparedtodestinationServerref, optional
        ServerRef is a reference to Cluster used to set Server
    serverSelector : ApplicationstatusatprovidersynccomparedtodestinationServerselector, optional
        ServerSelector selects references to Cluster used to set Server
    """
    name? : str
    nameRef? : ApplicationstatusatprovidersynccomparedtodestinationNameref
    nameSelector? : ApplicationstatusatprovidersynccomparedtodestinationNameselector
    namespace? : str
    server? : str
    serverRef? : ApplicationstatusatprovidersynccomparedtodestinationServerref
    serverSelector? : ApplicationstatusatprovidersynccomparedtodestinationServerselector

schema ApplicationstatusatprovidersynccomparedtodestinationNameref:
    """
    NameRef is a reference to a Cluster used to set Name

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : ApplicationstatusatprovidersynccomparedtodestinationnamerefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : ApplicationstatusatprovidersynccomparedtodestinationnamerefPolicy

schema ApplicationstatusatprovidersynccomparedtodestinationnamerefPolicy:
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

schema ApplicationstatusatprovidersynccomparedtodestinationNameselector:
    """
    NameSelector is a reference to a Cluster used to set Name

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : ApplicationstatusatprovidersynccomparedtodestinationnameselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : ApplicationstatusatprovidersynccomparedtodestinationnameselectorPolicy

schema ApplicationstatusatprovidersynccomparedtodestinationnameselectorPolicy:
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

schema ApplicationstatusatprovidersynccomparedtodestinationServerref:
    """
    ServerRef is a reference to Cluster used to set Server

    Attributes
    ----------
    name : str, required
        Name of the referenced object.
    policy : ApplicationstatusatprovidersynccomparedtodestinationserverrefPolicy, optional
        Policies for referencing.
    """
    name : str
    policy? : ApplicationstatusatprovidersynccomparedtodestinationserverrefPolicy

schema ApplicationstatusatprovidersynccomparedtodestinationserverrefPolicy:
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

schema ApplicationstatusatprovidersynccomparedtodestinationServerselector:
    """
    ServerSelector selects references to Cluster used to set Server

    Attributes
    ----------
    matchControllerRef : bool, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : ApplicationstatusatprovidersynccomparedtodestinationserverselectorPolicy, optional
        Policies for selection.
    """
    matchControllerRef? : bool
    matchLabels? : {str:str}
    policy? : ApplicationstatusatprovidersynccomparedtodestinationserverselectorPolicy

schema ApplicationstatusatprovidersynccomparedtodestinationserverselectorPolicy:
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

schema ApplicationstatusatprovidersynccomparedtoSource:
    """
    Source is a reference to the application's source used for comparison

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatusatprovidersynccomparedtosourceDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatusatprovidersynccomparedtosourceHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatusatprovidersynccomparedtosourceKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is the name of the application source
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatusatprovidersynccomparedtosourcePlugin, optional
        Plugin holds config management plugin specific options
    ref : str, optional
        Ref is reference to another source within sources field. This field will not be used if used with a `source` tag.
    repoURL : str, required
        RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
    targetRevision : str, optional
        TargetRevision defines the revision of the source to sync the application to.
        In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
        In case of Helm, this is a semver tag for the Chart's version.
    """
    chart? : str
    directory? : ApplicationstatusatprovidersynccomparedtosourceDirectory
    helm? : ApplicationstatusatprovidersynccomparedtosourceHelm
    kustomize? : ApplicationstatusatprovidersynccomparedtosourceKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatusatprovidersynccomparedtosourcePlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatusatprovidersynccomparedtosourceDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatusatprovidersynccomparedtosourcedirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatusatprovidersynccomparedtosourcedirectoryJsonnet
    recurse? : bool

schema ApplicationstatusatprovidersynccomparedtosourcedirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatusatprovidersynccomparedtosourcedirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatusatprovidersynccomparedtosourcedirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatusatprovidersynccomparedtosourcedirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatusatprovidersynccomparedtosourcedirectoryjsonnetTlasitem]

schema ApplicationstatusatprovidersynccomparedtosourcedirectoryjsonnetExtvarsitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatprovidersynccomparedtosourcedirectoryjsonnetTlasitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatprovidersynccomparedtosourceHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatusatprovidersynccomparedtosourcehelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatusatprovidersynccomparedtosourcehelmParametersitem], optional
        Parameters is a list of Helm parameters which are passed to the helm template command upon manifest generation
    passCredentials : bool, optional
        PassCredentials pass credentials to all domains (Helm's --pass-credentials)
    releaseName : str, optional
        ReleaseName is the Helm release name to use. If omitted it will use the application name
    skipCrds : bool, optional
        SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
    skipSchemaValidation : bool, optional
        SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
    skipTests : bool, optional
        SkipTests skips test manifest installation step (Helm's --skip-tests).
    valueFiles : [str], optional
        ValuesFiles is a list of Helm value files to use when generating a template
    values : str, optional
        Values specifies Helm values to be passed to helm template, typically defined as a block. ValuesObject takes precedence over Values, so use one or the other.
    valuesObject : any, optional
        ValuesObject specifies Helm values to be passed to helm template, defined as a map. This takes precedence over Values.
    version : str, optional
        Version is the Helm version to use for templating ("3")
    """
    apiVersions? : [str]
    fileParameters? : [ApplicationstatusatprovidersynccomparedtosourcehelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatusatprovidersynccomparedtosourcehelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatusatprovidersynccomparedtosourcehelmFileparametersitem:
    """
    HelmFileParameter is a file parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    name : str, optional
        Name is the name of the Helm parameter
    path : str, optional
        Path is the path to the file containing the values for the Helm parameter
    """
    name? : str
    path? : str

schema ApplicationstatusatprovidersynccomparedtosourcehelmParametersitem:
    """
    HelmParameter is a parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    forceString : bool, optional
        ForceString determines whether to tell Helm to interpret booleans and numbers as strings
    name : str, optional
        Name is the name of the Helm parameter
    value : str, optional
        Value is the value for the Helm parameter
    """
    forceString? : bool
    name? : str
    value? : str

schema ApplicationstatusatprovidersynccomparedtosourceKustomize:
    """
    Kustomize holds kustomize specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    commonAnnotations : {str:str}, optional
        CommonAnnotations is a list of additional annotations to add to rendered manifests
    commonAnnotationsEnvsubst : bool, optional
        CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for annotation values
    commonLabels : {str:str}, optional
        CommonLabels is a list of additional labels to add to rendered manifests
    components : [str], optional
        Components specifies a list of kustomize components to add to the kustomization before building
    forceCommonAnnotations : bool, optional
        ForceCommonAnnotations specifies whether to force applying common annotations to resources for Kustomize apps
    forceCommonLabels : bool, optional
        ForceCommonLabels specifies whether to force applying common labels to resources for Kustomize apps
    ignoreMissingComponents : bool, optional
        IgnoreMissingComponents prevents kustomize from failing when components do not exist locally by not appending them to kustomization file
    images : [str], optional
        Images is a list of Kustomize image override specifications
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    labelIncludeTemplates : bool, optional
        LabelIncludeTemplates specifies whether to apply common labels to resource templates or not
    labelWithoutSelector : bool, optional
        LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
    namePrefix : str, optional
        NamePrefix is a prefix appended to resources for Kustomize apps
    nameSuffix : str, optional
        NameSuffix is a suffix appended to resources for Kustomize apps
    namespace : str, optional
        Namespace sets the namespace that Kustomize adds to all resources
    patches : [ApplicationstatusatprovidersynccomparedtosourcekustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatusatprovidersynccomparedtosourcekustomizeReplicasitem], optional
        Replicas is a list of Kustomize Replicas override specifications
    version : str, optional
        Version controls which version of Kustomize to use for rendering manifests
    """
    apiVersions? : [str]
    commonAnnotations? : {str:str}
    commonAnnotationsEnvsubst? : bool
    commonLabels? : {str:str}
    components? : [str]
    forceCommonAnnotations? : bool
    forceCommonLabels? : bool
    ignoreMissingComponents? : bool
    images? : [str]
    kubeVersion? : str
    labelIncludeTemplates? : bool
    labelWithoutSelector? : bool
    namePrefix? : str
    nameSuffix? : str
    namespace? : str
    patches? : [ApplicationstatusatprovidersynccomparedtosourcekustomizePatchesitem]
    replicas? : [ApplicationstatusatprovidersynccomparedtosourcekustomizeReplicasitem]
    version? : str

schema ApplicationstatusatprovidersynccomparedtosourcekustomizePatchesitem:
    """
    KustomizePatch is a kustomize patch

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatusatprovidersynccomparedtosourcekustomizepatchesitemTarget, optional
        KustomizeSelector is a selector of a Kustomize Patch
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatusatprovidersynccomparedtosourcekustomizepatchesitemTarget

schema ApplicationstatusatprovidersynccomparedtosourcekustomizepatchesitemTarget:
    """
    KustomizeSelector is a selector of a Kustomize Patch

    Attributes
    ----------
    annotationSelector : str, optional
        No description available.
    group : str, optional
        No description available.
    kind : str, optional
        No description available.
    labelSelector : str, optional
        No description available.
    name : str, optional
        No description available.
    namespace : str, optional
        No description available.
    version : str, optional
        No description available.
    """
    annotationSelector? : str
    group? : str
    kind? : str
    labelSelector? : str
    name? : str
    namespace? : str
    version? : str

schema ApplicationstatusatprovidersynccomparedtosourcekustomizeReplicasitem:
    """
    KustomizeReplica override specifications

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatusatprovidersynccomparedtosourcePlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatusatprovidersynccomparedtosourcepluginEnvitem], optional
        Env holds options specific to config management plugins
    name : str, optional
        No description available.
    parameters : [ApplicationstatusatprovidersynccomparedtosourcepluginParametersitem], optional
        ApplicationSourcePluginParameters is a list of specific config management parameters
    """
    env? : [ApplicationstatusatprovidersynccomparedtosourcepluginEnvitem]
    name? : str
    parameters? : [ApplicationstatusatprovidersynccomparedtosourcepluginParametersitem]

schema ApplicationstatusatprovidersynccomparedtosourcepluginEnvitem:
    """
    EnvEntry represents an entry in the application's environment

    Attributes
    ----------
    name : str, required
        Name is the name of the variable, usually expressed in uppercase
    value : str, required
        Value is the value of the variable
    """
    name : str
    value : str

schema ApplicationstatusatprovidersynccomparedtosourcepluginParametersitem:
    """
    ApplicationSourcePluginParameter holds options specific to config management parameters

    Attributes
    ----------
    array : [str], optional
        Array is the value of an array type parameter.
    map : {str:str}, optional
        Map is the value of a map type parameter.
    name : str, optional
        Name is the name identifying a parameter.
    string : str, optional
        String_ is the value of a string type parameter.
    """
    array? : [str]
    map? : {str:str}
    name? : str
    string? : str

schema ApplicationstatusatprovidersynccomparedtoSourcesitem:
    """
    ApplicationSource contains all required information about the source of an application

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatusatprovidersynccomparedtosourcesitemDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatusatprovidersynccomparedtosourcesitemHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatusatprovidersynccomparedtosourcesitemKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is the name of the application source
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatusatprovidersynccomparedtosourcesitemPlugin, optional
        Plugin holds config management plugin specific options
    ref : str, optional
        Ref is reference to another source within sources field. This field will not be used if used with a `source` tag.
    repoURL : str, required
        RepoURL is the URL to the repository (Git or Helm) that contains the application manifests
    targetRevision : str, optional
        TargetRevision defines the revision of the source to sync the application to.
        In case of Git, this can be commit, tag, or branch. If omitted, will equal to HEAD.
        In case of Helm, this is a semver tag for the Chart's version.
    """
    chart? : str
    directory? : ApplicationstatusatprovidersynccomparedtosourcesitemDirectory
    helm? : ApplicationstatusatprovidersynccomparedtosourcesitemHelm
    kustomize? : ApplicationstatusatprovidersynccomparedtosourcesitemKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatusatprovidersynccomparedtosourcesitemPlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatusatprovidersynccomparedtosourcesitemDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatusatprovidersynccomparedtosourcesitemdirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatusatprovidersynccomparedtosourcesitemdirectoryJsonnet
    recurse? : bool

schema ApplicationstatusatprovidersynccomparedtosourcesitemdirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatusatprovidersynccomparedtosourcesitemdirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatusatprovidersynccomparedtosourcesitemdirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatusatprovidersynccomparedtosourcesitemdirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatusatprovidersynccomparedtosourcesitemdirectoryjsonnetTlasitem]

schema ApplicationstatusatprovidersynccomparedtosourcesitemdirectoryjsonnetExtvarsitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatprovidersynccomparedtosourcesitemdirectoryjsonnetTlasitem:
    """
    JsonnetVar represents a variable to be passed to jsonnet during manifest generation

    Attributes
    ----------
    code : bool, optional
        No description available.
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    code? : bool
    name : str
    value : str

schema ApplicationstatusatprovidersynccomparedtosourcesitemHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatusatprovidersynccomparedtosourcesitemhelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatusatprovidersynccomparedtosourcesitemhelmParametersitem], optional
        Parameters is a list of Helm parameters which are passed to the helm template command upon manifest generation
    passCredentials : bool, optional
        PassCredentials pass credentials to all domains (Helm's --pass-credentials)
    releaseName : str, optional
        ReleaseName is the Helm release name to use. If omitted it will use the application name
    skipCrds : bool, optional
        SkipCrds skips custom resource definition installation step (Helm's --skip-crds)
    skipSchemaValidation : bool, optional
        SkipSchemaValidation skips JSON schema validation (Helm's --skip-schema-validation)
    skipTests : bool, optional
        SkipTests skips test manifest installation step (Helm's --skip-tests).
    valueFiles : [str], optional
        ValuesFiles is a list of Helm value files to use when generating a template
    values : str, optional
        Values specifies Helm values to be passed to helm template, typically defined as a block. ValuesObject takes precedence over Values, so use one or the other.
    valuesObject : any, optional
        ValuesObject specifies Helm values to be passed to helm template, defined as a map. This takes precedence over Values.
    version : str, optional
        Version is the Helm version to use for templating ("3")
    """
    apiVersions? : [str]
    fileParameters? : [ApplicationstatusatprovidersynccomparedtosourcesitemhelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatusatprovidersynccomparedtosourcesitemhelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatusatprovidersynccomparedtosourcesitemhelmFileparametersitem:
    """
    HelmFileParameter is a file parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    name : str, optional
        Name is the name of the Helm parameter
    path : str, optional
        Path is the path to the file containing the values for the Helm parameter
    """
    name? : str
    path? : str

schema ApplicationstatusatprovidersynccomparedtosourcesitemhelmParametersitem:
    """
    HelmParameter is a parameter that's passed to helm template during manifest generation

    Attributes
    ----------
    forceString : bool, optional
        ForceString determines whether to tell Helm to interpret booleans and numbers as strings
    name : str, optional
        Name is the name of the Helm parameter
    value : str, optional
        Value is the value for the Helm parameter
    """
    forceString? : bool
    name? : str
    value? : str

schema ApplicationstatusatprovidersynccomparedtosourcesitemKustomize:
    """
    Kustomize holds kustomize specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    commonAnnotations : {str:str}, optional
        CommonAnnotations is a list of additional annotations to add to rendered manifests
    commonAnnotationsEnvsubst : bool, optional
        CommonAnnotationsEnvsubst specifies whether to apply env variables substitution for annotation values
    commonLabels : {str:str}, optional
        CommonLabels is a list of additional labels to add to rendered manifests
    components : [str], optional
        Components specifies a list of kustomize components to add to the kustomization before building
    forceCommonAnnotations : bool, optional
        ForceCommonAnnotations specifies whether to force applying common annotations to resources for Kustomize apps
    forceCommonLabels : bool, optional
        ForceCommonLabels specifies whether to force applying common labels to resources for Kustomize apps
    ignoreMissingComponents : bool, optional
        IgnoreMissingComponents prevents kustomize from failing when components do not exist locally by not appending them to kustomization file
    images : [str], optional
        Images is a list of Kustomize image override specifications
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    labelIncludeTemplates : bool, optional
        LabelIncludeTemplates specifies whether to apply common labels to resource templates or not
    labelWithoutSelector : bool, optional
        LabelWithoutSelector specifies whether to apply common labels to resource selectors or not
    namePrefix : str, optional
        NamePrefix is a prefix appended to resources for Kustomize apps
    nameSuffix : str, optional
        NameSuffix is a suffix appended to resources for Kustomize apps
    namespace : str, optional
        Namespace sets the namespace that Kustomize adds to all resources
    patches : [ApplicationstatusatprovidersynccomparedtosourcesitemkustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatusatprovidersynccomparedtosourcesitemkustomizeReplicasitem], optional
        Replicas is a list of Kustomize Replicas override specifications
    version : str, optional
        Version controls which version of Kustomize to use for rendering manifests
    """
    apiVersions? : [str]
    commonAnnotations? : {str:str}
    commonAnnotationsEnvsubst? : bool
    commonLabels? : {str:str}
    components? : [str]
    forceCommonAnnotations? : bool
    forceCommonLabels? : bool
    ignoreMissingComponents? : bool
    images? : [str]
    kubeVersion? : str
    labelIncludeTemplates? : bool
    labelWithoutSelector? : bool
    namePrefix? : str
    nameSuffix? : str
    namespace? : str
    patches? : [ApplicationstatusatprovidersynccomparedtosourcesitemkustomizePatchesitem]
    replicas? : [ApplicationstatusatprovidersynccomparedtosourcesitemkustomizeReplicasitem]
    version? : str

schema ApplicationstatusatprovidersynccomparedtosourcesitemkustomizePatchesitem:
    """
    KustomizePatch is a kustomize patch

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatusatprovidersynccomparedtosourcesitemkustomizepatchesitemTarget, optional
        KustomizeSelector is a selector of a Kustomize Patch
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatusatprovidersynccomparedtosourcesitemkustomizepatchesitemTarget

schema ApplicationstatusatprovidersynccomparedtosourcesitemkustomizepatchesitemTarget:
    """
    KustomizeSelector is a selector of a Kustomize Patch

    Attributes
    ----------
    annotationSelector : str, optional
        No description available.
    group : str, optional
        No description available.
    kind : str, optional
        No description available.
    labelSelector : str, optional
        No description available.
    name : str, optional
        No description available.
    namespace : str, optional
        No description available.
    version : str, optional
        No description available.
    """
    annotationSelector? : str
    group? : str
    kind? : str
    labelSelector? : str
    name? : str
    namespace? : str
    version? : str

schema ApplicationstatusatprovidersynccomparedtosourcesitemkustomizeReplicasitem:
    """
    KustomizeReplica override specifications

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatusatprovidersynccomparedtosourcesitemPlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatusatprovidersynccomparedtosourcesitempluginEnvitem], optional
        Env holds options specific to config management plugins
    name : str, optional
        No description available.
    parameters : [ApplicationstatusatprovidersynccomparedtosourcesitempluginParametersitem], optional
        ApplicationSourcePluginParameters is a list of specific config management parameters
    """
    env? : [ApplicationstatusatprovidersynccomparedtosourcesitempluginEnvitem]
    name? : str
    parameters? : [ApplicationstatusatprovidersynccomparedtosourcesitempluginParametersitem]

schema ApplicationstatusatprovidersynccomparedtosourcesitempluginEnvitem:
    """
    EnvEntry represents an entry in the application's environment

    Attributes
    ----------
    name : str, required
        Name is the name of the variable, usually expressed in uppercase
    value : str, required
        Value is the value of the variable
    """
    name : str
    value : str

schema ApplicationstatusatprovidersynccomparedtosourcesitempluginParametersitem:
    """
    ApplicationSourcePluginParameter holds options specific to config management parameters

    Attributes
    ----------
    array : [str], optional
        Array is the value of an array type parameter.
    map : {str:str}, optional
        Map is the value of a map type parameter.
    name : str, optional
        Name is the name identifying a parameter.
    string : str, optional
        String_ is the value of a string type parameter.
    """
    array? : [str]
    map? : {str:str}
    name? : str
    string? : str

schema ApplicationstatusConditionsitem:
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