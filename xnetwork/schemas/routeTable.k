# --- Blueprint de Alto Nivel (Generado Automáticamente) ---

import modules.ec2_aws_crossplane_io.v1beta1.ec2_aws_crossplane_io_v1beta1_RouteTable as routetable_schema

schema RoutetableBlueprint(routetable_schema.Routetable):
    """Este Blueprint simplifica la creación de un recurso Routetable,
    exponiendo una selección inteligente de campos requeridos y opcionales comunes."""

    # Parámetros de entrada simplificados para el usuario
    _name: str
    _namespace?: str
    _labels?: {str:str}
    _providerConfig: str
    _associations: [routetable_schema.RoutetablespecforproviderAssociationsitem]
    _ignoreRoutes?: bool
    _region: str
    _routes?: [routetable_schema.RoutetablespecforproviderRoutesitem]
    _vpcId?: str
    _vpcIdRef?: routetable_schema.RoutetablespecforproviderVpcidref
    _vpcIdSelector?: routetable_schema.RoutetablespecforproviderVpcidselector

    # Lógica de mapeo de parámetros simples a la estructura compleja
    metadata = {
        name = _name
        namespace = _namespace
        labels = _labels
    }
    spec = {
        forProvider = {
            associations = _associations
            ignoreRoutes = _ignoreRoutes
            region = _region
            routes = _routes
            vpcId = _vpcId
            vpcIdRef = _vpcIdRef
            vpcIdSelector = _vpcIdSelector
        }
        providerConfigRef.name = _providerConfig
    }

# --- Ejemplo de Uso ---
# Descomenta y ajusta los valores para usar este Blueprint en tu archivo 'main.k'.
_test_subnets = [
    {
        az = "us-east-1a"
        cidr = "10.50.1.0/24"
        type = "public"
    }
    {
        az = "us-east-1a"
        cidr = "10.50.2.0/24"
        type = "private"
    }
    {
        az = "us-east-1a"
        cidr = "10.50.3.0/24"
        type = "database"
    }    
    {
        az = "us-east-1b"
        cidr = "10.50.4.0/24"
        type = "public"
    }
    {
        az = "us-east-1b"
        cidr = "10.50.5.0/24"
        type = "private"
    }
    {
        az = "us-east-1b"
        cidr = "10.50.6.0/24"
        type = "database"
    }
]
_unique_azs = {s.az : True for s in _test_subnets}
items = [
    RoutetableBlueprint {
        _name = "example-value" # Reemplazar valor
        _namespace = "example-value" # Reemplazar valor
        _labels = {
            Name = "example-name"
            Environment = "development"
        } # Reemplazar valor
        _providerConfig = "example-value" # Reemplazar valor
        _associations = [
            {
                subnetIdRef = {
                    name = "subnet-test-${s.az}-${s.type}"
                } # Reemplazar valor
            } for s in _test_subnets if s.az == az and s.type != "public" # Solo subnets privadas

        ] # Reemplazar valor
        _ignoreRoutes = True # Reemplazar valor
        _region = "example-value" # Reemplazar valor
        _routes = [] # Reemplazar valor
        _vpcId = "example-value" # Reemplazar valor
        _vpcIdRef = {
            name = "example-resource-name"
        } # Reemplazar valor
        _vpcIdSelector = {
            matchControllerRef = True
            # OR use matchLabels:
            # matchLabels = {
            #     key = "value"
            # }
        } # Reemplazar valor
    } for az in _unique_azs

]
