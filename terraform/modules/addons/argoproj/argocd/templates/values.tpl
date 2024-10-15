installCRDs: true
global:
  domain: gitops.${project_name}.synera.com.br
certificate:
  enabled: false

server:
  ingress:
    enabled: true
    ingressClassName: ${ingress_class}
    annotations:
      nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
      nginx.ingress.kubernetes.io/ssl-passthrough: "true"
    tls: false