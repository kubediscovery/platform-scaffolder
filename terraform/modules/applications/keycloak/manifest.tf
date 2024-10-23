resource "kubernetes_manifest" "keycloak" {
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
        # values = yamlencode({
        #     extraEnvVars = [
        #       {KC_METRICS_ENABLED = "true"}
        #     ]
        # })
          parameters = [
            {
              name  = "ingress.enabled"
              value = "true"
            },
            {
              name  = "ingress.ingressClassName"
              value = "kong"
            },
            {
              name  = "ingress.hostname"
              value = "auth.kubediscovery.com"
            },
            {
              name  = "postgresql.auth.database"
              value = "keycloak"
            },
            {
              name  = "postgresql.auth.passord"
              value = base64encode("kubediscovery")
            },
            {
              name  = "postgresql.auth.existingSecret"
              value = kubernetes_secret_v1.postgresql.metadata.0.name
            },
            {
              name  = "adminIngress.ingressClassName"
              value = "kong"
            },
            {
              name  = "adminIngress.enabled"
              value = "true"
            },
        ] }
      }
    }
  }
}


data "kubernetes_ingress_v1" "keycloak" {
  metadata {
    name      = kubernetes_manifest.keycloak.manifest.metadata.name
    namespace = local.release_namespace
  }
}


resource "kubernetes_secret_v1" "postgresql" {
  metadata {
    name      = "kd-keycloak-postgresql"
    namespace = local.release_namespace
  }
  data = {
    password = base64encode("kubediscovery")
    postgres-password = base64encode("kubediscovery2024")
  }
}