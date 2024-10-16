/**
 * # Main title
 *
 * Atlantis is a tool for collaborating on Terraform through GitHub. Atlantis can comment on pull requests, run plan and apply, and create and manage Terraform workspaces.
 *
 * Module to deploy install in Kubernetes the Atlantis.
 */

# resource "helm_release" "atlantis" {
#   name             = var.name
#   repository       = var.repository
#   chart            = var.chart
#   version          = var.chart_version
#   namespace        = var.namespace
#   create_namespace = var.create_namespace
#   values = [templatefile("${path.module}/templates/values.tpl", {
#     project_name  = var.project_name
#     ingress_class = var.ingress_class
#     aws_config    = var.aws_config
#     github_config = var.github_config
#   })]
# }

locals {
  value = jsonencode([templatefile("${path.module}/templates/values.tpl", {
    project_name    = var.project_name
    ingress_class   = var.ingress_class
    aws_config      = var.aws_config
    github_config   = var.github_config
    atlantis_config =  var.atlantis_config
  })])
}

resource "null_resource" "name" {
  provisioner "local-exec" {
    command = "echo  ${local.value}"
  }
}

data "kubernetes_ingress_v1" "atlantis_server" {
  metadata {
    name      = "atlantis"
    namespace = helm_release.atlantis.namespace
  }
}
