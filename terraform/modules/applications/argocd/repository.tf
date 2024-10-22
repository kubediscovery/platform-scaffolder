resource "kubernetes_manifest" "repo_argoproj" {
  manifest = {
    apiVersion = "v1"
    kind        = "Secret"
    metadata = {
      name      = "repo-argoproj"
      namespace = "argoproj"
      labels    = merge(var.labels, { "argocd.argoproj.io/secret-type" = "repository" })
    }

    data = {

      name    = base64encode("argoproj")
      project = base64encode(var.project_name)
      type    = base64encode("helm")
      url     = base64encode("https://argoproj.github.io/argo-helm/")
    }
    type = "Opaque"
  }
}

resource "kubernetes_manifest" "repo_bitnami" {
  manifest = {
    apiVersion = "v1"
    kind        = "Secret"
    metadata = {
      name      = "repo-bitnami"
      namespace = "argoproj"
      labels    = merge(var.labels, { "argocd.argoproj.io/secret-type" = "repository" })
    }

    data = {

      name    = base64encode("bitnami")
      project = base64encode(var.project_name)
      type    = base64encode("helm")
      url     = base64encode("https://charts.bitnami.com/bitnami")
    }
    type = "Opaque"
  }
}



