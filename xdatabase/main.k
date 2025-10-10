import json
import schemas.dbSubnetGroup as dbSubnetGroup
#import schemas.dbParamaterGroup as dbParamaterGroup
import schemas.securityGroup as securityGroup
import schemas.rdsInstance as rdsInstance
import schemas.providerConfigKubernetes as providerConfigKubernetes
import schemas.object as object

observed_xr = option("params").oxr
_id = observed_xr.spec.id
_region = observed_xr.spec.region
_providerConfig = observed_xr.spec.providerConfigName or "default"
_tags = observed_xr.spec.tags or {}
_networkId = observed_xr.spec.networkId
_clusterId = observed_xr.spec.clusterId
_labels = {"claim-name" = _id}
rdsport = observed_xr.spec.rdsport
ipRanges = observed_xr.spec.ipRanges
_rdsDatabaseConfig = observed_xr.spec.rdsDatabase or {}

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

# _db_parameter_group_resource = dbParamaterGroup.DbparametergroupBlueprint {
#     _name = "db-parameter-group-${_id}"
#     _dbParameterGroupFamily = "postgres17"
#     _description = "Parameter group for ${_id}"
#     _region = _region
#     _providerConfig = _providerConfig
#     _tags = _tags | { Name = _name }
#     _parameters = [
#         {
#             name = "max_connections"
#             value = "200"
#             applyMethod = "pending-reboot"
#         },
#         {
#             name = "shared_buffers"
#             value = "256MB"
#             applyMethod = "pending-reboot"
#         }
#     ]
# }

_rds_sg_resource = securityGroup.SecuritygroupBlueprint {
    _name = "security-group-${_id}"
    _labels = _labels
    _providerConfig = _providerConfig
    _description = "Security Group for rds instance ${_id}"
    _egress = [{
        # fromPort = 0
        # toPort = 0
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



_rds_instance_resource = rdsInstance.RdsinstanceBlueprint {
    _name = "db-instance-${_id}"
    _labels = _labels
    _providerConfig = _providerConfig
    _allocatedStorage = _rdsDatabaseConfig.allocatedStorage
    _allowMajorVersionUpgrade = _rdsDatabaseConfig.allowMajorVersionUpgrade
    _autoMinorVersionUpgrade = _rdsDatabaseConfig.autoMinorVersionUpgrade
    _availabilityZone = _rdsDatabaseConfig.availabilityZone
    _copyTagsToSnapshot = _rdsDatabaseConfig.copyTagsToSnapshot
    _dbInstanceClass = _rdsDatabaseConfig.dbInstanceClass
    _dbName = _rdsDatabaseConfig.dbName
    _engine = _rdsDatabaseConfig.engine
    _engineVersion = _rdsDatabaseConfig.engineVersion
    _masterUsername = _rdsDatabaseConfig.masterUsername
    _maxAllocatedStorage = _rdsDatabaseConfig.maxAllocatedStorage
    _multiAZ = _rdsDatabaseConfig.multiAz
    _storageEncrypted = _rdsDatabaseConfig.storageEncrypted
    _port = rdsport
    _publiclyAccessible = _rdsDatabaseConfig.publiclyAccessible
    _region = _region
    _skipFinalSnapshotBeforeDeletion = _rdsDatabaseConfig.skipFinalSnapshot
    _storageType = _rdsDatabaseConfig.storageType
    _tags = _tags | { Name = _name }
    _vpcSecurityGroupIDSelector = {
        matchControllerRef = True
    }
    # _dbParameterGroupNameSelector = {
    #     matchControllerRef = True
    # }
    _dbSubnetGroupNameSelector = {
        matchControllerRef = True
    }
    _writeConnectionSecretToRef = {
        namespace = "default"
        name = "rds-credentials-${_id}" 
    }    
}

_providerconfig_kubernetes_resource = providerConfigKubernetes.ProviderconfigBlueprint {
    _name = "provider-kubernetes-${_id}"
    _annotations = {
        "krm.kcl.dev/ready": "True"
    }
    _credentials = {
        source = "Secret"
        secretRef = {
            namespace = "default"
            name = "eks-cluster-${_clusterId}" #TODO: add descriptive name for cluster secret
            key = "kubeconfig"
        }
    }
}

_rds_instance_secret_resource = object.ObjectBlueprint {
    _name = "rds-credentials-${_id}"
    _references = [
        {
            patchesFrom = {
                apiVersion = "v1"
                kind = "Secret"
                name = _rds_instance_resource.spec.writeConnectionSecretToRef.name
                namespace = _rds_instance_resource.spec.writeConnectionSecretToRef.namespace
                fieldPath = "data"
            }
            toFieldPath = "data"
        }
    ]
    
    _manifest = {
            apiVersion = "v1"
            kind = "Secret"
            metadata = {
                name = "rds-credentials-${_id}"
                namespace = "default"
            }
            type = "Opaque"
            data = {}
        }
    _providerConfig = _providerconfig_kubernetes_resource._name

}


items = [
    _db_subnet_group_resource, 
    _rds_sg_resource, 
    _rds_instance_resource,
    _providerconfig_kubernetes_resource,
    _rds_instance_secret_resource
]
