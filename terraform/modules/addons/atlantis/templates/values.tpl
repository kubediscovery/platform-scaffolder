
atlantisUrl: "atlantis.${project_name}.kubediscovery.com"

ingress:
  enabled: true
  ingressClassName: ${ingress_class}
  host: "atlantis.${project_name}.kubediscovery.com"
  annotations:
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
    nginx.ingress.kubernetes.io/ssl-passthrough: "true"
  tls: false


volumeClaim:
  enabled: false
  dataStorage: 1Gi
  storageClassName: gp2

storageClassName: gp2

aws: {
  %{ for key, value in aws_config ~}
  ${key}: "${value}"
  %{ endfor ~}
}
  
github: {
  %{ for key, value in github_config ~}
  ${key}: "${value}"
  %{ endfor ~}
}

atlantis: {
  %{ for key, value in atlantis_config ~}
  ${key}: "${value}"
  %{ endfor ~}
}