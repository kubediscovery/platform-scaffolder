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
        repoURL        = var.gitops_source_repos_urls["postgres"]
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
              name  = "primary.persistence.enabled"
              value = "false"
            },
            {
              name  = "primary.persistence.storageClass"
              value = var.storage.storage_class_name
            },
            
          ]
        }
      }
    }
  }
}
