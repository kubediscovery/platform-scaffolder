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

portal:
  # Enable creating a Kubernetes service for the Developer Portal
  enabled: true
  ingress:
    enabled: true
    ingressClassName: kong
    hostname: portal.platform.kubediscovery.com

portalapi:
  # Enable creating a Kubernetes service for the Developer Portal API
  enabled: true
  ingress:
    enabled: true
    ingressClassName: kong
    hostname: portalapi.platform.kubediscovery.com


enterprise:
  enabled: false
  license_secret: kong-enterprise-license

env:
  role: control_plane
  password: kong_admin_password