

_argo_app_example_basick8s_resource = argo.ApplicationBlueprint {
    _name = "kcl-keycloak"
    _namespace = "keycloak" #TODO: Finalizers
    _destination = {
        server = "https://kubernetes.default.svc"
        namespace = "default"
    }
    _project = "default"
    _source = {
        path = "xargoapps/gitops_manifests/workloads/keycloak"
        repoURL = "https://github.com/segoja7/platform_as_data"
        targetRevision = "HEAD"
        plugin = {
            name = "kcl-v1.0"
        }
    }
    _syncPolicy = {
        automated = {
            prune = True
            selfHeal = True
        }
        syncOptions = [
            "CreateNamespace=true"
        ]
    }
} 