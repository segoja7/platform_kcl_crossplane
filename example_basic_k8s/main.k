import pkg.deploy
import pkg.service
import pkg.ingress
import manifests


manifests.yaml_stream([
    deploy.deploy,
    service.service,
    ingress.ingress,
])