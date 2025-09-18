import pkg.deploy as deploy
import pkg.service as svc

_deploy_resources = deploy.deploy {}
_svc_resources = svc.service {}

items = [_deploy_resources, _svc_resources]
