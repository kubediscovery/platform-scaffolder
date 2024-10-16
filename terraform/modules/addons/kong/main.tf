
resource "helm_release" "kong" {
  name             = var.name
  repository       = var.repository
  chart            = var.chart
  version          = var.chart_version
  namespace        = var.namespace
  create_namespace = var.create_namespace
  values           = [templatefile("${path.module}/templates/values.tpl", {})]
}

data "kubernetes_service" "kong" {
  metadata {
    name      = "${helm_release.kong.name}-${helm_release.kong.chart}"
    namespace = helm_release.kong.namespace
  }
}