
resource "kubernetes_manifest" "platform" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind        = "AppProject"
    metadata = {
      name      = "kubediscovery"
      namespace = "argoproj"
      labels      = var.labels
            annotations = {
           "argocd.argoproj.io/sync-wave" = "1"
      }
    }
    spec = {
      clusterResourceWhitelist = [
        {
          group = "*"
          kind  = "*"
        }
      ]
      description = " Deploy of platform"
      destinations = [
        {
          name      = "*"
          namespace = var.project_name
          server    = "*"
        }
      ]
      namespaceResourceWhitelist = [
        {
          group = "*"
          kind  = "*"
        }
      ]
      sourceRepos = [
       base64decode(kubernetes_manifest.repo_argoproj.manifest.data.url),
       base64decode(kubernetes_manifest.repo_bitnami.manifest.data.url),
       "git@github.com:kubediscovery/platform-infrastrucutre.git"
      ]
    }
  }

}

resource "kubernetes_manifest" "platform_shared" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind        = "AppProject"
    metadata = {
      name      = "${var.project_name}-shared"
      namespace = "argoproj"
      labels      = merge(var.labels, { "app.kubernetes.io/part-of" = "platform" })
    }
    spec = {
      clusterResourceWhitelist = [
        {
          group = "*"
          kind  = "*"
        }
      ]
      description = " Deploy of platform"
      destinations = [
        {
          name      = "*"
          namespace = "${var.project_name}-shared"
          server    = "*"
        }
      ]
      namespaceResourceWhitelist = [
        {
          group = "*"
          kind  = "*"
        }
      ]
      sourceRepos = [
       base64decode(kubernetes_manifest.repo_argoproj.manifest.data.url),
       base64decode(kubernetes_manifest.repo_bitnami.manifest.data.url),
       "git@github.com:kubediscovery/platform-infrastrucutre.git"
      ]
    }
  }

}