/**
 * # Main title
 *
 * Atlantis is a tool for collaborating on Terraform through GitHub. Atlantis can comment on pull requests, run plan and apply, and create and manage Terraform workspaces.
 *
 * Module to deploy install in Kubernetes the Atlantis.
 */

# resource "local_file" "volume1" {
#   content  = var.atlantis_config.storage_class_name
#   filename = "${path.root}/volume_atlnti_sc.txt"
# }

resource "helm_release" "atlantis" {
  name             = var.name
  repository       = var.repository
  chart            = var.chart
  version          = var.chart_version
  namespace        = var.namespace
  create_namespace = var.create_namespace
  values = [templatefile("${path.module}/templates/values.tpl", {
    project_name  = var.project_name
    ingress_class = var.ingress_class
    storage_class =  "efs-sc"
    # github_config = var.github_config
  })]
}

data "kubernetes_ingress_v1" "atlantis_server" {
  metadata {
    name      = helm_release.atlantis.name
    namespace = helm_release.atlantis.namespace
  }
}
