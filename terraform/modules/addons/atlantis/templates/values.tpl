
atlantisUrl: "https://${project_name}.kubediscovery.com"

ingress:
  enabled: true
  ingressClassName: ${ingress_class}
  host: "https://${project_name}.kubediscovery.com"
  annotations:
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
    nginx.ingress.kubernetes.io/ssl-passthrough: "true"
  tls: false

aws: ${aws}

github: ${github}