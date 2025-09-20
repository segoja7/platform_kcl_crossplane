"""
This file was generated automatically and is intended to be a KCL Schema
schema representation of a Kubernetes CRD.

It is based on the provided OpenAPI v2 JSON schema.

DO NOT EDIT MANUALLY.
"""

schema Application:
    """
    Application is a definition of Application resource.

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
    metadata : any, required
        No description available.
    operation : ApplicationOperation, optional
        Operation contains information about a requested or running operation
    spec : ApplicationSpec, required
        ApplicationSpec represents desired application state. Contains link to repository with application definition and additional parameters link definition revision.
    status : ApplicationStatus, optional
        ApplicationStatus contains status information for the application
    """
    apiVersion : str = "argoproj.io/v1alpha1"
    kind : str = "Application"
    metadata : any
    operation? : ApplicationOperation
    spec : ApplicationSpec
    status? : ApplicationStatus

schema ApplicationOperation:
    """
    Operation contains information about a requested or running operation

    Attributes
    ----------
    info : [ApplicationoperationInfoitem], optional
        Info is a list of informational items for this operation
    initiatedBy : ApplicationoperationInitiatedby, optional
        InitiatedBy contains information about who initiated the operations
    retry : ApplicationoperationRetry, optional
        Retry controls the strategy to apply if a sync fails
    sync : ApplicationoperationSync, optional
        Sync contains parameters for the operation
    """
    info? : [ApplicationoperationInfoitem]
    initiatedBy? : ApplicationoperationInitiatedby
    retry? : ApplicationoperationRetry
    sync? : ApplicationoperationSync

schema ApplicationoperationInfoitem:
    """
    ApplicationoperationInfoitem schema.

    Attributes
    ----------
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    name : str
    value : str

schema ApplicationoperationInitiatedby:
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

schema ApplicationoperationRetry:
    """
    Retry controls the strategy to apply if a sync fails

    Attributes
    ----------
    backoff : ApplicationoperationretryBackoff, optional
        Backoff controls how to backoff on subsequent retries of failed syncs
    limit : int, optional
        Limit is the maximum number of attempts for retrying a failed sync. If set to 0, no retries will be performed.
    """
    backoff? : ApplicationoperationretryBackoff
    limit? : int

schema ApplicationoperationretryBackoff:
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

schema ApplicationoperationSync:
    """
    Sync contains parameters for the operation

    Attributes
    ----------
    autoHealAttemptsCount : int, optional
        SelfHealAttemptsCount contains the number of auto-heal attempts
    dryRun : bool, optional
        DryRun specifies to perform a `kubectl apply --dry-run` without actually performing the sync
    manifests : [str], optional
        Manifests is an optional field that overrides sync source with a local directory for development
    prune : bool, optional
        Prune specifies to delete resources from the cluster that are no longer tracked in git
    resources : [ApplicationoperationsyncResourcesitem], optional
        Resources describes which resources shall be part of the sync
    revision : str, optional
        Revision is the revision (Git) or chart version (Helm) which to sync the application to
        If omitted, will use the revision specified in app spec.
    revisions : [str], optional
        Revisions is the list of revision (Git) or chart version (Helm) which to sync each source in sources field for the application to
        If omitted, will use the revision specified in app spec.
    source : ApplicationoperationsyncSource, optional
        Source overrides the source definition set in the application.
        This is typically set in a Rollback operation and is nil during a Sync operation
    sources : [ApplicationoperationsyncSourcesitem], optional
        Sources overrides the source definition set in the application.
        This is typically set in a Rollback operation and is nil during a Sync operation
    syncOptions : [str], optional
        SyncOptions provide per-sync sync-options, e.g. Validate=false
    syncStrategy : ApplicationoperationsyncSyncstrategy, optional
        SyncStrategy describes how to perform the sync
    """
    autoHealAttemptsCount? : int
    dryRun? : bool
    manifests? : [str]
    prune? : bool
    resources? : [ApplicationoperationsyncResourcesitem]
    revision? : str
    revisions? : [str]
    source? : ApplicationoperationsyncSource
    sources? : [ApplicationoperationsyncSourcesitem]
    syncOptions? : [str]
    syncStrategy? : ApplicationoperationsyncSyncstrategy

schema ApplicationoperationsyncResourcesitem:
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

schema ApplicationoperationsyncSource:
    """
    Source overrides the source definition set in the application.
    This is typically set in a Rollback operation and is nil during a Sync operation

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationoperationsyncsourceDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationoperationsyncsourceHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationoperationsyncsourceKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is used to refer to a source and is displayed in the UI. It is used in multi-source Applications.
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationoperationsyncsourcePlugin, optional
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
    directory? : ApplicationoperationsyncsourceDirectory
    helm? : ApplicationoperationsyncsourceHelm
    kustomize? : ApplicationoperationsyncsourceKustomize
    name? : str
    path? : str
    plugin? : ApplicationoperationsyncsourcePlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationoperationsyncsourceDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationoperationsyncsourcedirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationoperationsyncsourcedirectoryJsonnet
    recurse? : bool

schema ApplicationoperationsyncsourcedirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationoperationsyncsourcedirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationoperationsyncsourcedirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationoperationsyncsourcedirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationoperationsyncsourcedirectoryjsonnetTlasitem]

schema ApplicationoperationsyncsourcedirectoryjsonnetExtvarsitem:
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

schema ApplicationoperationsyncsourcedirectoryjsonnetTlasitem:
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

schema ApplicationoperationsyncsourceHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationoperationsyncsourcehelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationoperationsyncsourcehelmParametersitem], optional
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
    fileParameters? : [ApplicationoperationsyncsourcehelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationoperationsyncsourcehelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationoperationsyncsourcehelmFileparametersitem:
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

schema ApplicationoperationsyncsourcehelmParametersitem:
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

schema ApplicationoperationsyncsourceKustomize:
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
    patches : [ApplicationoperationsyncsourcekustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationoperationsyncsourcekustomizeReplicasitem], optional
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
    patches? : [ApplicationoperationsyncsourcekustomizePatchesitem]
    replicas? : [ApplicationoperationsyncsourcekustomizeReplicasitem]
    version? : str

schema ApplicationoperationsyncsourcekustomizePatchesitem:
    """
    ApplicationoperationsyncsourcekustomizePatchesitem schema.

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationoperationsyncsourcekustomizepatchesitemTarget, optional
        No description available.
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationoperationsyncsourcekustomizepatchesitemTarget

schema ApplicationoperationsyncsourcekustomizepatchesitemTarget:
    """
    ApplicationoperationsyncsourcekustomizepatchesitemTarget schema.

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

schema ApplicationoperationsyncsourcekustomizeReplicasitem:
    """
    ApplicationoperationsyncsourcekustomizeReplicasitem schema.

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationoperationsyncsourcePlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationoperationsyncsourcepluginEnvitem], optional
        Env is a list of environment variable entries
    name : str, optional
        No description available.
    parameters : [ApplicationoperationsyncsourcepluginParametersitem], optional
        No description available.
    """
    env? : [ApplicationoperationsyncsourcepluginEnvitem]
    name? : str
    parameters? : [ApplicationoperationsyncsourcepluginParametersitem]

schema ApplicationoperationsyncsourcepluginEnvitem:
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

schema ApplicationoperationsyncsourcepluginParametersitem:
    """
    ApplicationoperationsyncsourcepluginParametersitem schema.

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

schema ApplicationoperationsyncSourcesitem:
    """
    ApplicationSource contains all required information about the source of an application

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationoperationsyncsourcesitemDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationoperationsyncsourcesitemHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationoperationsyncsourcesitemKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is used to refer to a source and is displayed in the UI. It is used in multi-source Applications.
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationoperationsyncsourcesitemPlugin, optional
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
    directory? : ApplicationoperationsyncsourcesitemDirectory
    helm? : ApplicationoperationsyncsourcesitemHelm
    kustomize? : ApplicationoperationsyncsourcesitemKustomize
    name? : str
    path? : str
    plugin? : ApplicationoperationsyncsourcesitemPlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationoperationsyncsourcesitemDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationoperationsyncsourcesitemdirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationoperationsyncsourcesitemdirectoryJsonnet
    recurse? : bool

schema ApplicationoperationsyncsourcesitemdirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationoperationsyncsourcesitemdirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationoperationsyncsourcesitemdirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationoperationsyncsourcesitemdirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationoperationsyncsourcesitemdirectoryjsonnetTlasitem]

schema ApplicationoperationsyncsourcesitemdirectoryjsonnetExtvarsitem:
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

schema ApplicationoperationsyncsourcesitemdirectoryjsonnetTlasitem:
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

schema ApplicationoperationsyncsourcesitemHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationoperationsyncsourcesitemhelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationoperationsyncsourcesitemhelmParametersitem], optional
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
    fileParameters? : [ApplicationoperationsyncsourcesitemhelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationoperationsyncsourcesitemhelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationoperationsyncsourcesitemhelmFileparametersitem:
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

schema ApplicationoperationsyncsourcesitemhelmParametersitem:
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

schema ApplicationoperationsyncsourcesitemKustomize:
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
    patches : [ApplicationoperationsyncsourcesitemkustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationoperationsyncsourcesitemkustomizeReplicasitem], optional
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
    patches? : [ApplicationoperationsyncsourcesitemkustomizePatchesitem]
    replicas? : [ApplicationoperationsyncsourcesitemkustomizeReplicasitem]
    version? : str

schema ApplicationoperationsyncsourcesitemkustomizePatchesitem:
    """
    ApplicationoperationsyncsourcesitemkustomizePatchesitem schema.

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationoperationsyncsourcesitemkustomizepatchesitemTarget, optional
        No description available.
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationoperationsyncsourcesitemkustomizepatchesitemTarget

schema ApplicationoperationsyncsourcesitemkustomizepatchesitemTarget:
    """
    ApplicationoperationsyncsourcesitemkustomizepatchesitemTarget schema.

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

schema ApplicationoperationsyncsourcesitemkustomizeReplicasitem:
    """
    ApplicationoperationsyncsourcesitemkustomizeReplicasitem schema.

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationoperationsyncsourcesitemPlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationoperationsyncsourcesitempluginEnvitem], optional
        Env is a list of environment variable entries
    name : str, optional
        No description available.
    parameters : [ApplicationoperationsyncsourcesitempluginParametersitem], optional
        No description available.
    """
    env? : [ApplicationoperationsyncsourcesitempluginEnvitem]
    name? : str
    parameters? : [ApplicationoperationsyncsourcesitempluginParametersitem]

schema ApplicationoperationsyncsourcesitempluginEnvitem:
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

schema ApplicationoperationsyncsourcesitempluginParametersitem:
    """
    ApplicationoperationsyncsourcesitempluginParametersitem schema.

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

schema ApplicationoperationsyncSyncstrategy:
    """
    SyncStrategy describes how to perform the sync

    Attributes
    ----------
    apply : ApplicationoperationsyncsyncstrategyApply, optional
        Apply will perform a `kubectl apply` to perform the sync.
    hook : ApplicationoperationsyncsyncstrategyHook, optional
        Hook will submit any referenced resources to perform the sync. This is the default strategy
    """
    apply? : ApplicationoperationsyncsyncstrategyApply
    hook? : ApplicationoperationsyncsyncstrategyHook

schema ApplicationoperationsyncsyncstrategyApply:
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

schema ApplicationoperationsyncsyncstrategyHook:
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

schema ApplicationSpec:
    """
    ApplicationSpec represents desired application state. Contains link to repository with application definition and additional parameters link definition revision.

    Attributes
    ----------
    destination : ApplicationspecDestination, required
        Destination is a reference to the target Kubernetes server and namespace
    ignoreDifferences : [ApplicationspecIgnoredifferencesitem], optional
        IgnoreDifferences is a list of resources and their fields which should be ignored during comparison
    info : [ApplicationspecInfoitem], optional
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
    source : ApplicationspecSource, optional
        Source is a reference to the location of the application's manifests or chart
    sourceHydrator : ApplicationspecSourcehydrator, optional
        SourceHydrator provides a way to push hydrated manifests back to git before syncing them to the cluster.
    sources : [ApplicationspecSourcesitem], optional
        Sources is a reference to the location of the application's manifests or chart
    syncPolicy : ApplicationspecSyncpolicy, optional
        SyncPolicy controls when and how a sync will be performed
    """
    destination : ApplicationspecDestination
    ignoreDifferences? : [ApplicationspecIgnoredifferencesitem]
    info? : [ApplicationspecInfoitem]
    project : str
    revisionHistoryLimit? : int
    source? : ApplicationspecSource
    sourceHydrator? : ApplicationspecSourcehydrator
    sources? : [ApplicationspecSourcesitem]
    syncPolicy? : ApplicationspecSyncpolicy

schema ApplicationspecDestination:
    """
    Destination is a reference to the target Kubernetes server and namespace

    Attributes
    ----------
    name : str, optional
        Name is an alternate way of specifying the target cluster by its symbolic name. This must be set if Server is not set.
    namespace : str, optional
        Namespace specifies the target namespace for the application's resources.
        The namespace will only be set for namespace-scoped resources that have not set a value for .metadata.namespace
    server : str, optional
        Server specifies the URL of the target cluster's Kubernetes control plane API. This must be set if Name is not set.
    """
    name? : str
    namespace? : str
    server? : str

schema ApplicationspecIgnoredifferencesitem:
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

schema ApplicationspecInfoitem:
    """
    ApplicationspecInfoitem schema.

    Attributes
    ----------
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    name : str
    value : str

schema ApplicationspecSource:
    """
    Source is a reference to the location of the application's manifests or chart

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationspecsourceDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationspecsourceHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationspecsourceKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is used to refer to a source and is displayed in the UI. It is used in multi-source Applications.
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationspecsourcePlugin, optional
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
    directory? : ApplicationspecsourceDirectory
    helm? : ApplicationspecsourceHelm
    kustomize? : ApplicationspecsourceKustomize
    name? : str
    path? : str
    plugin? : ApplicationspecsourcePlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationspecsourceDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationspecsourcedirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationspecsourcedirectoryJsonnet
    recurse? : bool

schema ApplicationspecsourcedirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationspecsourcedirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationspecsourcedirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationspecsourcedirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationspecsourcedirectoryjsonnetTlasitem]

schema ApplicationspecsourcedirectoryjsonnetExtvarsitem:
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

schema ApplicationspecsourcedirectoryjsonnetTlasitem:
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

schema ApplicationspecsourceHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationspecsourcehelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationspecsourcehelmParametersitem], optional
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
    fileParameters? : [ApplicationspecsourcehelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationspecsourcehelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationspecsourcehelmFileparametersitem:
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

schema ApplicationspecsourcehelmParametersitem:
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

schema ApplicationspecsourceKustomize:
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
    patches : [ApplicationspecsourcekustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationspecsourcekustomizeReplicasitem], optional
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
    patches? : [ApplicationspecsourcekustomizePatchesitem]
    replicas? : [ApplicationspecsourcekustomizeReplicasitem]
    version? : str

schema ApplicationspecsourcekustomizePatchesitem:
    """
    ApplicationspecsourcekustomizePatchesitem schema.

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationspecsourcekustomizepatchesitemTarget, optional
        No description available.
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationspecsourcekustomizepatchesitemTarget

schema ApplicationspecsourcekustomizepatchesitemTarget:
    """
    ApplicationspecsourcekustomizepatchesitemTarget schema.

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

schema ApplicationspecsourcekustomizeReplicasitem:
    """
    ApplicationspecsourcekustomizeReplicasitem schema.

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationspecsourcePlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationspecsourcepluginEnvitem], optional
        Env is a list of environment variable entries
    name : str, optional
        No description available.
    parameters : [ApplicationspecsourcepluginParametersitem], optional
        No description available.
    """
    env? : [ApplicationspecsourcepluginEnvitem]
    name? : str
    parameters? : [ApplicationspecsourcepluginParametersitem]

schema ApplicationspecsourcepluginEnvitem:
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

schema ApplicationspecsourcepluginParametersitem:
    """
    ApplicationspecsourcepluginParametersitem schema.

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

schema ApplicationspecSourcehydrator:
    """
    SourceHydrator provides a way to push hydrated manifests back to git before syncing them to the cluster.

    Attributes
    ----------
    drySource : ApplicationspecsourcehydratorDrysource, required
        DrySource specifies where the dry "don't repeat yourself" manifest source lives.
    hydrateTo : ApplicationspecsourcehydratorHydrateto, optional
        HydrateTo specifies an optional "staging" location to push hydrated manifests to. An external system would then
        have to move manifests to the SyncSource, e.g. by pull request.
    syncSource : ApplicationspecsourcehydratorSyncsource, required
        SyncSource specifies where to sync hydrated manifests from.
    """
    drySource : ApplicationspecsourcehydratorDrysource
    hydrateTo? : ApplicationspecsourcehydratorHydrateto
    syncSource : ApplicationspecsourcehydratorSyncsource

schema ApplicationspecsourcehydratorDrysource:
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

schema ApplicationspecsourcehydratorHydrateto:
    """
    HydrateTo specifies an optional "staging" location to push hydrated manifests to. An external system would then
    have to move manifests to the SyncSource, e.g. by pull request.

    Attributes
    ----------
    targetBranch : str, required
        TargetBranch is the branch to which hydrated manifests should be committed
    """
    targetBranch : str

schema ApplicationspecsourcehydratorSyncsource:
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

schema ApplicationspecSourcesitem:
    """
    ApplicationSource contains all required information about the source of an application

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationspecsourcesitemDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationspecsourcesitemHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationspecsourcesitemKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is used to refer to a source and is displayed in the UI. It is used in multi-source Applications.
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationspecsourcesitemPlugin, optional
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
    directory? : ApplicationspecsourcesitemDirectory
    helm? : ApplicationspecsourcesitemHelm
    kustomize? : ApplicationspecsourcesitemKustomize
    name? : str
    path? : str
    plugin? : ApplicationspecsourcesitemPlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationspecsourcesitemDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationspecsourcesitemdirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationspecsourcesitemdirectoryJsonnet
    recurse? : bool

schema ApplicationspecsourcesitemdirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationspecsourcesitemdirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationspecsourcesitemdirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationspecsourcesitemdirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationspecsourcesitemdirectoryjsonnetTlasitem]

schema ApplicationspecsourcesitemdirectoryjsonnetExtvarsitem:
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

schema ApplicationspecsourcesitemdirectoryjsonnetTlasitem:
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

schema ApplicationspecsourcesitemHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationspecsourcesitemhelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationspecsourcesitemhelmParametersitem], optional
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
    fileParameters? : [ApplicationspecsourcesitemhelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationspecsourcesitemhelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationspecsourcesitemhelmFileparametersitem:
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

schema ApplicationspecsourcesitemhelmParametersitem:
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

schema ApplicationspecsourcesitemKustomize:
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
    patches : [ApplicationspecsourcesitemkustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationspecsourcesitemkustomizeReplicasitem], optional
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
    patches? : [ApplicationspecsourcesitemkustomizePatchesitem]
    replicas? : [ApplicationspecsourcesitemkustomizeReplicasitem]
    version? : str

schema ApplicationspecsourcesitemkustomizePatchesitem:
    """
    ApplicationspecsourcesitemkustomizePatchesitem schema.

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationspecsourcesitemkustomizepatchesitemTarget, optional
        No description available.
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationspecsourcesitemkustomizepatchesitemTarget

