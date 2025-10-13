import schemas.applicationNative as argo

_argo_app_keycloak_resource = argo.ApplicationBlueprint {
    _name = "kcl-keycloak"
    _namespace = "argocd"
    _destination = {
        name = "hub-cluster-xargoapp-example-segoja7"
        namespace = "keycloak"
    }
    _project = "default"
    _source = {
        path = "xargoapps/gitops_manifests/workloads/dev/keycloak/main.k"
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

items = [_argo_app_keycloak_resource] 