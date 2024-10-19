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
          parameters = [{
            name  = "auth.username"
            value = "root"
          }, {
            name  = "global.postgresql.auth.database"
            value = "kubediscovery"
          }, {
            name  = "global.postgresql.auth.username"
            value = "root"
          }]
      }
    }
  }
}
