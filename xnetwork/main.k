import json
import schemas.vpc as vpc
import schemas.subnet as subnets
import schemas.internetGateway as internetGateway
import schemas.eip as eip
import schemas.natGateway as natGateway
import schemas.routeTable as routeTable
import schemas.securityGroup as securityGroup
import schemas.vpcEndpoint as vpcEndpoint
import schemas.flowLog as flowLog
import schemas.logGroup as logGroup
import schemas.role as role
import schemas.rolePolicyAttachment as rolePolicyAttachment


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
_labels = {"claim-name" = _id}
_natStrategy = observed_xr.spec.natGatewayStrategy or "Single"
_public_subnets = [s for s in _subnets if s.type == "public"]
_private_subnets = [s for s in _subnets if s.type == "private"]
_database_subnets = [s for s in _subnets if s.type == "database"]
_azs = {s.az : True for s in _subnets}
_enabledS3Gateway = observed_xr.spec.enabledS3Gateway or False
_enabledDynamodbGateway = observed_xr.spec.enabledDynamodbGateway or False
_enabledInterfaceEndpoints = observed_xr.spec.enabledInterfaceEndpoints or []
_flowLogsConfig = observed_xr.spec.flowLogs or { enabled = False }

_vpc_resource = vpc.VpcBlueprint {
    _name = "vpc-${_id}"
    _labels = _labels
    _region = _region
    _cidrBlock = _cidrBlock
    _enableDnsHostNames = _enableDnsHostNames
    _enableDnsSupport = _enableDnsSupport
    _tags = _tags | {
        Name = _name
    }
    _instanceTenancy = _instanceTenancy
    _providerConfig = _providerConfig
}

_subnet_resource = [
    subnets.SubnetBlueprint {
        _name = "subnet-${_id}-${s.az}-${s.type}"
        _labels = _labels | {
            "subnet.type" = s.type
        }
        _providerConfig = _providerConfig
        _availabilityZone = s.az
        _cidrBlock = s.cidr
        _mapPublicIPOnLaunch = True if s.type == "public" else False
        _region = _region
        _tags = _tags | {
            Name = _name
        }
        _vpcIdSelector.matchControllerRef = True 
        }
    for s in _subnets
]

_internetGateway_resource = internetGateway.InternetgatewayBlueprint {
        _name = "igw-${_id}"
        _labels = _labels
        _providerConfig = _providerConfig
        _region = _region
        _tags = _tags | {
            Name = _name
        } 
        _vpcIdSelector.matchControllerRef = True 
}

_eip_resources = []
_nat_gateway_resources = []
_route_table_resources = []

if _natStrategy == "PerAZ":
    # --- Estrategia: Un NAT Gateway por Zona de Disponibilidad ---
    _eip_resources = [
        eip.AddressBlueprint {
            _name = "eip-${_id}-${s.az}"
            _providerConfig = _providerConfig
            _region = _region
            _tags = _tags | {
                Name = _name
            }             
        }
        for s in _public_subnets
    ]
    _nat_gateway_resources = [
        natGateway.NatgatewayBlueprint {
            _name = "ng-${_id}-${s.az}"
            _region = _region
            _providerConfig = _providerConfig
            _subnetIdRef.name = "subnet-${_id}-${s.az}-${s.type}"
            _allocationIdRef.name = "eip-${_id}-${s.az}"
            _tags = _tags | {
                Name = _name
            } 
        }
        for s in _public_subnets
    ]
    _public_route_table = routeTable.RoutetableBlueprint {
        _name = "rt-${_id}-public"
        _region = _region
        _providerConfig = _providerConfig
        _tags = _tags | {
            Name = _name
        }
        _vpcIdSelector = {
            matchControllerRef = True
        }
        _routes = [
            {
                destinationCidrBlock = "0.0.0.0/0", 
                gatewayIdSelector = {
                    matchControllerRef = True
                }
            }
        ]
        _associations = [
            {
                subnetIdRef = {
                    name = "subnet-${_id}-${s.az}-${s.type}"
                }
            } 
            for s in _public_subnets
        ]
    }
    _private_route_tables = [
        routeTable.RoutetableBlueprint {
            _name = "rt-${_id}-private-${az}"
            _region = _region
            _providerConfig = _providerConfig
            _tags = _tags | {
                Name = _name
            }
            _vpcIdSelector = {
                matchControllerRef = True
            }
            _routes = [
                {
                    destinationCidrBlock = "0.0.0.0/0",
                    natGatewayIdRef = {
                        name = "ng-${_id}-${az}"
                    }
                }
            ]
            _associations = [
                {
                    subnetIdRef ={
                        name = "subnet-${_id}-${s.az}-${s.type}"
                    }
                } 
                for s in _subnets if s.az == az and s.type != "public"
            ]
        } for az in _azs
    ]
    _route_table_resources = [_public_route_table] + _private_route_tables

