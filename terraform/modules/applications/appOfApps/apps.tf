# resource "kubernetes_secret_v1" "postgresql" {
#   metadata {
#     name      = "kd-postgresql"
#     namespace = local.release_namespace
#   }
#   data = {
#     password          = base64encode("kubediscovery")
#     postgres-password = base64encode("kubediscovery2024")
#     username          = base64encode("kd_admin")
#     database          = base64encode("kubediscovery")
#   }
# }

resource "kubernetes_manifest" "argo_application" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "postgresql"
      namespace = "argoproj"
      annotations = {
           "argocd.argoproj.io/sync-wave" = "3"
      }
      labels = {
        CreatedAt = "20241015"
        ManagedBy = "terraform"
        instance  = "internal"
        owner     = "rafael_tomelin"
        part-of   = "platform"
        system    = "platform"
        version   = "v0.1.0"
      }
    }
    spec = {
      project = "kubediscovery"
      source = {
        repoURL        = "git@github.com:kubediscovery/platform-infrastrucutre.git"
        path           = "gitops/"
        targetRevision = "main"
        directory = {
          recurse = true
          jsonnet = {}
        }
      }
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = "kubediscovery"
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