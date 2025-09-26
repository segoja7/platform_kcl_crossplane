import schemas.workspace as workspace


_workspace_resource = workspace.WorkspaceBlueprint {
    _name = "workspace-example"
    _module = "git::https://github.com/terraform-aws-modules/terraform-aws-s3-bucket.git/?ref=v5.7.0"
    _source = "Remote"

    _varmap = {
        bucket = "tofu-example-bucket-92520252025-kcl"
        acl    = "private"
        control_object_ownership = "true"
        object_ownership         = "ObjectWriter"
        tags = {
            Environment = "testing-kcl"
            ManagedBy   = "Crossplane-Tofu"
        }
    }

    _writeConnectionSecretToRef = {
        name = "s3-bucket-details"
        namespace = "default"
    }

    _providerConfig = "default2"
}

items = [
    _workspace_resource
]
