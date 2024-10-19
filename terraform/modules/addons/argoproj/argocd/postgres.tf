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
          values = {
            auth.username = "root"
global.postgresql.auth.database =  "kubediscovery"
global.postgresql.auth.password = "root"
global.postgresql.auth.username = "root"
          }
      }
    }
  }
}
