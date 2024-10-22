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

          ]}
        
      }
    }
  }
}


data "kubernetes_ingress_v1" "keycloak" {
  metadata {
    name      = kubernetes_manifest.keycloak.manifest.metadata.name
    namespace = kubernetes_manifest.keycloak.manifest.metadata.namespace
  }
}
