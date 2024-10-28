
resource "kubernetes_manifest" "kubediscovery" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "AppProject"
    metadata = {
      name      = "kubediscovery"
      namespace = "argoproj"
      labels    = var.labels
      annotations = {
        "argocd.argoproj.io/sync-wave" = "2"
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
          namespace = "kubediscovery"
          server    = "*"
        },
        {
          name      = "*"
          namespace = "argoproj"
          server    = "*"
        },
        {
          name      = "*"
          namespace = "exsecrets-system"
          server    = "*"
        }
      ]
      namespaceResourceWhitelist = [
        {
          group = "*"
          kind  = "*"
        }
      ]
      sourceRepos = local.sourceRepos
    }
  }

}

resource "kubernetes_manifest" "platform_shared" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "AppProject"
    metadata = {
      name      = local.project_name
      namespace = "argoproj"
      labels    = merge(var.labels, { "app.kubernetes.io/part-of" = "platform" })
      annotations = {
        "argocd.argoproj.io/sync-wave" = "2"
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
          namespace = local.project_name
          server    = "*"
        }
      ]
      namespaceResourceWhitelist = [
        {
          group = "*"
          kind  = "*"
        }
      ]
      sourceRepos = local.sourceRepos
    }
  }

}

resource "kubernetes_manifest" "observability" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "AppProject"
    metadata = {
      name      = "observability"
      namespace = "argoproj"
      labels    = merge(var.labels, { "app.kubernetes.io/part-of" = "platform" })
      annotations = {
        "argocd.argoproj.io/sync-wave" = "2"
      }
    }
    spec = {
      clusterResourceWhitelist = [
        {
          group = "*"
          kind  = "*"
        }
      ]
      description = " Deploy of observability"
      destinations = [
        {
          name      = "*"
          namespace = "observability"
          server    = "*"
        }
      ]
      namespaceResourceWhitelist = [
        {
          group = "*"
          kind  = "*"
        }
      ]
      sourceRepos = local.sourceRepos
    }
  }

}
