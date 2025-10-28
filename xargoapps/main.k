import schemas as argo

# _argo_app_xnetwork_resource = argo.ApplicationBlueprint {
#     _name = "xnetwork-composition"
#     _namespace = "argocd"
#     _destination = {
#         server = "https://kubernetes.default.svc"
#         namespace = "default"
#     }
#     _project = "default"
#     _source = {
#         path = "1_configurations_network/apis/"
#         repoURL = "https://github.com/segoja7/platform_as_data"
#         # plugin = {
#         #     name = "kcl-v1.0"
#         # }
#     }
# } 


oxr = option("params").oxr
_ocds = option("params").ocds or {}
dxr = option("params").dxr

_id = oxr.spec.id
_providerConfig = oxr.spec.providerConfigName or "default"
_kubeconfigSecret = oxr.spec.kubeconfigSecret

_argo_cluster_resource = argo.ClusterBlueprint {
    _name = "hub-cluster-${_id}"
    _providerConfig = _providerConfig
    _config = {
        
    }
    _clusterName = _name
}


_argo_root_app_resource = argo.ApplicationBlueprint {
    _name = "kcl-root"
    _namespace = "argocd"
    _destination = {
        name = _argo_cluster_resource._clusterName
        namespace = "argocd"
    }
    _project = "default"
    _source = {
        path = "xargoapps/gitops_manifests/apps"
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
    }
    _providerConfig = _providerConfig    
} 


items = [
    _argo_cluster_resource ,
    _argo_root_app_resource
] 