schema ApplicationspecsourcesitemkustomizepatchesitemTarget:
    """
    ApplicationspecsourcesitemkustomizepatchesitemTarget schema.

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

schema ApplicationspecsourcesitemkustomizeReplicasitem:
    """
    ApplicationspecsourcesitemkustomizeReplicasitem schema.

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationspecsourcesitemPlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationspecsourcesitempluginEnvitem], optional
        Env is a list of environment variable entries
    name : str, optional
        No description available.
    parameters : [ApplicationspecsourcesitempluginParametersitem], optional
        No description available.
    """
    env? : [ApplicationspecsourcesitempluginEnvitem]
    name? : str
    parameters? : [ApplicationspecsourcesitempluginParametersitem]

schema ApplicationspecsourcesitempluginEnvitem:
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

schema ApplicationspecsourcesitempluginParametersitem:
    """
    ApplicationspecsourcesitempluginParametersitem schema.

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

schema ApplicationspecSyncpolicy:
    """
    SyncPolicy controls when and how a sync will be performed

    Attributes
    ----------
    automated : ApplicationspecsyncpolicyAutomated, optional
        Automated will keep an application synced to the target revision
    managedNamespaceMetadata : ApplicationspecsyncpolicyManagednamespacemetadata, optional
        ManagedNamespaceMetadata controls metadata in the given namespace (if CreateNamespace=true)
    retry : ApplicationspecsyncpolicyRetry, optional
        Retry controls failed sync retry behavior
    syncOptions : [str], optional
        Options allow you to specify whole app sync-options
    """
    automated? : ApplicationspecsyncpolicyAutomated
    managedNamespaceMetadata? : ApplicationspecsyncpolicyManagednamespacemetadata
    retry? : ApplicationspecsyncpolicyRetry
    syncOptions? : [str]

schema ApplicationspecsyncpolicyAutomated:
    """
    Automated will keep an application synced to the target revision

    Attributes
    ----------
    allowEmpty : bool, optional
        AllowEmpty allows apps have zero live resources (default: false)
    enabled : bool, optional
        Enable allows apps to explicitly control automated sync
    prune : bool, optional
        Prune specifies whether to delete resources from the cluster that are not found in the sources anymore as part of automated sync (default: false)
    selfHeal : bool, optional
        SelfHeal specifies whether to revert resources back to their desired state upon modification in the cluster (default: false)
    """
    allowEmpty? : bool
    enabled? : bool
    prune? : bool
    selfHeal? : bool

schema ApplicationspecsyncpolicyManagednamespacemetadata:
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

schema ApplicationspecsyncpolicyRetry:
    """
    Retry controls failed sync retry behavior

    Attributes
    ----------
    backoff : ApplicationspecsyncpolicyretryBackoff, optional
        Backoff controls how to backoff on subsequent retries of failed syncs
    limit : int, optional
        Limit is the maximum number of attempts for retrying a failed sync. If set to 0, no retries will be performed.
    """
    backoff? : ApplicationspecsyncpolicyretryBackoff
    limit? : int

schema ApplicationspecsyncpolicyretryBackoff:
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

schema ApplicationStatus:
    """
    ApplicationStatus contains status information for the application

    Attributes
    ----------
    conditions : [ApplicationstatusConditionsitem], optional
        Conditions is a list of currently observed application conditions
    controllerNamespace : str, optional
        ControllerNamespace indicates the namespace in which the application controller is located
    health : ApplicationstatusHealth, optional
        Health contains information about the application's current health status
    history : [ApplicationstatusHistoryitem], optional
        History contains information about the application's sync history
    observedAt : str, optional
        ObservedAt indicates when the application state was updated without querying latest git state
        Deprecated: controller no longer updates ObservedAt field
    operationState : ApplicationstatusOperationstate, optional
        OperationState contains information about any ongoing operations, such as a sync
    reconciledAt : str, optional
        ReconciledAt indicates when the application state was reconciled using the latest git version
    resourceHealthSource : str, optional
        ResourceHealthSource indicates where the resource health status is stored: inline if not set or appTree
    resources : [ApplicationstatusResourcesitem], optional
        Resources is a list of Kubernetes resources managed by this application
    sourceHydrator : ApplicationstatusSourcehydrator, optional
        SourceHydrator stores information about the current state of source hydration
    sourceType : str, optional
        SourceType specifies the type of this application
    sourceTypes : [str], optional
        SourceTypes specifies the type of the sources included in the application
    summary : ApplicationstatusSummary, optional
        Summary contains a list of URLs and container images used by this application
    sync : ApplicationstatusSync, optional
        Sync contains information about the application's current sync status
    """
    conditions? : [ApplicationstatusConditionsitem]
    controllerNamespace? : str
    health? : ApplicationstatusHealth
    history? : [ApplicationstatusHistoryitem]
    observedAt? : str
    operationState? : ApplicationstatusOperationstate
    reconciledAt? : str
    resourceHealthSource? : str
    resources? : [ApplicationstatusResourcesitem]
    sourceHydrator? : ApplicationstatusSourcehydrator
    sourceType? : str
    sourceTypes? : [str]
    summary? : ApplicationstatusSummary
    sync? : ApplicationstatusSync

schema ApplicationstatusConditionsitem:
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

schema ApplicationstatusHealth:
    """
    Health contains information about the application's current health status

    Attributes
    ----------
    lastTransitionTime : str, optional
        LastTransitionTime is the time the HealthStatus was set or updated
    message : str, optional
        Message is a human-readable informational message describing the health status

        Deprecated: this field is not used and will be removed in a future release.
    status : str, optional
        Status holds the status code of the application
    """
    lastTransitionTime? : str
    message? : str
    status? : str

schema ApplicationstatusHistoryitem:
    """
    RevisionHistory contains history information about a previous sync

    Attributes
    ----------
    deployStartedAt : str, optional
        DeployStartedAt holds the time the sync operation started
    deployedAt : str, required
        DeployedAt holds the time the sync operation completed
    id : int, required
        ID is an auto incrementing identifier of the RevisionHistory
    initiatedBy : ApplicationstatushistoryitemInitiatedby, optional
        InitiatedBy contains information about who initiated the operations
    revision : str, optional
        Revision holds the revision the sync was performed against
    revisions : [str], optional
        Revisions holds the revision of each source in sources field the sync was performed against
    source : ApplicationstatushistoryitemSource, optional
        Source is a reference to the application source used for the sync operation
    sources : [ApplicationstatushistoryitemSourcesitem], optional
        Sources is a reference to the application sources used for the sync operation
    """
    deployStartedAt? : str
    deployedAt : str
    id : int
    initiatedBy? : ApplicationstatushistoryitemInitiatedby
    revision? : str
    revisions? : [str]
    source? : ApplicationstatushistoryitemSource
    sources? : [ApplicationstatushistoryitemSourcesitem]

schema ApplicationstatushistoryitemInitiatedby:
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

schema ApplicationstatushistoryitemSource:
    """
    Source is a reference to the application source used for the sync operation

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatushistoryitemsourceDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatushistoryitemsourceHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatushistoryitemsourceKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is used to refer to a source and is displayed in the UI. It is used in multi-source Applications.
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatushistoryitemsourcePlugin, optional
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
    directory? : ApplicationstatushistoryitemsourceDirectory
    helm? : ApplicationstatushistoryitemsourceHelm
    kustomize? : ApplicationstatushistoryitemsourceKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatushistoryitemsourcePlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatushistoryitemsourceDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatushistoryitemsourcedirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatushistoryitemsourcedirectoryJsonnet
    recurse? : bool

schema ApplicationstatushistoryitemsourcedirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatushistoryitemsourcedirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatushistoryitemsourcedirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatushistoryitemsourcedirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatushistoryitemsourcedirectoryjsonnetTlasitem]

schema ApplicationstatushistoryitemsourcedirectoryjsonnetExtvarsitem:
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

schema ApplicationstatushistoryitemsourcedirectoryjsonnetTlasitem:
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

schema ApplicationstatushistoryitemsourceHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatushistoryitemsourcehelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatushistoryitemsourcehelmParametersitem], optional
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
    fileParameters? : [ApplicationstatushistoryitemsourcehelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatushistoryitemsourcehelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatushistoryitemsourcehelmFileparametersitem:
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

schema ApplicationstatushistoryitemsourcehelmParametersitem:
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

schema ApplicationstatushistoryitemsourceKustomize:
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
    patches : [ApplicationstatushistoryitemsourcekustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatushistoryitemsourcekustomizeReplicasitem], optional
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
    patches? : [ApplicationstatushistoryitemsourcekustomizePatchesitem]
    replicas? : [ApplicationstatushistoryitemsourcekustomizeReplicasitem]
    version? : str

schema ApplicationstatushistoryitemsourcekustomizePatchesitem:
    """
    ApplicationstatushistoryitemsourcekustomizePatchesitem schema.

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatushistoryitemsourcekustomizepatchesitemTarget, optional
        No description available.
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatushistoryitemsourcekustomizepatchesitemTarget

