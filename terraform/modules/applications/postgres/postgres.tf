resource "kubernetes_manifest" "postgresql" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = local.release_name
      namespace = "argoproj"
      labels    = var.labels
    }
    spec = {
      syncPolicy = {
        automated = {
          prune    = "true"
          selfHeal = "true"
        }
        syncOptions = [
        "CreateNamespace=true"]
      }
      destination = {
        namespace = local.release_namespace
        server    = "https://kubernetes.default.svc"
      }
      project = local.release_namespace
      source = {
        chart          = local.chart_name
        repoURL        = "https://charts.bitnami.com/bitnami"
        targetRevision = local.chart_version
        helm = {
          values = yamlencode({
            primary = {
              volumePermissions = {
                enabled = true
                securityContext = {
                  runAsUser = 1001
                }
              }
              # initContainers = [
              #   {
              #     name    = "permission"
              #     image   = "docker.io/ubuntu:latest"
              #     command = ["chmod", "-R", "0777", "/bitnami/postgresql/data"]
              #     volumeMounts = [
              #       {
              #         mountPath = "/bitnami/postgresql/data"
              #         name      = "data"
              #       }
              #     ]
              #     securityContext = {
              #       privileged             = true
              #       readOnlyRootFilesystem = false
              #       runAsGroup             = 0
              #       runAsNonRoot           = false
              #       runAsUser              = 0
              #     }
              #   }
              # ]
            }
          })
          parameters = [
            {
              name  = "global.storageClass"
              value = "azurefile-csi"
            },
            {
              name  = "global.defaultStorageClass"
              value = "azurefile-csi"
            },
            {
              name  = "global.database"
              value = "kubediscovery"
            },
            {
              name  = "global.username"
              value = "kd_admin"
            },
            {
              name  = "diagnosticMode.enabled"
              value = "false"
            },
            {
              name  = "primary.readinessProbe.enabled"
              value = "false"
            },
            {
              name  = "primary.livenessProbe.enabled"
              value = "false"
            },
        ] }
      }
    }
  }
}
