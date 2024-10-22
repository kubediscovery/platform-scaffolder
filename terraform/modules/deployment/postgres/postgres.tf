resource "kubernetes_manifest" "postgres" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "keycloak"
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
        namespace = "platform-shared"
        server    = "https://kubernetes.default.svc"
      }
      project = "platform-shared"
      source = {
        chart          = "keycloak"
        repoURL        = "https://charts.bitnami.com/bitnami"
        targetRevision = "24.0.1"
        
      }
    }
  }
}