schema ApplicationstatushistoryitemsourcekustomizepatchesitemTarget:
    """
    ApplicationstatushistoryitemsourcekustomizepatchesitemTarget schema.

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

schema ApplicationstatushistoryitemsourcekustomizeReplicasitem:
    """
    ApplicationstatushistoryitemsourcekustomizeReplicasitem schema.

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatushistoryitemsourcePlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatushistoryitemsourcepluginEnvitem], optional
        Env is a list of environment variable entries
    name : str, optional
        No description available.
    parameters : [ApplicationstatushistoryitemsourcepluginParametersitem], optional
        No description available.
    """
    env? : [ApplicationstatushistoryitemsourcepluginEnvitem]
    name? : str
    parameters? : [ApplicationstatushistoryitemsourcepluginParametersitem]

schema ApplicationstatushistoryitemsourcepluginEnvitem:
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

schema ApplicationstatushistoryitemsourcepluginParametersitem:
    """
    ApplicationstatushistoryitemsourcepluginParametersitem schema.

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

schema ApplicationstatushistoryitemSourcesitem:
    """
    ApplicationSource contains all required information about the source of an application

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatushistoryitemsourcesitemDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatushistoryitemsourcesitemHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatushistoryitemsourcesitemKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is used to refer to a source and is displayed in the UI. It is used in multi-source Applications.
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatushistoryitemsourcesitemPlugin, optional
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
    directory? : ApplicationstatushistoryitemsourcesitemDirectory
    helm? : ApplicationstatushistoryitemsourcesitemHelm
    kustomize? : ApplicationstatushistoryitemsourcesitemKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatushistoryitemsourcesitemPlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatushistoryitemsourcesitemDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatushistoryitemsourcesitemdirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatushistoryitemsourcesitemdirectoryJsonnet
    recurse? : bool

schema ApplicationstatushistoryitemsourcesitemdirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatushistoryitemsourcesitemdirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatushistoryitemsourcesitemdirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatushistoryitemsourcesitemdirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatushistoryitemsourcesitemdirectoryjsonnetTlasitem]

schema ApplicationstatushistoryitemsourcesitemdirectoryjsonnetExtvarsitem:
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

schema ApplicationstatushistoryitemsourcesitemdirectoryjsonnetTlasitem:
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

schema ApplicationstatushistoryitemsourcesitemHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatushistoryitemsourcesitemhelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatushistoryitemsourcesitemhelmParametersitem], optional
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
    fileParameters? : [ApplicationstatushistoryitemsourcesitemhelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatushistoryitemsourcesitemhelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatushistoryitemsourcesitemhelmFileparametersitem:
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

schema ApplicationstatushistoryitemsourcesitemhelmParametersitem:
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

schema ApplicationstatushistoryitemsourcesitemKustomize:
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
    patches : [ApplicationstatushistoryitemsourcesitemkustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatushistoryitemsourcesitemkustomizeReplicasitem], optional
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
    patches? : [ApplicationstatushistoryitemsourcesitemkustomizePatchesitem]
    replicas? : [ApplicationstatushistoryitemsourcesitemkustomizeReplicasitem]
    version? : str

schema ApplicationstatushistoryitemsourcesitemkustomizePatchesitem:
    """
    ApplicationstatushistoryitemsourcesitemkustomizePatchesitem schema.

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatushistoryitemsourcesitemkustomizepatchesitemTarget, optional
        No description available.
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatushistoryitemsourcesitemkustomizepatchesitemTarget

schema ApplicationstatushistoryitemsourcesitemkustomizepatchesitemTarget:
    """
    ApplicationstatushistoryitemsourcesitemkustomizepatchesitemTarget schema.

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

schema ApplicationstatushistoryitemsourcesitemkustomizeReplicasitem:
    """
    ApplicationstatushistoryitemsourcesitemkustomizeReplicasitem schema.

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatushistoryitemsourcesitemPlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatushistoryitemsourcesitempluginEnvitem], optional
        Env is a list of environment variable entries
    name : str, optional
        No description available.
    parameters : [ApplicationstatushistoryitemsourcesitempluginParametersitem], optional
        No description available.
    """
    env? : [ApplicationstatushistoryitemsourcesitempluginEnvitem]
    name? : str
    parameters? : [ApplicationstatushistoryitemsourcesitempluginParametersitem]

schema ApplicationstatushistoryitemsourcesitempluginEnvitem:
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

schema ApplicationstatushistoryitemsourcesitempluginParametersitem:
    """
    ApplicationstatushistoryitemsourcesitempluginParametersitem schema.

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

schema ApplicationstatusOperationstate:
    """
    OperationState contains information about any ongoing operations, such as a sync

    Attributes
    ----------
    finishedAt : str, optional
        FinishedAt contains time of operation completion
    message : str, optional
        Message holds any pertinent messages when attempting to perform operation (typically errors).
    operation : ApplicationstatusoperationstateOperation, required
        Operation is the original requested operation
    phase : str, required
        Phase is the current phase of the operation
    retryCount : int, optional
        RetryCount contains time of operation retries
    startedAt : str, required
        StartedAt contains time of operation start
    syncResult : ApplicationstatusoperationstateSyncresult, optional
        SyncResult is the result of a Sync operation
    """
    finishedAt? : str
    message? : str
    operation : ApplicationstatusoperationstateOperation
    phase : str
    retryCount? : int
    startedAt : str
    syncResult? : ApplicationstatusoperationstateSyncresult

schema ApplicationstatusoperationstateOperation:
    """
    Operation is the original requested operation

    Attributes
    ----------
    info : [ApplicationstatusoperationstateoperationInfoitem], optional
        Info is a list of informational items for this operation
    initiatedBy : ApplicationstatusoperationstateoperationInitiatedby, optional
        InitiatedBy contains information about who initiated the operations
    retry : ApplicationstatusoperationstateoperationRetry, optional
        Retry controls the strategy to apply if a sync fails
    sync : ApplicationstatusoperationstateoperationSync, optional
        Sync contains parameters for the operation
    """
    info? : [ApplicationstatusoperationstateoperationInfoitem]
    initiatedBy? : ApplicationstatusoperationstateoperationInitiatedby
    retry? : ApplicationstatusoperationstateoperationRetry
    sync? : ApplicationstatusoperationstateoperationSync

schema ApplicationstatusoperationstateoperationInfoitem:
    """
    ApplicationstatusoperationstateoperationInfoitem schema.

    Attributes
    ----------
    name : str, required
        No description available.
    value : str, required
        No description available.
    """
    name : str
    value : str

schema ApplicationstatusoperationstateoperationInitiatedby:
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

schema ApplicationstatusoperationstateoperationRetry:
    """
    Retry controls the strategy to apply if a sync fails

    Attributes
    ----------
    backoff : ApplicationstatusoperationstateoperationretryBackoff, optional
        Backoff controls how to backoff on subsequent retries of failed syncs
    limit : int, optional
        Limit is the maximum number of attempts for retrying a failed sync. If set to 0, no retries will be performed.
    """
    backoff? : ApplicationstatusoperationstateoperationretryBackoff
    limit? : int

schema ApplicationstatusoperationstateoperationretryBackoff:
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

schema ApplicationstatusoperationstateoperationSync:
    """
    Sync contains parameters for the operation

    Attributes
    ----------
    autoHealAttemptsCount : int, optional
        SelfHealAttemptsCount contains the number of auto-heal attempts
    dryRun : bool, optional
        DryRun specifies to perform a `kubectl apply --dry-run` without actually performing the sync
    manifests : [str], optional
        Manifests is an optional field that overrides sync source with a local directory for development
    prune : bool, optional
        Prune specifies to delete resources from the cluster that are no longer tracked in git
    resources : [ApplicationstatusoperationstateoperationsyncResourcesitem], optional
        Resources describes which resources shall be part of the sync
    revision : str, optional
        Revision is the revision (Git) or chart version (Helm) which to sync the application to
        If omitted, will use the revision specified in app spec.
    revisions : [str], optional
        Revisions is the list of revision (Git) or chart version (Helm) which to sync each source in sources field for the application to
        If omitted, will use the revision specified in app spec.
    source : ApplicationstatusoperationstateoperationsyncSource, optional
        Source overrides the source definition set in the application.
        This is typically set in a Rollback operation and is nil during a Sync operation
    sources : [ApplicationstatusoperationstateoperationsyncSourcesitem], optional
        Sources overrides the source definition set in the application.
        This is typically set in a Rollback operation and is nil during a Sync operation
    syncOptions : [str], optional
        SyncOptions provide per-sync sync-options, e.g. Validate=false
    syncStrategy : ApplicationstatusoperationstateoperationsyncSyncstrategy, optional
        SyncStrategy describes how to perform the sync
    """
    autoHealAttemptsCount? : int
    dryRun? : bool
    manifests? : [str]
    prune? : bool
    resources? : [ApplicationstatusoperationstateoperationsyncResourcesitem]
    revision? : str
    revisions? : [str]
    source? : ApplicationstatusoperationstateoperationsyncSource
    sources? : [ApplicationstatusoperationstateoperationsyncSourcesitem]
    syncOptions? : [str]
    syncStrategy? : ApplicationstatusoperationstateoperationsyncSyncstrategy

schema ApplicationstatusoperationstateoperationsyncResourcesitem:
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

