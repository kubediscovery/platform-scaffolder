resource "kubernetes_manifest" "argo_project" {
  manifest = {
    api_version = "argoproj.io/v1alpha1"
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
          namespace = "*"
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
        kubernetes_manifest.argo_project.data.url
      ]


    }
  }
}
