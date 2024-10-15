
resource "helm_release" "newrelic" {
  name             = "newrelic"
  repository       = "https://helm-charts.newrelic.com"
  chart            = "nri-bundle"
  version          = "5.0.94"
  namespace        = "newrelic"
  create_namespace = true
  values = [templatefile("${path.module}/templates/values.tpl", {
    license_key = base64decode("NDFhMWY1YTBmMTFkODk2Yzc0NTBkYWIyYTlmZTA5ZDNGRkZGTlJBTAo=")
  })]

}

data "kubernetes_service" "newrelic" {
  metadata {
    name      = "${helm_release.newrelic.name}-${helm_release.newrelic.chart}"
    namespace = helm_release.newrelic.namespace
  }
}
