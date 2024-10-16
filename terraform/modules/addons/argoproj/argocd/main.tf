/**
 * # Main title
 *
 * ArgoProj - ArgoCD
 *
 * Module to deploy install in Kubernetes the ArgoCD
 */

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

  lifecycle {
    prevent_destroy = true
  }
}

data "kubernetes_service" "argocd_server" {
  metadata {
    name      = "argocd-server"
    namespace = helm_release.argocd.namespace
  }
}

data "kubernetes_secret" "argocd_server" {
  metadata {
    name      = "argocd-initial-admin-secret"
    namespace = helm_release.argocd.namespace
  }
}

data "kubernetes_endpoints_v1" "argocd_server" {
  metadata {
    name      = "argocd-server"
    namespace = helm_release.argocd.namespace
  }
}
