# resource "argocd_repository" "kong" {
#   repo = "https://charts.konghq.com"
#   name = "kong"
#   type = "helm"
# }

resource "kubernetes_manifest" "test-configmap" {
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "Secret"
    "metadata" = {
      "name"      = "argoproj"
      "namespace" = "argoproj"
      "labels" = {
        "argocd.argoproj.io/secret-type" = "repository"
      }
    }
    "stringData" = {
      "name" = "argo"

    }
  }
}



# resource "argocd_repository" "argoproj" {
#   repo = "https://argoproj.github.io/argo-helm"
#   name = "argoproj"
#   type = "helm"
# }

# resource "argocd_repository" "newrelic" {
#   repo = "https://helm-charts.newrelic.com"
#   name = "newrelic"
#   type = "helm"
# }