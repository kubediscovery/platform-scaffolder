installCRDs: ${install_crds}
global:
  enabled: true
  postgresql:
    enabled: true
    auth:
      postgresPassword: bWRRcG94d0xkMjROMVZDeDl0X3JGZEpiQ0c0ajQtZGkK
      postgresqlDatabase: kong
      postgresqlUsername: kong
      password: bWRRcG94d0xkMjROMVZDeDl0X3JGZEpiQ0c0ajQtZGkK
      username: kong

standalone:
  enabled: "false"

manager:
  enabled: true
  type: ClusterIP
  ingress:
    enabled: true
    ingressClassName: kong
    hostname: manager.platform.kubediscovery.com

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

postgresql:
  enabled: enable
  auth:
    username: kong
    database: bWRRcG94d0xkMjROMVZDeDl0X3JGZEpiQ0c0ajQtZGkK