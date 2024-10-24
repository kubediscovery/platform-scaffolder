resource "kubernetes_secret_v1" "postgresql" {
  metadata {
    name      = "kd-postgresql"
    namespace = local.release_namespace
  }
  data = {
    password          = base64encode("kubediscovery")
    postgres-password = base64encode("kubediscovery2024")
    username          = base64encode("kd_admin")
    database          = base64encode("kubediscovery")
  }
}

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
              name  = "global.existingSecret"
              value = kubernetes_secret_v1.postgresql.metadata.0.name
            },
            {
              name  = "diagnosticMode.enabled"
              value = "false"
            },
            {
              name  = "primary.readinessProbe.enabled"
              value = "false"
            },
            {
              name  = "primary.livenessProbe.enabled"
              value = "false"
            },
        ] }
      }
    }
  }
}
