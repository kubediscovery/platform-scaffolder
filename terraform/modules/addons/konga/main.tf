
resource "helm_release" "konga" {
  name             = var.name
  repository       = var.repository
  chart            = var.chart
  version          = var.chart_version
  namespace        = var.namespace
  create_namespace = var.create_namespace
  values = [templatefile("${path.module}/templates/values.tpl", {
    install_crds = true
  })]
}

# data "kubernetes_service" "kong" {
#   metadata {
#     name      = "${helm_release.kong.name}-${helm_release.kong.chart}"
#     namespace = helm_release.kong.namespace
#   }
# }

# data "kubernetes_ingress_v1" "konga" {
#   metadata {
#     name      = "${helm_release.kong.name}-kong-manager"
#     namespace = helm_release.kong.namespace
#   }
# }
