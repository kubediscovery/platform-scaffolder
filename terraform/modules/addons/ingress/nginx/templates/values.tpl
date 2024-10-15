installCRDs: true
service:
  name: ingress-controller
  annotations:
    "service.beta.kubernetes.io/aws-load-balancer-backend-protocol": "http"
    "service.beta.kubernetes.io/aws-load-balancer-ssl-ports": "https"
    "service.beta.kubernetes.io/aws-load-balancer-type": "nlb"

global:
  nameOverride: controller
