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
      description = " Deploy of kubediscovery"
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
        },
        {
          name      = "*"
          namespace = "kong-system"
          server    = "*"
        },
        {
          name      = "*"
          namespace = "create-dbs"
          server    = "*"
        },
        {
          name      = "*"
          namespace = "exdns-system"
          server    = "*"
        },
        {
          name      = "*"
          namespace = "otel"
          server    = "*"
        },
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
      description = " Deploy of platform shared"
      destinations = [
        {
          name      = "*"
          namespace = "argoproj"
          server    = "*"
        },
        {
          name      = "*"
          namespace = local.project_name
          server    = "*"
        },
        {
          name      = "*"
          namespace = "ps-postgresql"
          server    = "*"
        },
        {
          name      = "*"
          namespace = "ps-redis"
          server    = "*"
        },
        {
          name      = "*"
          namespace = "ps-*"
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
        },
        {
          name      = "*"
          namespace = "otel"
          server    = "*"
        },
        {
          name      = "*"
          namespace = "argoproj"
          server    = "*"
        },
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

resource "kubernetes_manifest" "kong_api_gateway" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "AppProject"
    metadata = {
      name      = "kong-api-gateway"
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
          namespace = "kong-system"
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

