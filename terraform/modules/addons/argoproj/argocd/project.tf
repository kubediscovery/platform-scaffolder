resource "kubernetes_manifest" "argo_project" {
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
       "*"
      ]


    }
  }
}


resource "local_file" "name" {
  content = yamlencode(kubernetes_manifest.repo_argoproj)
  filename = "${path.root}/repo_${var.project_name}.yaml"
}

resource "local_file" "name2" {
  content = yamlencode(kubernetes_manifest.repo_argoproj.manifest)
  filename = "${path.root}/repo_${var.project_name}.yaml"
}