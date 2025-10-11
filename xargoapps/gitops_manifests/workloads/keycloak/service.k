apiVersion = "v1"
kind = "Service"
metadata = {
    name = "keycloak"
    namespace = "default"
}
spec = {
    selector = {
        app = "keycloak"
    }
    ports = [
        {
            port = 8443
            targetPort = 8443
            protocol = "TCP"
        }
    ]
    type = "ClusterIP"
}