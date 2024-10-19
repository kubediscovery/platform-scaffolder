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
        syncOptions = {
          CreateNamespace = true
          Replace         = true
        }
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
      }
    }
  }
}
