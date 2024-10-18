
atlantisUrl: "http://atlantis.${project_name}.kubediscovery.com"

service:
  type: ClusterIP

ingress:
  enabled: true
  ingressClassName: ${ingress_class}
  host: "atlantis.${project_name}.kubediscovery.com"
  path: /
  pathType: Prefix
  # annotations:
  #   nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
  #   nginx.ingress.kubernetes.io/ssl-passthrough: "true"
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

statefulSet:
  securityContext:
    fsGroup: 1000
    runAsUser: 100
    runAsGroup: 1000
    fsGroupChangePolicy: "OnRootMismatch"


containerSecurityContext:
    privileged: true 
    runAsUser: 0

initContainers:
    - name: volume-mount-chmod
      image: busybox
      command: ["sh", "-c", "chmod -R 0770 /atlantis-data"]
      securityContext:
            privileged: true 
            runAsUser: 0
      volumeMounts:
      - name: atlantis-data
        mountPath: /atlantis-data