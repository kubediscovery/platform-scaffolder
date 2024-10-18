
atlantisUrl: "http://atlantis.${project_name}.kubediscovery.com"

ingress:
  enabled: true
  ingressClassName: ${ingress_class}
  host: "atlantis.${project_name}.kubediscovery.com"
  annotations:
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
    nginx.ingress.kubernetes.io/ssl-passthrough: "true"
  tls: false


atlantisDataDirectory: /atlantis-data

volumeClaim:
  enabled: true
  accessMode: ReadWriteMany
  dataStorage: ${storage_size}
  storageClassName: ${storage_class}
  volumeName: "efs-standard"

github:
  user: teste
  token: teste
  secret: teste