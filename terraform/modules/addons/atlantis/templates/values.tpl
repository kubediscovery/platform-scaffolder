
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

statefulSet:
  securityContext:
    fsGroup: 1000
    runAsUser: 100
    runAsGroup: 1000
    fsGroupChangePolicy: "OnRootMismatch"


containerSecurityContext:
    allowPrivilegeEscalation: true
    # runAsNonRoot: true
    runAsUser: 100

initContainers:
    - name: volume-mount-hack
      image: busybox
      command: ["sh", "-c", "chown -R 100:1000 /atlantis-data"]
      volumeMounts:
      - name: logging-volume
        mountPath: /atlantis-data
