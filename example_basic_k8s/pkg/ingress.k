import k8s.api.networking.v1 as k8snet

ingress = k8snet.Ingress {
    metadata = {
        name = "hello-app-ingress"
    }     
    spec = {
        ingressClassName = "nginx"
    
        rules = [
            {
                host = "backed-access.local"
                http = {
                    paths = [
                        {
                            path = "/"
                            pathType = "Prefix"
                            backend = {
                                service = {
                                    name = "hello-app-svc" # El nombre de tu Service
                                    port = {
                                        number = 8080     # El puerto de tu Service
                                    }
                                }
                            }
                        }
                    ]
                }
            }
        ]
    }
}