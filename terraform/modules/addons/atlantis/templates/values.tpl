
atlantisUrl: "https://atlantis.${project_name}.kubediscovery.com"

ingress:
  enabled: true
  ingressClassName: ${ingress_class}
  host: "https://atlantis.${project_name}.kubediscovery.com"
  annotations:
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
    nginx.ingress.kubernetes.io/ssl-passthrough: "true"
  tls: false

aws: {}
github: {}