schema ApplicationstatusoperationstateoperationsyncSource:
    """
    Source overrides the source definition set in the application.
    This is typically set in a Rollback operation and is nil during a Sync operation

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatusoperationstateoperationsyncsourceDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatusoperationstateoperationsyncsourceHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatusoperationstateoperationsyncsourceKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is used to refer to a source and is displayed in the UI. It is used in multi-source Applications.
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatusoperationstateoperationsyncsourcePlugin, optional
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
    directory? : ApplicationstatusoperationstateoperationsyncsourceDirectory
    helm? : ApplicationstatusoperationstateoperationsyncsourceHelm
    kustomize? : ApplicationstatusoperationstateoperationsyncsourceKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatusoperationstateoperationsyncsourcePlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatusoperationstateoperationsyncsourceDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatusoperationstateoperationsyncsourcedirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatusoperationstateoperationsyncsourcedirectoryJsonnet
    recurse? : bool

schema ApplicationstatusoperationstateoperationsyncsourcedirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatusoperationstateoperationsyncsourcedirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatusoperationstateoperationsyncsourcedirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatusoperationstateoperationsyncsourcedirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatusoperationstateoperationsyncsourcedirectoryjsonnetTlasitem]

schema ApplicationstatusoperationstateoperationsyncsourcedirectoryjsonnetExtvarsitem:
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

schema ApplicationstatusoperationstateoperationsyncsourcedirectoryjsonnetTlasitem:
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

schema ApplicationstatusoperationstateoperationsyncsourceHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatusoperationstateoperationsyncsourcehelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatusoperationstateoperationsyncsourcehelmParametersitem], optional
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
    fileParameters? : [ApplicationstatusoperationstateoperationsyncsourcehelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatusoperationstateoperationsyncsourcehelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatusoperationstateoperationsyncsourcehelmFileparametersitem:
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

schema ApplicationstatusoperationstateoperationsyncsourcehelmParametersitem:
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

schema ApplicationstatusoperationstateoperationsyncsourceKustomize:
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
    patches : [ApplicationstatusoperationstateoperationsyncsourcekustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatusoperationstateoperationsyncsourcekustomizeReplicasitem], optional
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
    patches? : [ApplicationstatusoperationstateoperationsyncsourcekustomizePatchesitem]
    replicas? : [ApplicationstatusoperationstateoperationsyncsourcekustomizeReplicasitem]
    version? : str

schema ApplicationstatusoperationstateoperationsyncsourcekustomizePatchesitem:
    """
    ApplicationstatusoperationstateoperationsyncsourcekustomizePatchesitem schema.

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatusoperationstateoperationsyncsourcekustomizepatchesitemTarget, optional
        No description available.
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatusoperationstateoperationsyncsourcekustomizepatchesitemTarget

schema ApplicationstatusoperationstateoperationsyncsourcekustomizepatchesitemTarget:
    """
    ApplicationstatusoperationstateoperationsyncsourcekustomizepatchesitemTarget schema.

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

schema ApplicationstatusoperationstateoperationsyncsourcekustomizeReplicasitem:
    """
    ApplicationstatusoperationstateoperationsyncsourcekustomizeReplicasitem schema.

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatusoperationstateoperationsyncsourcePlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatusoperationstateoperationsyncsourcepluginEnvitem], optional
        Env is a list of environment variable entries
    name : str, optional
        No description available.
    parameters : [ApplicationstatusoperationstateoperationsyncsourcepluginParametersitem], optional
        No description available.
    """
    env? : [ApplicationstatusoperationstateoperationsyncsourcepluginEnvitem]
    name? : str
    parameters? : [ApplicationstatusoperationstateoperationsyncsourcepluginParametersitem]

schema ApplicationstatusoperationstateoperationsyncsourcepluginEnvitem:
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

schema ApplicationstatusoperationstateoperationsyncsourcepluginParametersitem:
    """
    ApplicationstatusoperationstateoperationsyncsourcepluginParametersitem schema.

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

schema ApplicationstatusoperationstateoperationsyncSourcesitem:
    """
    ApplicationSource contains all required information about the source of an application

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatusoperationstateoperationsyncsourcesitemDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatusoperationstateoperationsyncsourcesitemHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatusoperationstateoperationsyncsourcesitemKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is used to refer to a source and is displayed in the UI. It is used in multi-source Applications.
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatusoperationstateoperationsyncsourcesitemPlugin, optional
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
    directory? : ApplicationstatusoperationstateoperationsyncsourcesitemDirectory
    helm? : ApplicationstatusoperationstateoperationsyncsourcesitemHelm
    kustomize? : ApplicationstatusoperationstateoperationsyncsourcesitemKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatusoperationstateoperationsyncsourcesitemPlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatusoperationstateoperationsyncsourcesitemDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatusoperationstateoperationsyncsourcesitemdirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatusoperationstateoperationsyncsourcesitemdirectoryJsonnet
    recurse? : bool

schema ApplicationstatusoperationstateoperationsyncsourcesitemdirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatusoperationstateoperationsyncsourcesitemdirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatusoperationstateoperationsyncsourcesitemdirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatusoperationstateoperationsyncsourcesitemdirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatusoperationstateoperationsyncsourcesitemdirectoryjsonnetTlasitem]

schema ApplicationstatusoperationstateoperationsyncsourcesitemdirectoryjsonnetExtvarsitem:
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

schema ApplicationstatusoperationstateoperationsyncsourcesitemdirectoryjsonnetTlasitem:
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

schema ApplicationstatusoperationstateoperationsyncsourcesitemHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatusoperationstateoperationsyncsourcesitemhelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatusoperationstateoperationsyncsourcesitemhelmParametersitem], optional
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
    fileParameters? : [ApplicationstatusoperationstateoperationsyncsourcesitemhelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatusoperationstateoperationsyncsourcesitemhelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatusoperationstateoperationsyncsourcesitemhelmFileparametersitem:
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

schema ApplicationstatusoperationstateoperationsyncsourcesitemhelmParametersitem:
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

schema ApplicationstatusoperationstateoperationsyncsourcesitemKustomize:
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
    patches : [ApplicationstatusoperationstateoperationsyncsourcesitemkustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatusoperationstateoperationsyncsourcesitemkustomizeReplicasitem], optional
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
    patches? : [ApplicationstatusoperationstateoperationsyncsourcesitemkustomizePatchesitem]
    replicas? : [ApplicationstatusoperationstateoperationsyncsourcesitemkustomizeReplicasitem]
    version? : str

schema ApplicationstatusoperationstateoperationsyncsourcesitemkustomizePatchesitem:
    """
    ApplicationstatusoperationstateoperationsyncsourcesitemkustomizePatchesitem schema.

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatusoperationstateoperationsyncsourcesitemkustomizepatchesitemTarget, optional
        No description available.
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatusoperationstateoperationsyncsourcesitemkustomizepatchesitemTarget

schema ApplicationstatusoperationstateoperationsyncsourcesitemkustomizepatchesitemTarget:
    """
    ApplicationstatusoperationstateoperationsyncsourcesitemkustomizepatchesitemTarget schema.

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

schema ApplicationstatusoperationstateoperationsyncsourcesitemkustomizeReplicasitem:
    """
    ApplicationstatusoperationstateoperationsyncsourcesitemkustomizeReplicasitem schema.

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatusoperationstateoperationsyncsourcesitemPlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatusoperationstateoperationsyncsourcesitempluginEnvitem], optional
        Env is a list of environment variable entries
    name : str, optional
        No description available.
    parameters : [ApplicationstatusoperationstateoperationsyncsourcesitempluginParametersitem], optional
        No description available.
    """
    env? : [ApplicationstatusoperationstateoperationsyncsourcesitempluginEnvitem]
    name? : str
    parameters? : [ApplicationstatusoperationstateoperationsyncsourcesitempluginParametersitem]

schema ApplicationstatusoperationstateoperationsyncsourcesitempluginEnvitem:
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

schema ApplicationstatusoperationstateoperationsyncsourcesitempluginParametersitem:
    """
    ApplicationstatusoperationstateoperationsyncsourcesitempluginParametersitem schema.

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

schema ApplicationstatusoperationstateoperationsyncSyncstrategy:
    """
    SyncStrategy describes how to perform the sync

    Attributes
    ----------
    apply : ApplicationstatusoperationstateoperationsyncsyncstrategyApply, optional
        Apply will perform a `kubectl apply` to perform the sync.
    hook : ApplicationstatusoperationstateoperationsyncsyncstrategyHook, optional
        Hook will submit any referenced resources to perform the sync. This is the default strategy
    """
    apply? : ApplicationstatusoperationstateoperationsyncsyncstrategyApply
    hook? : ApplicationstatusoperationstateoperationsyncsyncstrategyHook

schema ApplicationstatusoperationstateoperationsyncsyncstrategyApply:
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

schema ApplicationstatusoperationstateoperationsyncsyncstrategyHook:
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

schema ApplicationstatusoperationstateSyncresult:
    """
    SyncResult is the result of a Sync operation

    Attributes
    ----------
    managedNamespaceMetadata : ApplicationstatusoperationstatesyncresultManagednamespacemetadata, optional
        ManagedNamespaceMetadata contains the current sync state of managed namespace metadata
    resources : [ApplicationstatusoperationstatesyncresultResourcesitem], optional
        Resources contains a list of sync result items for each individual resource in a sync operation
    revision : str, required
        Revision holds the revision this sync operation was performed to
    revisions : [str], optional
        Revisions holds the revision this sync operation was performed for respective indexed source in sources field
    source : ApplicationstatusoperationstatesyncresultSource, optional
        Source records the application source information of the sync, used for comparing auto-sync
    sources : [ApplicationstatusoperationstatesyncresultSourcesitem], optional
        Source records the application source information of the sync, used for comparing auto-sync
    """
    managedNamespaceMetadata? : ApplicationstatusoperationstatesyncresultManagednamespacemetadata
    resources? : [ApplicationstatusoperationstatesyncresultResourcesitem]
    revision : str
    revisions? : [str]
    source? : ApplicationstatusoperationstatesyncresultSource
    sources? : [ApplicationstatusoperationstatesyncresultSourcesitem]

schema ApplicationstatusoperationstatesyncresultManagednamespacemetadata:
    """
    ManagedNamespaceMetadata contains the current sync state of managed namespace metadata

    Attributes
    ----------
    annotations : {str:str}, optional
        No description available.
    labels : {str:str}, optional
        No description available.
    """
    annotations? : {str:str}
    labels? : {str:str}

