import manifests
import filesx.deployment as deploy
import filesx.service as svc

manifests.yaml_stream([
    deploy.deploy,
    svc.svc
])
