
resource "helm_release" "kong" {
  name             = "kong"
  repository       = "https://charts.konghq.com"
  chart            = "kong"
  version          = "2.42.0"
  namespace        = "kong-controller"
  create_namespace = true
  values           = [templatefile("${path.module}/templates/values.tpl", {})]
}

data "kubernetes_service" "kong" {
  metadata {
    name      = "${helm_release.kong.name}-${helm_release.kong.chart}"
    namespace = helm_release.kong.namespace
  }
}