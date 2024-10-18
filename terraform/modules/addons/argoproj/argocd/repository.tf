resource "kubernetes_manifest" "repo_argoproj" {
  manifest = {
    apiVersion = "v1"
    kind        = "Secret"
    metadata = {
      name      = "repo-argoproj"
      namespace = var.namespace
      labels    = merge(var.labels, { "argocd.argoproj.io/secret-type" = "repository" })
    }

    data = {

      name    = "argoproj"
      project = var.project_name
      type    = "helm"
      url     = "https://argoproj.github.io/argo-helm/"
    }
    type = "Opaque"
  }
}
