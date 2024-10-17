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
  database: "postgres"
  pg_host: raja.db.elephantsql.com
  pg_port: 5432
  pg_timeout: 5000
  pg_user: qqcsmuuu
  pg_password: ${pg_password}
  pg_database: qqcsmuuu
