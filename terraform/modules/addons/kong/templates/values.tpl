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
  type: ClusterIP
  ingress:
    enabled: true
    ingressClassName: kong
    hostname: portal.platform.kubediscovery.com

portalapi:
  # Enable creating a Kubernetes service for the Developer Portal API
  enabled: true
  type: ClusterIP
  ingress:
    enabled: true
    ingressClassName: kong
    hostname: portalapi.platform.kubediscovery.com

admin:
  enabled: true
  type: ClusterIP
  http:
    enabled: true
  ingress:
    enabled: true
    ingressClassName: kong
    hostname: admin.platform.kubediscovery.com