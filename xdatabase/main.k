import json
import schemas.dbSubnetGroup as dbSubnetGroup
import schemas.securityGroup as securityGroup


observed_xr = option("params").oxr
_id = observed_xr.spec.id
_region = observed_xr.spec.region
_providerConfig = observed_xr.spec.providerConfigName or "default"
_tags = observed_xr.spec.tags or {}
_networkId = observed_xr.spec.networkId
_labels = {"claim-name" = _id}
rdsport = observed_xr.spec.rdsport
ipRanges = observed_xr.spec.ipRanges 

_db_subnet_group_resource = dbSubnetGroup.DbsubnetgroupBlueprint {
    _name = "db-subnet-group-${_id}"
    _providerConfig = _providerConfig
    _description = "${_id} db subnet group"
    _region = _region
    _subnetIdSelector = {
        matchLabels: {
            "claim-name": _networkId,
            "subnet.type": "database"
        }
    }
    _tags = _tags

}

_rds_sg_resource = securityGroup.SecuritygroupBlueprint {
    _name = "security-group-${_id}"
    _labels = _labels
    _providerConfig = _providerConfig
    _description = "Security Group for rds instance ${_id}"
    _egress = [{
        fromPort = 0
        toPort = 0
        ipProtocol = "-1"
        ipRanges = [
            { 
                cidrIp = "0.0.0.0/0"
                description = "Allow all outbound traffic" 
            }
        ]
    }]
    _groupName = _name
    _ingress = [{
        fromPort = rdsport
        toPort = rdsport
        ipProtocol = "tcp"
        ipRanges = [
            { 
                cidrIp = s.cidrIp
                description = s.description
            } for s in ipRanges
        ]
    }]
    _region = _region
    _tags = _tags | { Name = _name }
    _vpcIdSelector = {
        matchLabels = {
            "claim-name": _networkId
        }
    }
}

items = [_db_subnet_group_resource, _rds_sg_resource]