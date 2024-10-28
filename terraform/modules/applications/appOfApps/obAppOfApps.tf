resource "kubernetes_manifest" "observability_app_of_apps" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "app-of-apps-observability"
      namespace = "argoproj"
      annotations = {
           "argocd.argoproj.io/sync-wave" = "3"
      }
      labels = {
        CreatedAt = "20241015"
        ManagedBy = "terraform"
        instance  = "internal"
        owner     = "rafael_tomelin"
        part-of   = "observability"
        system    = "app-of-apps"
        version   = "v0.1.0"
      }
    }
    spec = {
      project = "observability"
      source = {
        repoURL        = "git@github.com:kubediscovery/platform-infrastrucutre.git"
        path           = "gitops/observability"
        targetRevision = "main"
        directory = {
          recurse = true
          jsonnet = {}
        }
      }
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = "observability"
      }
      syncPolicy = {
        automated = {
          prune    = true
          selfHeal = true
        }
        syncOptions = [
          "CreateNamespace=true"
        ]
      }
    }
  }
}