schema ApplicationstatusoperationstatesyncresultResourcesitem:
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
    images : [str], optional
        Images contains the images related to the ResourceResult
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
    images? : [str]
    kind : str
    message? : str
    name : str
    namespace : str
    status? : str
    syncPhase? : str
    version : str

schema ApplicationstatusoperationstatesyncresultSource:
    """
    Source records the application source information of the sync, used for comparing auto-sync

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatusoperationstatesyncresultsourceDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatusoperationstatesyncresultsourceHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatusoperationstatesyncresultsourceKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is used to refer to a source and is displayed in the UI. It is used in multi-source Applications.
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatusoperationstatesyncresultsourcePlugin, optional
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
    directory? : ApplicationstatusoperationstatesyncresultsourceDirectory
    helm? : ApplicationstatusoperationstatesyncresultsourceHelm
    kustomize? : ApplicationstatusoperationstatesyncresultsourceKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatusoperationstatesyncresultsourcePlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatusoperationstatesyncresultsourceDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatusoperationstatesyncresultsourcedirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatusoperationstatesyncresultsourcedirectoryJsonnet
    recurse? : bool

schema ApplicationstatusoperationstatesyncresultsourcedirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatusoperationstatesyncresultsourcedirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatusoperationstatesyncresultsourcedirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatusoperationstatesyncresultsourcedirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatusoperationstatesyncresultsourcedirectoryjsonnetTlasitem]

schema ApplicationstatusoperationstatesyncresultsourcedirectoryjsonnetExtvarsitem:
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

schema ApplicationstatusoperationstatesyncresultsourcedirectoryjsonnetTlasitem:
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

schema ApplicationstatusoperationstatesyncresultsourceHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatusoperationstatesyncresultsourcehelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatusoperationstatesyncresultsourcehelmParametersitem], optional
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
    fileParameters? : [ApplicationstatusoperationstatesyncresultsourcehelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatusoperationstatesyncresultsourcehelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatusoperationstatesyncresultsourcehelmFileparametersitem:
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

schema ApplicationstatusoperationstatesyncresultsourcehelmParametersitem:
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

schema ApplicationstatusoperationstatesyncresultsourceKustomize:
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
    patches : [ApplicationstatusoperationstatesyncresultsourcekustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatusoperationstatesyncresultsourcekustomizeReplicasitem], optional
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
    patches? : [ApplicationstatusoperationstatesyncresultsourcekustomizePatchesitem]
    replicas? : [ApplicationstatusoperationstatesyncresultsourcekustomizeReplicasitem]
    version? : str

schema ApplicationstatusoperationstatesyncresultsourcekustomizePatchesitem:
    """
    ApplicationstatusoperationstatesyncresultsourcekustomizePatchesitem schema.

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatusoperationstatesyncresultsourcekustomizepatchesitemTarget, optional
        No description available.
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatusoperationstatesyncresultsourcekustomizepatchesitemTarget

schema ApplicationstatusoperationstatesyncresultsourcekustomizepatchesitemTarget:
    """
    ApplicationstatusoperationstatesyncresultsourcekustomizepatchesitemTarget schema.

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

schema ApplicationstatusoperationstatesyncresultsourcekustomizeReplicasitem:
    """
    ApplicationstatusoperationstatesyncresultsourcekustomizeReplicasitem schema.

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatusoperationstatesyncresultsourcePlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatusoperationstatesyncresultsourcepluginEnvitem], optional
        Env is a list of environment variable entries
    name : str, optional
        No description available.
    parameters : [ApplicationstatusoperationstatesyncresultsourcepluginParametersitem], optional
        No description available.
    """
    env? : [ApplicationstatusoperationstatesyncresultsourcepluginEnvitem]
    name? : str
    parameters? : [ApplicationstatusoperationstatesyncresultsourcepluginParametersitem]

schema ApplicationstatusoperationstatesyncresultsourcepluginEnvitem:
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

schema ApplicationstatusoperationstatesyncresultsourcepluginParametersitem:
    """
    ApplicationstatusoperationstatesyncresultsourcepluginParametersitem schema.

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

schema ApplicationstatusoperationstatesyncresultSourcesitem:
    """
    ApplicationSource contains all required information about the source of an application

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatusoperationstatesyncresultsourcesitemDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatusoperationstatesyncresultsourcesitemHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatusoperationstatesyncresultsourcesitemKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is used to refer to a source and is displayed in the UI. It is used in multi-source Applications.
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatusoperationstatesyncresultsourcesitemPlugin, optional
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
    directory? : ApplicationstatusoperationstatesyncresultsourcesitemDirectory
    helm? : ApplicationstatusoperationstatesyncresultsourcesitemHelm
    kustomize? : ApplicationstatusoperationstatesyncresultsourcesitemKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatusoperationstatesyncresultsourcesitemPlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatusoperationstatesyncresultsourcesitemDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatusoperationstatesyncresultsourcesitemdirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatusoperationstatesyncresultsourcesitemdirectoryJsonnet
    recurse? : bool

schema ApplicationstatusoperationstatesyncresultsourcesitemdirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatusoperationstatesyncresultsourcesitemdirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatusoperationstatesyncresultsourcesitemdirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatusoperationstatesyncresultsourcesitemdirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatusoperationstatesyncresultsourcesitemdirectoryjsonnetTlasitem]

schema ApplicationstatusoperationstatesyncresultsourcesitemdirectoryjsonnetExtvarsitem:
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

schema ApplicationstatusoperationstatesyncresultsourcesitemdirectoryjsonnetTlasitem:
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

schema ApplicationstatusoperationstatesyncresultsourcesitemHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatusoperationstatesyncresultsourcesitemhelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatusoperationstatesyncresultsourcesitemhelmParametersitem], optional
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
    fileParameters? : [ApplicationstatusoperationstatesyncresultsourcesitemhelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatusoperationstatesyncresultsourcesitemhelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatusoperationstatesyncresultsourcesitemhelmFileparametersitem:
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

schema ApplicationstatusoperationstatesyncresultsourcesitemhelmParametersitem:
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

schema ApplicationstatusoperationstatesyncresultsourcesitemKustomize:
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
    patches : [ApplicationstatusoperationstatesyncresultsourcesitemkustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatusoperationstatesyncresultsourcesitemkustomizeReplicasitem], optional
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
    patches? : [ApplicationstatusoperationstatesyncresultsourcesitemkustomizePatchesitem]
    replicas? : [ApplicationstatusoperationstatesyncresultsourcesitemkustomizeReplicasitem]
    version? : str

schema ApplicationstatusoperationstatesyncresultsourcesitemkustomizePatchesitem:
    """
    ApplicationstatusoperationstatesyncresultsourcesitemkustomizePatchesitem schema.

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatusoperationstatesyncresultsourcesitemkustomizepatchesitemTarget, optional
        No description available.
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatusoperationstatesyncresultsourcesitemkustomizepatchesitemTarget

schema ApplicationstatusoperationstatesyncresultsourcesitemkustomizepatchesitemTarget:
    """
    ApplicationstatusoperationstatesyncresultsourcesitemkustomizepatchesitemTarget schema.

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

schema ApplicationstatusoperationstatesyncresultsourcesitemkustomizeReplicasitem:
    """
    ApplicationstatusoperationstatesyncresultsourcesitemkustomizeReplicasitem schema.

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatusoperationstatesyncresultsourcesitemPlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatusoperationstatesyncresultsourcesitempluginEnvitem], optional
        Env is a list of environment variable entries
    name : str, optional
        No description available.
    parameters : [ApplicationstatusoperationstatesyncresultsourcesitempluginParametersitem], optional
        No description available.
    """
    env? : [ApplicationstatusoperationstatesyncresultsourcesitempluginEnvitem]
    name? : str
    parameters? : [ApplicationstatusoperationstatesyncresultsourcesitempluginParametersitem]

schema ApplicationstatusoperationstatesyncresultsourcesitempluginEnvitem:
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

schema ApplicationstatusoperationstatesyncresultsourcesitempluginParametersitem:
    """
    ApplicationstatusoperationstatesyncresultsourcesitempluginParametersitem schema.

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

schema ApplicationstatusResourcesitem:
    """
    ResourceStatus holds the current synchronization and health status of a Kubernetes resource.

    Attributes
    ----------
    group : str, optional
        Group represents the API group of the resource (e.g., "apps" for Deployments).
    health : ApplicationstatusresourcesitemHealth, optional
        Health indicates the health status of the resource (e.g., Healthy, Degraded, Progressing).
    hook : bool, optional
        Hook is true if the resource is used as a lifecycle hook in an Argo CD application.
    kind : str, optional
        Kind specifies the type of the resource (e.g., "Deployment", "Service").
    name : str, optional
        Name is the unique name of the resource within the namespace.
    namespace : str, optional
        Namespace defines the Kubernetes namespace where the resource is located.
    requiresDeletionConfirmation : bool, optional
        RequiresDeletionConfirmation is true if the resource requires explicit user confirmation before deletion.
    requiresPruning : bool, optional
        RequiresPruning is true if the resource needs to be pruned (deleted) as part of synchronization.
    status : str, optional
        Status represents the synchronization state of the resource (e.g., Synced, OutOfSync).
    syncWave : int, optional
        SyncWave determines the order in which resources are applied during a sync operation.
        Lower values are applied first.
    version : str, optional
        Version indicates the API version of the resource (e.g., "v1", "v1beta1").
    """
    group? : str
    health? : ApplicationstatusresourcesitemHealth
    hook? : bool
    kind? : str
    name? : str
    namespace? : str
    requiresDeletionConfirmation? : bool
    requiresPruning? : bool
    status? : str
    syncWave? : int
    version? : str

