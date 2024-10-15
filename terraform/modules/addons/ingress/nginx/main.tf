resource "helm_release" "ingress" {
  name             = "bitnami"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "nginx"
  version          = "18.2.2"
  namespace        = "ingress-controller"
  create_namespace = true
  values           = [templatefile("${path.module}/templates/values.tpl", {})]

}

data "kubernetes_service" "ingress" {
  metadata {
    name      = "${helm_release.ingress.name}-${helm_release.ingress.chart}"
    namespace = helm_release.ingress.namespace
  }
}