
atlantisUrl: "http://atlantis.${project_name}.kubediscovery.com"

ingress:
  enabled: true
  ingressClassName: ${ingress_class}
  host: "atlantis.${project_name}.kubediscovery.com"
  annotations:
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
    nginx.ingress.kubernetes.io/ssl-passthrough: "true"
  tls: false

volumeClaim:
  enabled: true
  accessMode: ReadWriteOnce
  dataStorage: 1Gi
  storageClassName: ${storage_class}

github:
  user: teste
  token: teste
  secret: teste