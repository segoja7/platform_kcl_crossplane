import schemas as argo

_argo_app_xnetwork_resource = argo.ApplicationBlueprint {
    _name = "xnetwork-composition"
    _namespace = "argocd"
    _destination = {
        server = "https://kubernetes.default.svc"
        namespace = "default"
    }
    _project = "default"
    _source = {
        path = "1_configurations_network/apis/"
        repoURL = "https://github.com/segoja7/platform_as_data"
        # plugin = {
        #     name = "kcl-v1.0"
        # }
    }
} 

_argo_app_xnetwork_claim_resource = argo.ApplicationBlueprint {
    _name = "xnetwork-claim"
    _namespace = "argocd"
    _destination = {
        server = "https://kubernetes.default.svc"
        namespace = "default"
    }
    _project = "default"
    _source = {
        path = "example/xnetwork"
        repoURL = "https://github.com/segoja7/platform_as_data"
    }
}

items = [_argo_app_xnetwork_resource, _argo_app_xnetwork_claim_resource] 