schema ApplicationstatusresourcesitemHealth:
    """
    Health indicates the health status of the resource (e.g., Healthy, Degraded, Progressing).

    Attributes
    ----------
    lastTransitionTime : str, optional
        LastTransitionTime is the time the HealthStatus was set or updated

        Deprecated: this field is not used and will be removed in a future release.
    message : str, optional
        Message is a human-readable informational message describing the health status
    status : str, optional
        Status holds the status code of the resource
    """
    lastTransitionTime? : str
    message? : str
    status? : str

schema ApplicationstatusSourcehydrator:
    """
    SourceHydrator stores information about the current state of source hydration

    Attributes
    ----------
    currentOperation : ApplicationstatussourcehydratorCurrentoperation, optional
        CurrentOperation holds the status of the hydrate operation
    lastSuccessfulOperation : ApplicationstatussourcehydratorLastsuccessfuloperation, optional
        LastSuccessfulOperation holds info about the most recent successful hydration
    """
    currentOperation? : ApplicationstatussourcehydratorCurrentoperation
    lastSuccessfulOperation? : ApplicationstatussourcehydratorLastsuccessfuloperation

schema ApplicationstatussourcehydratorCurrentoperation:
    """
    CurrentOperation holds the status of the hydrate operation

    Attributes
    ----------
    drySHA : str, optional
        DrySHA holds the resolved revision (sha) of the dry source as of the most recent reconciliation
    finishedAt : str, optional
        FinishedAt indicates when the hydrate operation finished
    hydratedSHA : str, optional
        HydratedSHA holds the resolved revision (sha) of the hydrated source as of the most recent reconciliation
    message : str, required
        Message contains a message describing the current status of the hydrate operation
    phase : "Hydrating" | "Failed" | "Hydrated", required
        Phase indicates the status of the hydrate operation
    sourceHydrator : ApplicationstatussourcehydratorcurrentoperationSourcehydrator, optional
        SourceHydrator holds the hydrator config used for the hydrate operation
    startedAt : str, optional
        StartedAt indicates when the hydrate operation started
    """
    drySHA? : str
    finishedAt? : str
    hydratedSHA? : str
    message : str
    phase : "Hydrating" | "Failed" | "Hydrated"
    sourceHydrator? : ApplicationstatussourcehydratorcurrentoperationSourcehydrator
    startedAt? : str

schema ApplicationstatussourcehydratorcurrentoperationSourcehydrator:
    """
    SourceHydrator holds the hydrator config used for the hydrate operation

    Attributes
    ----------
    drySource : ApplicationstatussourcehydratorcurrentoperationsourcehydratorDrysource, required
        DrySource specifies where the dry "don't repeat yourself" manifest source lives.
    hydrateTo : ApplicationstatussourcehydratorcurrentoperationsourcehydratorHydrateto, optional
        HydrateTo specifies an optional "staging" location to push hydrated manifests to. An external system would then
        have to move manifests to the SyncSource, e.g. by pull request.
    syncSource : ApplicationstatussourcehydratorcurrentoperationsourcehydratorSyncsource, required
        SyncSource specifies where to sync hydrated manifests from.
    """
    drySource : ApplicationstatussourcehydratorcurrentoperationsourcehydratorDrysource
    hydrateTo? : ApplicationstatussourcehydratorcurrentoperationsourcehydratorHydrateto
    syncSource : ApplicationstatussourcehydratorcurrentoperationsourcehydratorSyncsource

schema ApplicationstatussourcehydratorcurrentoperationsourcehydratorDrysource:
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

schema ApplicationstatussourcehydratorcurrentoperationsourcehydratorHydrateto:
    """
    HydrateTo specifies an optional "staging" location to push hydrated manifests to. An external system would then
    have to move manifests to the SyncSource, e.g. by pull request.

    Attributes
    ----------
    targetBranch : str, required
        TargetBranch is the branch to which hydrated manifests should be committed
    """
    targetBranch : str

schema ApplicationstatussourcehydratorcurrentoperationsourcehydratorSyncsource:
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

schema ApplicationstatussourcehydratorLastsuccessfuloperation:
    """
    LastSuccessfulOperation holds info about the most recent successful hydration

    Attributes
    ----------
    drySHA : str, optional
        DrySHA holds the resolved revision (sha) of the dry source as of the most recent reconciliation
    hydratedSHA : str, optional
        HydratedSHA holds the resolved revision (sha) of the hydrated source as of the most recent reconciliation
    sourceHydrator : ApplicationstatussourcehydratorlastsuccessfuloperationSourcehydrator, optional
        SourceHydrator holds the hydrator config used for the hydrate operation
    """
    drySHA? : str
    hydratedSHA? : str
    sourceHydrator? : ApplicationstatussourcehydratorlastsuccessfuloperationSourcehydrator

schema ApplicationstatussourcehydratorlastsuccessfuloperationSourcehydrator:
    """
    SourceHydrator holds the hydrator config used for the hydrate operation

    Attributes
    ----------
    drySource : ApplicationstatussourcehydratorlastsuccessfuloperationsourcehydratorDrysource, required
        DrySource specifies where the dry "don't repeat yourself" manifest source lives.
    hydrateTo : ApplicationstatussourcehydratorlastsuccessfuloperationsourcehydratorHydrateto, optional
        HydrateTo specifies an optional "staging" location to push hydrated manifests to. An external system would then
        have to move manifests to the SyncSource, e.g. by pull request.
    syncSource : ApplicationstatussourcehydratorlastsuccessfuloperationsourcehydratorSyncsource, required
        SyncSource specifies where to sync hydrated manifests from.
    """
    drySource : ApplicationstatussourcehydratorlastsuccessfuloperationsourcehydratorDrysource
    hydrateTo? : ApplicationstatussourcehydratorlastsuccessfuloperationsourcehydratorHydrateto
    syncSource : ApplicationstatussourcehydratorlastsuccessfuloperationsourcehydratorSyncsource

schema ApplicationstatussourcehydratorlastsuccessfuloperationsourcehydratorDrysource:
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

schema ApplicationstatussourcehydratorlastsuccessfuloperationsourcehydratorHydrateto:
    """
    HydrateTo specifies an optional "staging" location to push hydrated manifests to. An external system would then
    have to move manifests to the SyncSource, e.g. by pull request.

    Attributes
    ----------
    targetBranch : str, required
        TargetBranch is the branch to which hydrated manifests should be committed
    """
    targetBranch : str

schema ApplicationstatussourcehydratorlastsuccessfuloperationsourcehydratorSyncsource:
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

schema ApplicationstatusSummary:
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

schema ApplicationstatusSync:
    """
    Sync contains information about the application's current sync status

    Attributes
    ----------
    comparedTo : ApplicationstatussyncComparedto, optional
        ComparedTo contains information about what has been compared
    revision : str, optional
        Revision contains information about the revision the comparison has been performed to
    revisions : [str], optional
        Revisions contains information about the revisions of multiple sources the comparison has been performed to
    status : str, required
        Status is the sync state of the comparison
    """
    comparedTo? : ApplicationstatussyncComparedto
    revision? : str
    revisions? : [str]
    status : str

schema ApplicationstatussyncComparedto:
    """
    ComparedTo contains information about what has been compared

    Attributes
    ----------
    destination : ApplicationstatussynccomparedtoDestination, required
        Destination is a reference to the application's destination used for comparison
    ignoreDifferences : [ApplicationstatussynccomparedtoIgnoredifferencesitem], optional
        IgnoreDifferences is a reference to the application's ignored differences used for comparison
    source : ApplicationstatussynccomparedtoSource, optional
        Source is a reference to the application's source used for comparison
    sources : [ApplicationstatussynccomparedtoSourcesitem], optional
        Sources is a reference to the application's multiple sources used for comparison
    """
    destination : ApplicationstatussynccomparedtoDestination
    ignoreDifferences? : [ApplicationstatussynccomparedtoIgnoredifferencesitem]
    source? : ApplicationstatussynccomparedtoSource
    sources? : [ApplicationstatussynccomparedtoSourcesitem]

schema ApplicationstatussynccomparedtoDestination:
    """
    Destination is a reference to the application's destination used for comparison

    Attributes
    ----------
    name : str, optional
        Name is an alternate way of specifying the target cluster by its symbolic name. This must be set if Server is not set.
    namespace : str, optional
        Namespace specifies the target namespace for the application's resources.
        The namespace will only be set for namespace-scoped resources that have not set a value for .metadata.namespace
    server : str, optional
        Server specifies the URL of the target cluster's Kubernetes control plane API. This must be set if Name is not set.
    """
    name? : str
    namespace? : str
    server? : str

schema ApplicationstatussynccomparedtoIgnoredifferencesitem:
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

