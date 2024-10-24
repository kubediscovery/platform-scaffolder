resource "kubernetes_manifest" "postgresql" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = local.release_name
      namespace = "argoproj"
      labels    = var.labels
    }
    spec = {
      syncPolicy = {
        automated = {
          prune    = "true"
          selfHeal = "true"
        }
        syncOptions = [
        "CreateNamespace=true"]
      }
      destination = {
        namespace = local.release_namespace
        server    = "https://kubernetes.default.svc"
      }
      project = local.release_namespace
      source = {
        chart          = local.chart_name
        repoURL        = "https://charts.bitnami.com/bitnami"
        targetRevision = local.chart_version
        helm = {
          parameters = [
            {
              name  = "global.storageClass"
              value = "azurefile-csi"
            },
            {
              name  = "global.defaultStorageClass"
              value = "azurefile-csi"
            },
            {
              name  = "global.database"
              value = "kubediscovery"
            },
            {
              name  = "global.username"
              value = "kd_admin"
            },
            {
              name  = "image.repository"
              value = "ubuntu"
            },
            {
              name  = "image.tag"
              value = "latest"
            },
            {
              name  = "primary.readinessProbe.enabled"
              value = "false"
            },
            {
              name  = "primary.livenessProbe.enabled"
              value = "false"
            },
                        {
              name  = "primary.command"
              value = [ "sleep" ]
            },
                                    {
              name  = "primary.args"
              value = [ "infinity" ]
            },

        ] }
      }
    }
  }
}
