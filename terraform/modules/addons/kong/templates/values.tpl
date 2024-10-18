installCRDs: ${install_crds}
global:
  enabled: true

standalone:
  enabled: "false"

manager:
  enabled: true
  type: ClusterIP
  tls:
    enabled: false
  http:
    enabled: true
  ingress:
    enabled: true
    ingressClassName: kong
    hostname: manager.platform.kubediscovery.com

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