schema ApplicationstatussynccomparedtoSource:
    """
    Source is a reference to the application's source used for comparison

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatussynccomparedtosourceDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatussynccomparedtosourceHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatussynccomparedtosourceKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is used to refer to a source and is displayed in the UI. It is used in multi-source Applications.
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatussynccomparedtosourcePlugin, optional
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
    directory? : ApplicationstatussynccomparedtosourceDirectory
    helm? : ApplicationstatussynccomparedtosourceHelm
    kustomize? : ApplicationstatussynccomparedtosourceKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatussynccomparedtosourcePlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatussynccomparedtosourceDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatussynccomparedtosourcedirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatussynccomparedtosourcedirectoryJsonnet
    recurse? : bool

schema ApplicationstatussynccomparedtosourcedirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatussynccomparedtosourcedirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatussynccomparedtosourcedirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatussynccomparedtosourcedirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatussynccomparedtosourcedirectoryjsonnetTlasitem]

schema ApplicationstatussynccomparedtosourcedirectoryjsonnetExtvarsitem:
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

schema ApplicationstatussynccomparedtosourcedirectoryjsonnetTlasitem:
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

schema ApplicationstatussynccomparedtosourceHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatussynccomparedtosourcehelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatussynccomparedtosourcehelmParametersitem], optional
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
    fileParameters? : [ApplicationstatussynccomparedtosourcehelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatussynccomparedtosourcehelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatussynccomparedtosourcehelmFileparametersitem:
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

schema ApplicationstatussynccomparedtosourcehelmParametersitem:
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

schema ApplicationstatussynccomparedtosourceKustomize:
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
    patches : [ApplicationstatussynccomparedtosourcekustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatussynccomparedtosourcekustomizeReplicasitem], optional
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
    patches? : [ApplicationstatussynccomparedtosourcekustomizePatchesitem]
    replicas? : [ApplicationstatussynccomparedtosourcekustomizeReplicasitem]
    version? : str

schema ApplicationstatussynccomparedtosourcekustomizePatchesitem:
    """
    ApplicationstatussynccomparedtosourcekustomizePatchesitem schema.

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatussynccomparedtosourcekustomizepatchesitemTarget, optional
        No description available.
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatussynccomparedtosourcekustomizepatchesitemTarget

schema ApplicationstatussynccomparedtosourcekustomizepatchesitemTarget:
    """
    ApplicationstatussynccomparedtosourcekustomizepatchesitemTarget schema.

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

schema ApplicationstatussynccomparedtosourcekustomizeReplicasitem:
    """
    ApplicationstatussynccomparedtosourcekustomizeReplicasitem schema.

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatussynccomparedtosourcePlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatussynccomparedtosourcepluginEnvitem], optional
        Env is a list of environment variable entries
    name : str, optional
        No description available.
    parameters : [ApplicationstatussynccomparedtosourcepluginParametersitem], optional
        No description available.
    """
    env? : [ApplicationstatussynccomparedtosourcepluginEnvitem]
    name? : str
    parameters? : [ApplicationstatussynccomparedtosourcepluginParametersitem]

schema ApplicationstatussynccomparedtosourcepluginEnvitem:
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

schema ApplicationstatussynccomparedtosourcepluginParametersitem:
    """
    ApplicationstatussynccomparedtosourcepluginParametersitem schema.

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

schema ApplicationstatussynccomparedtoSourcesitem:
    """
    ApplicationSource contains all required information about the source of an application

    Attributes
    ----------
    chart : str, optional
        Chart is a Helm chart name, and must be specified for applications sourced from a Helm repo.
    directory : ApplicationstatussynccomparedtosourcesitemDirectory, optional
        Directory holds path/directory specific options
    helm : ApplicationstatussynccomparedtosourcesitemHelm, optional
        Helm holds helm specific options
    kustomize : ApplicationstatussynccomparedtosourcesitemKustomize, optional
        Kustomize holds kustomize specific options
    name : str, optional
        Name is used to refer to a source and is displayed in the UI. It is used in multi-source Applications.
    path : str, optional
        Path is a directory path within the Git repository, and is only valid for applications sourced from Git.
    plugin : ApplicationstatussynccomparedtosourcesitemPlugin, optional
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
    directory? : ApplicationstatussynccomparedtosourcesitemDirectory
    helm? : ApplicationstatussynccomparedtosourcesitemHelm
    kustomize? : ApplicationstatussynccomparedtosourcesitemKustomize
    name? : str
    path? : str
    plugin? : ApplicationstatussynccomparedtosourcesitemPlugin
    ref? : str
    repoURL : str
    targetRevision? : str

schema ApplicationstatussynccomparedtosourcesitemDirectory:
    """
    Directory holds path/directory specific options

    Attributes
    ----------
    exclude : str, optional
        Exclude contains a glob pattern to match paths against that should be explicitly excluded from being used during manifest generation
    include : str, optional
        Include contains a glob pattern to match paths against that should be explicitly included during manifest generation
    jsonnet : ApplicationstatussynccomparedtosourcesitemdirectoryJsonnet, optional
        Jsonnet holds options specific to Jsonnet
    recurse : bool, optional
        Recurse specifies whether to scan a directory recursively for manifests
    """
    exclude? : str
    include? : str
    jsonnet? : ApplicationstatussynccomparedtosourcesitemdirectoryJsonnet
    recurse? : bool

schema ApplicationstatussynccomparedtosourcesitemdirectoryJsonnet:
    """
    Jsonnet holds options specific to Jsonnet

    Attributes
    ----------
    extVars : [ApplicationstatussynccomparedtosourcesitemdirectoryjsonnetExtvarsitem], optional
        ExtVars is a list of Jsonnet External Variables
    libs : [str], optional
        Additional library search dirs
    tlas : [ApplicationstatussynccomparedtosourcesitemdirectoryjsonnetTlasitem], optional
        TLAS is a list of Jsonnet Top-level Arguments
    """
    extVars? : [ApplicationstatussynccomparedtosourcesitemdirectoryjsonnetExtvarsitem]
    libs? : [str]
    tlas? : [ApplicationstatussynccomparedtosourcesitemdirectoryjsonnetTlasitem]

schema ApplicationstatussynccomparedtosourcesitemdirectoryjsonnetExtvarsitem:
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

schema ApplicationstatussynccomparedtosourcesitemdirectoryjsonnetTlasitem:
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

schema ApplicationstatussynccomparedtosourcesitemHelm:
    """
    Helm holds helm specific options

    Attributes
    ----------
    apiVersions : [str], optional
        APIVersions specifies the Kubernetes resource API versions to pass to Helm when templating manifests. By default,
        Argo CD uses the API versions of the target cluster. The format is [group/]version/kind.
    fileParameters : [ApplicationstatussynccomparedtosourcesitemhelmFileparametersitem], optional
        FileParameters are file parameters to the helm template
    ignoreMissingValueFiles : bool, optional
        IgnoreMissingValueFiles prevents helm template from failing when valueFiles do not exist locally by not appending them to helm template --values
    kubeVersion : str, optional
        KubeVersion specifies the Kubernetes API version to pass to Helm when templating manifests. By default, Argo CD
        uses the Kubernetes version of the target cluster.
    namespace : str, optional
        Namespace is an optional namespace to template with. If left empty, defaults to the app's destination namespace.
    parameters : [ApplicationstatussynccomparedtosourcesitemhelmParametersitem], optional
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
    fileParameters? : [ApplicationstatussynccomparedtosourcesitemhelmFileparametersitem]
    ignoreMissingValueFiles? : bool
    kubeVersion? : str
    namespace? : str
    parameters? : [ApplicationstatussynccomparedtosourcesitemhelmParametersitem]
    passCredentials? : bool
    releaseName? : str
    skipCrds? : bool
    skipSchemaValidation? : bool
    skipTests? : bool
    valueFiles? : [str]
    values? : str
    valuesObject? : any
    version? : str

schema ApplicationstatussynccomparedtosourcesitemhelmFileparametersitem:
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

schema ApplicationstatussynccomparedtosourcesitemhelmParametersitem:
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

schema ApplicationstatussynccomparedtosourcesitemKustomize:
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
    patches : [ApplicationstatussynccomparedtosourcesitemkustomizePatchesitem], optional
        Patches is a list of Kustomize patches
    replicas : [ApplicationstatussynccomparedtosourcesitemkustomizeReplicasitem], optional
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
    patches? : [ApplicationstatussynccomparedtosourcesitemkustomizePatchesitem]
    replicas? : [ApplicationstatussynccomparedtosourcesitemkustomizeReplicasitem]
    version? : str

schema ApplicationstatussynccomparedtosourcesitemkustomizePatchesitem:
    """
    ApplicationstatussynccomparedtosourcesitemkustomizePatchesitem schema.

    Attributes
    ----------
    options : {str:bool}, optional
        No description available.
    patch : str, optional
        No description available.
    path : str, optional
        No description available.
    target : ApplicationstatussynccomparedtosourcesitemkustomizepatchesitemTarget, optional
        No description available.
    """
    options? : {str:bool}
    patch? : str
    path? : str
    target? : ApplicationstatussynccomparedtosourcesitemkustomizepatchesitemTarget

schema ApplicationstatussynccomparedtosourcesitemkustomizepatchesitemTarget:
    """
    ApplicationstatussynccomparedtosourcesitemkustomizepatchesitemTarget schema.

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

schema ApplicationstatussynccomparedtosourcesitemkustomizeReplicasitem:
    """
    ApplicationstatussynccomparedtosourcesitemkustomizeReplicasitem schema.

    Attributes
    ----------
    count : any, required
        Number of replicas
    name : str, required
        Name of Deployment or StatefulSet
    """
    count : any
    name : str

schema ApplicationstatussynccomparedtosourcesitemPlugin:
    """
    Plugin holds config management plugin specific options

    Attributes
    ----------
    env : [ApplicationstatussynccomparedtosourcesitempluginEnvitem], optional
        Env is a list of environment variable entries
    name : str, optional
        No description available.
    parameters : [ApplicationstatussynccomparedtosourcesitempluginParametersitem], optional
        No description available.
    """
    env? : [ApplicationstatussynccomparedtosourcesitempluginEnvitem]
    name? : str
    parameters? : [ApplicationstatussynccomparedtosourcesitempluginParametersitem]

schema ApplicationstatussynccomparedtosourcesitempluginEnvitem:
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

schema ApplicationstatussynccomparedtosourcesitempluginParametersitem:
    """
    ApplicationstatussynccomparedtosourcesitempluginParametersitem schema.

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