else: # _natStrategy == "Single"
    # --- Estrategia: Un Único NAT Gateway para todas las Zonas ---
    assert len(_public_subnets) > 0, "La estrategia 'Single' requiere al menos una subnet pública."
    _eip_resources = [
        eip.AddressBlueprint {
            _name = "eip-${_id}"
            _region = _region
            _providerConfig = _providerConfig
            _tags = _tags | {
                Name = _name
            }
        }
    ]
    _nat_gateway_resources = [
        natGateway.NatgatewayBlueprint {
            _name = "ng-${_id}"
            _region = _region
            _providerConfig = _providerConfig
            _subnetIdRef = {
                name = "subnet-${_id}-${_public_subnets[0].az}-${_public_subnets[0].type}"
            }
            _allocationIdSelector = {
                matchControllerRef = True
            }
            _tags = _tags | {
                Name = _name
            }
        }
    ]
    _public_route_table = routeTable.RoutetableBlueprint {
        _name = "rt-${_id}-public"
        _region = _region
        _providerConfig = _providerConfig
        _tags = _tags | {
            Name = _name
        }
        _routes = [
            {
                destinationCidrBlock = "0.0.0.0/0",
                gatewayIdSelector = {
                    matchControllerRef = True
                }
            }
        ]
        _vpcIdSelector = {
            matchControllerRef = True
        }
        _associations = [
            {
                subnetIdRef = {
                    name = "subnet-${_id}-${s.az}-${s.type}"
                }
            } for s in _public_subnets
        ]
    }
    _private_route_table = routeTable.RoutetableBlueprint {
        _name = "rt-${_id}-private"
        _region = _region
        _providerConfig = _providerConfig
        _tags = _tags | {
            Name = _name
        }
        _routes = [
            {
                destinationCidrBlock = "0.0.0.0/0",
                natGatewayIdSelector = {
                    matchControllerRef = True
                }
            }
        ]
        _vpcIdSelector = {
            matchControllerRef = True
        }
        _associations = [
            {
                subnetIdRef = {
                    name = "subnet-${_id}-${s.az}-${s.type}"
                }
            } for s in _private_subnets + _database_subnets
        ]
    }
    _route_table_resources = [_public_route_table, _private_route_table]

_security_group_resources = securityGroup.SecuritygroupBlueprint {
    _name = "security-group-${_id}-vpce"
    _labels = _labels
    _providerConfig = _providerConfig
    _description = "Security Group for VPC Endpoints"
    _egress = [{
        fromPort = 0
        toPort = 0
        ipProtocol = "-1"
        ipRanges = [{ cidrIp = "0.0.0.0/0" }]
    }]
    _groupName = _name
    _ingress = [{
        fromPort = 443
        toPort = 443
        ipProtocol = "tcp"
        ipRanges = [
            { 
                cidrIp = _cidrBlock 
                description = "Allow HTTPS for VPC Endpoints"
            }
        ]
    }]
    _region = _region
    _tags = _tags | {
        Name = _name
    }
    _vpcIdSelector = {
        matchControllerRef = True
    }

}
if _enabledS3Gateway == True:
    _s3_gateway_endpoint_resources = vpcEndpoint.VpcendpointBlueprint {
        _name = "s3-gateway-vpce-${_id}"
        _labels = _labels
        _providerConfig = _providerConfig
        _routeTableIdRefs = [
            { 
                name = rt._name 
            } 
            for rt in _route_table_resources if "private" in rt._name or "database" in rt._name
        ]
        _serviceName = "com.amazonaws.us-east-1.s3"
        # _tagSpecifications = [
        #     {
        #         resourceType = "vpc-endpoint"
        #         tags = [
        #             {
        #                 key = "Name"
        #                 value = _name
        #             }
        #         ]
        #     }
        # ]
        _tags = _tags | {
            Name = _name
        }
        _vpcEndpointType = "Gateway"
        _vpcIdSelector = {
            matchControllerRef = True
        }
        _region = _region
    }

