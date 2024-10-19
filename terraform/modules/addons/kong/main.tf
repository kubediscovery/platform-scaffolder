
resource "helm_release" "kong" {
  name             = var.name
  repository       = var.repository
  chart            = var.chart
  version          = var.chart_version
  namespace        = kubernetes_namespace_v1.kong.metadata.0.name
  create_namespace = var.create_namespace
  values = [templatefile("${path.module}/templates/values.tpl", {
    install_crds = true
    ingress_class_name = var.ingress_class_name
  })]
}

data "kubernetes_service" "kong" {
  metadata {
    name      = "${helm_release.kong.name}-${helm_release.kong.chart}"
    namespace = helm_release.kong.namespace
  }
}

data "kubernetes_ingress_v1" "kong_manager" {
  metadata {
    name      = "${helm_release.kong.name}-kong-manager"
    namespace = helm_release.kong.namespace
  }
}

data "kubernetes_ingress_v1" "kong_portal" {
  metadata {
    name      = "${helm_release.kong.name}-kong-portal"
    namespace = helm_release.kong.namespace
  }
}

data "kubernetes_ingress_v1" "kong_portalapi" {
  metadata {
    name      = "${helm_release.kong.name}-kong-portalapi"
    namespace = helm_release.kong.namespace
  }
}

data "kubernetes_ingress_v1" "kong_admin" {
  metadata {
    name      = "${helm_release.kong.name}-kong-admin"
    namespace = helm_release.kong.namespace
  }
}
