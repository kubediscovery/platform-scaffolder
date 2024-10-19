resource "kubernetes_manifest" "postgres" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "postgres"
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
        namespace = kubernetes_manifest.platform_shared.manifest.metadata.name
        server    = "https://kubernetes.default.svc"
      }
      project = kubernetes_manifest.platform_shared.manifest.metadata.name
      source = {
        chart          = "postgresql"
        repoURL        = base64decode(kubernetes_manifest.repo_bitnami.manifest.data.url)
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
              name  = "global.storageClass"
              value = var.storage.storage_class_name
            },
            {
              name  = "global.defaultStorageClass"
              value = var.storage.storage_class_name
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
              name  = "primary.persistence.volumeName"
              value = "postgres-pvc"
            },
            {
              name  = "primary.persistence.storageClass"
              value = var.storage.storage_class_name
            },
            {
              name  = "primary.persistence.existingClaim"
              value = "postgres-pvc"
            },
            {
              name  = "primary.persistence.enabled"
              value = "true"
            }
          ]
        }
      }
    }
  }
}
