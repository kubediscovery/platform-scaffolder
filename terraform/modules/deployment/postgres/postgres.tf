resource "kubernetes_manifest" "postgres" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "postgres"
      namespace = var.gitops_namespace
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
        namespace = "platform-shared"
        server    = "https://kubernetes.default.svc"
      }
      project = "platform-shared"
      source = {
        chart          = "postgresql"
        repoURL        = "https://charts.bitnami.com/bitnami"
        targetRevision = "16.0.3"
        helm = {
          parameters = [
            {
              name  = "auth.username"
              value = "root"
            },
            {
              name  = "global.postgresql.auth.database"
              value = "kubediscovery"
            },
            {
              name  = "global.postgresql.auth.username"
              value = "root"
            },
            {
              name  = "volumePermissions.enabled"
              value = "false"
            },
                        {
              name  = "global.storageClass"
              value = var.storage.storage_class_name
            },
                                    {
              name  = "global.defaultStorageClass"
              value = var.storage.storage_class_name
            },
            {
              name  = "volumePermissions.securityContext.runAsUser"
              value = "auto"
            },
            {
              name  = "primary.persistence.storageClass"
              value = var.storage.storage_class_name
            },
            {
              name  = "primary.persistence.size"
              value = "1Gi"
            },
            {
              name  = "securityContext.enabled"
              value = "false"
            },
            {
              name  = "shmVolume.sizeLimit"
              value = "1Gi"
            },
                        {
              name  = "containerSecurityContext.enabled"
              value = "false"
            }
            
          ]
        }
      }
    }
  }
}
