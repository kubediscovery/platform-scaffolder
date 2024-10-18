installCRDs: ${install_crds}
global:
  enabled: true

standalone:
  enabled: "false"

manager:
  enabled: true
  type: ClusterIP
  ingress:
    enabled: true
    ingressClassName: kong
    hostname: manager.platform.kubediscovery.com
    annotations:
      nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
      nginx.ingress.kubernetes.io/ssl-passthrough: "true"


portalapi:
  enabled: true
  http:
    enabled: true

portalapi:
  enabled: true
  http:
    enabled: true

gateway:
  env:
    router_flavor: expressions

admin:
  enabled: true
  type: ClusterIP
  http:
    enabled: true
  ingress:
    enabled: true
    ingressClassName: kong
    hostname: admin.platform.kubediscovery.com

enterprise:
  enabled: false
  license_secret: kong-enterprise-license

env:
  password: kong_admin_password
