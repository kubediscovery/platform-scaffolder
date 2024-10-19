resource "kubernetes_manifest" "platform" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind        = "AppProject"
    metadata = {
      name      = var.project_name
      namespace = var.namespace
      labels      = var.labels
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
      namespace = var.namespace
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
      ]
    }
  }
}


resource "kubernetes_manifest" "platform_shared" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind        = "AppProject"
    metadata = {
      name      = "${var.project_name}-website"
      namespace = var.namespace
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
          namespace = "${var.project_name}-website"
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
      ]
    }
  }
}

