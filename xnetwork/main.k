import json
import schemas.vpc as vpc

observed_xr = option("params").oxr
_id = observed_xr.spec.id
_region = observed_xr.spec.region
_cidrBlock = observed_xr.spec.vpcCidr
_enableDnsHostNames = observed_xr.spec.enableDnsHostNames or True
_enableDnsSupport = observed_xr.spec.enableDnsSupport or True
_tags = observed_xr.spec.tags or {}
_instanceTenancy = observed_xr.spec.instanceTenancy or "default"
_providerConfig = observed_xr.spec.providerConfigName or "default"

_vpc_resource = vpc.VpcBlueprint {
    _name = _id
    _region = _region
    _cidrBlock = _cidrBlock
    _enableDnsHostNames = _enableDnsHostNames
    _enableDnsSupport = _enableDnsSupport
    _tags = _tags
    _instanceTenancy = _instanceTenancy
    _providerConfig = _providerConfig
}
