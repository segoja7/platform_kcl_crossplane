import json
import schemas.vpc as vpc

observed_xr = option("params").oxr
_providerConfigName = observed_xr.spec.providerConfigName or "default"
_id = observed_xr.spec.id
_region = observed_xr.spec.region
_tags = observed_xr.spec.tags or {}


_vpc_resource = vpc.VpcBlueprint {
    _name = _id
    _region = _region
    _cidrVpc = observed_xr.spec.vpcCidr
    _providerConfig = _providerConfigName
    _tags = _tags
}


