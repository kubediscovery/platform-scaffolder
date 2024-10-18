/**
 * # Main title
 *
 * ArgoProj - ArgoCD
 *
 * Module to deploy install in Kubernetes the ArgoCD
 */
locals {
   publish = {
    "name"    = data.kubernetes_ingress_v1.argocd_server.spec == null ? "" : data.kubernetes_ingress_v1.argocd_server.spec.0.rules.0.host
    "address" = data.kubernetes_ingress_v1.argocd_server.status == null ? "" : try(data.kubernetes_ingress_v1.argocd_server.status.0.load_balancer.0.ingress.0.hostname, data.kubernetes_ingress_v1.argocd_server.status.0.load_balancer.0.ingress.0.ip)
    "type"    = data.kubernetes_ingress_v1.argocd_server.status == null ? "" : data.kubernetes_ingress_v1.argocd_server.status.0.load_balancer.0.ingress.0.ip != "" ? "address" : "hostname"
  }
}

resource "local_file" "name" {
  content =yamlencode( data.kubernetes_ingress_v1.argocd_server)
  filename = "${path.root}/publish_argocd.txt"
}

resource "helm_release" "argocd" {
  name             = var.name
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = var.chart
  version          = var.chart_version
  namespace        = "argoproj"
  create_namespace = var.create_namespace
  values = [templatefile("${path.module}/templates/values.tpl", {
    project_name  = var.project_name
    ingress_class = var.ingress_class
  })]
}

data "kubernetes_secret" "argocd_server" {
  metadata {
    name      = "argocd-initial-admin-secret"
    namespace = helm_release.argocd.namespace
  }
}

data "kubernetes_ingress_v1" "argocd_server" {
  metadata {
    name      = "argocd-server"
    namespace = helm_release.argocd.namespace
  }
}
