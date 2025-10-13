deploy = {
    apiVersion = "apps/v1"
    kind = "Deployment"
    metadata = {
        name = "keycloak"
    }
    spec = {
        replicas = 2
        selector = {
            matchLabels = {
                app = "keycloak"
            }
        }
        template = {
            metadata = {
                labels = {
                    app = "keycloak"
                }
            }
            spec = {
                containers = [
                    {
                        name = "keycloak"
                        image = "quay.io/keycloak/keycloak:latest"
                        args = ["start"]
                        ports = [
                            {
                                containerPort = 8443
                            }
                        ]
                        env = [
                            {
                                name = "KEYCLOAK_ADMIN"
                                value = "admin"
                            },
                            {
                                name = "KEYCLOAK_ADMIN_PASSWORD"
                                valueFrom = {
                                    secretKeyRef = {
                                        name = "rds-credentials-xdatabase-example-segoja7"
                                        key = "password"
                                    }
                                }
                            },
                            {
                                name = "KC_DB"
                                value = "postgres"
                            },
                            {
                                name = "KC_DB_URL_HOST"
                                valueFrom = {
                                    secretKeyRef = {
                                        name = "rds-credentials-xdatabase-example-segoja7"
                                        key = "endpoint"
                                    }
                                }
                            },
                            {
                                name = "KC_DB_URL_PORT"
                                valueFrom = {
                                    secretKeyRef = {
                                        name = "rds-credentials-xdatabase-example-segoja7"
                                        key = "port"
                                    }
                                }
                            },
                            {
                                name = "KC_DB_URL_DATABASE"
                                value = "exampledb"
                            },
                            {
                                name = "KC_DB_USERNAME"
                                valueFrom = {
                                    secretKeyRef = {
                                        name = "rds-credentials-xdatabase-example-segoja7"
                                        key = "username"
                                    }
                                }
                            },
                            {
                                name = "KC_DB_PASSWORD"
                                valueFrom = {
                                    secretKeyRef = {
                                        name = "rds-credentials-xdatabase-example-segoja7"
                                        key = "password"
                                    }
                                }
                            },
                            {
                                name = "KC_HOSTNAME"
                                value = "keycloak.segoja7.com"
                            },
                            {
                                name = "KC_FEATURES"
                                value = "hostname"
                            },
                            {
                                name = "KC_HTTPS_CERTIFICATE_FILE"
                                value = "/etc/x509/https/tls.crt"
                            },
                            {
                                name = "KC_HTTPS_CERTIFICATE_KEY_FILE"
                                value = "/etc/x509/https/tls.key"
                            },
                            {
                                name = "KC_HTTPS_PORT"
                                value = "8443"
                            }
                        ]
                        volumeMounts = [
                            {
                                name = "tls-certs"
                                mountPath = "/etc/x509/https"
                                readOnly = True
                            }
                        ]
                    }
                ]
                volumes = [
                    {
                        name = "tls-certs"
                        secret = {
                            secretName = "ssl-wildcard-idp"
                        }
                    }
                ]
            }
        }
    }
}