if _enabledDynamodbGateway == True:
    _dynamodb_gateway_endpoint_resources = vpcEndpoint.VpcendpointBlueprint {
        _name = "dynamodb-gateway-vpce-${_id}"
        _labels = _labels
        _providerConfig = _providerConfig
        _routeTableIdRefs = [
            { 
                name = rt._name 
            } 
            for rt in _route_table_resources if "private" in rt._name or "database" in rt._name
        ]
        _serviceName = "com.amazonaws.us-east-1.dynamodb"
        # _tagSpecifications = [
        #     {
        #         resourceType = "vpc-endpoint"
        #         tags = [
        #             {
        #                 key = "Name"
        #                 value = _name
        #             }
        #         ]
        #     }
        # ]
        _tags = _tags | {
            Name = _name
        }

        _vpcEndpointType = "Gateway"
        _vpcIdSelector = {
            matchControllerRef = True
        }
        _region = _region
    }

_interface_endpoint_resources = [
    vpcEndpoint.VpcendpointBlueprint {
    _name = "${s}-vpce-${_id}"
    _labels = _labels
    _providerConfig = _providerConfig
    _ipAddressType = "ipv4"
    _privateDNSEnabled = True
    _securityGroupIdSelector = {
        matchControllerRef = True
    }
    _serviceName = "com.amazonaws.${_region}.${s}"
    _subnetIdRefs = [
        {
            name = "subnet-${_id}-${s.az}-${s.type}"
        }
        for s in _private_subnets 
    ] 
    # _tagSpecifications = [
    #     {
    #         resourceType = "vpc-endpoint"
    #         tags = [
    #             {
    #                 key = "Name"
    #                 value = _name
    #             }
    #         ]
    #     }
    # ]
    _tags = _tags | {
        Name = _name
    }
    _vpcEndpointType = "Interface"
    _vpcIdSelector = {
        matchControllerRef = True
    }
    _region = _region
} for s in _enabledInterfaceEndpoints
]

_flow_log_all_resources = []
if _flowLogsConfig.enabled == True:
    _log_group_resource = logGroup.LoggroupBlueprint {
        _name = "vpc-flowlogs-${_id}"
        _providerConfig = _providerConfig
        _logGroupName = "/aws/vpc/${_name}"
        _region = _region
        _retentionInDays = _flowLogsConfig.retentionInDays or 90
        _tags = _tags | {
            Name = _name
        }
    }

    _flow_log_role_policy_document = json.encode({
        "Version": "2012-10-17"
        "Statement": [{
            "Effect": "Allow"
            "Principal": {"Service": "vpc-flow-logs.amazonaws.com"}
            "Action": "sts:AssumeRole"
        }]
    })

    _flow_log_role_resource = role.RoleBlueprint {
        _name = "role-flowlogs-${_id}"
        _providerConfig = _providerConfig
        _assumeRolePolicyDocument = _flow_log_role_policy_document 
        _description = "Role for VPC Flow Logs"
        _tags = _tags | {
            Name = _name
        }
    }

    _flow_log_policy_attachment_resource = rolePolicyAttachment.RolepolicyattachmentBlueprint {
        _name = "policy-attachment-flowlogs-${_id}"
        _providerConfig = _providerConfig
        _roleName = _flow_log_role_resource._name
        _policyArn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
    }

    _flow_log_resource = flowLog.FlowlogBlueprint {
        _name = "flowlog-vpc-${_id}"
        _region = _region
        _providerConfig = _providerConfig
        _logGroupName = _log_group_resource._name
        _deliverLogsPermissionArnRef = {
            name = _flow_log_role_resource._name
        }
        _vpcIdSelector = { 
            matchControllerRef = True 
        }
        _trafficType = _flowLogsConfig.trafficType or "ALL"
        _tags = _tags | {
            Name = _name
        }
    }
    
    _flow_log_all_resources = [
        _log_group_resource 
        _flow_log_role_resource 
        _flow_log_policy_attachment_resource 
        _flow_log_resource
    ]

items = [_vpc_resource, _internetGateway_resource] + _subnet_resource + _eip_resources + _nat_gateway_resources + _route_table_resources + [_security_group_resources, _s3_gateway_endpoint_resources, _dynamodb_gateway_endpoint_resources] + _interface_endpoint_resources + _flow_log_all_resources