import json
import schemas.dbSubnetGroup as dbSubnetGroup


observed_xr = option("params").oxr
_id = observed_xr.spec.id
_region = observed_xr.spec.region
_providerConfig = observed_xr.spec.providerConfigName or "default"
_tags = observed_xr.spec.tags or {}
_networkId = observed_xr.spec.networkId
_labels = {"claim-name" = _id}

_db_subnet_group_resource = dbSubnetGroup.DbsubnetgroupBlueprint {
    _name = "db-subnet-group-${_id}"
    _providerConfig = _providerConfig
    _description = "${_id} db subnet group"
    _region = _region
    _subnetIdSelector = {
        matchLabels: {
            "claim-name": _networkId,
            "subnet.type": "private"
        }
    }
    _tags = _tags

}

items = [_db_subnet_group_resource]