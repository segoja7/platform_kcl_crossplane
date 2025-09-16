import json
import schemas.vpc as vpc
import schemas.subnet as subnets
import schemas.internetGateway as internetGateway


observed_xr = option("params").oxr
_id = observed_xr.spec.id
_region = observed_xr.spec.region
_cidrBlock = observed_xr.spec.vpcCidr
_enableDnsHostNames = observed_xr.spec.enableDnsHostNames or True
_enableDnsSupport = observed_xr.spec.enableDnsSupport or True
_tags = observed_xr.spec.tags or {}
_instanceTenancy = observed_xr.spec.instanceTenancy or "default"
_providerConfig = observed_xr.spec.providerConfigName or "default"
_subnets = observed_xr.spec.subnets or []


_vpc_resource = vpc.VpcBlueprint {
    _name = "${_id}-vpc"
    _region = _region
    _cidrBlock = _cidrBlock
    _enableDnsHostNames = _enableDnsHostNames
    _enableDnsSupport = _enableDnsSupport
    _tags = _tags
    _instanceTenancy = _instanceTenancy
    _providerConfig = _providerConfig
}

_subnet_resource = [
    subnets.SubnetBlueprint {
        _name = "${_id}-${s.az}-${s.type}"
        _providerConfig = _providerConfig
        _availabilityZone = s.az
        _cidrBlock = s.cidr
        _mapPublicIPOnLaunch = True if s.type == "public" else False
        _region = _region
        _tags = _tags
        _vpcIdSelector.matchControllerRef = True 
        }
    for s in _subnets
]

_internetGateway_resource = internetGateway.InternetgatewayBlueprint {
        _name = "${_id}-igw"
        _providerConfig = _providerConfig
        _region = _region
        _tags = _tags 
        _vpcIdSelector.matchControllerRef = True 
}

items = [_vpc_resource, _internetGateway_resource] + _subnet_resource 