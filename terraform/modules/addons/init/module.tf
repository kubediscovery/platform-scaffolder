
# module "kong" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//modules/addons/kong/?ref=develop"

#   depends_on = [module.platform]
# }


locals {
  empty_addons = {
    "metrics_server" = {
      enabled = false
    }
    "cluster_autoscaler" = {
      enabled = false
    }
    "aws_node_termination_handler" = {
      enabled = false
    }
    "argoproj_argocd" = {
      enabled = false
    }
    "argoproj_rollout" = {
      enabled = false
    }
    "kong_ingress_controller" = {
      enabled = false
    }
  }

  # enabled_addons = length(var.enabled_addons) > 0 ? var.enabled_addons : {
  #   "metrics_server"               = contains(keys(var.enabled_addons), "metrics_server") ? var.enabled_addons.metrics_server : local.empty_addons.metrics_server
  #   "cluster_autoscaler"           = contains(keys(var.enabled_addons), "cluster_autoscaler") ? var.enabled_addons.cluster_autoscaler : local.empty_addons.cluster_autoscaler
  #   "aws_node_termination_handler" = contains(keys(var.enabled_addons), "aws_node_termination_handler") ? var.enabled_addons.aws_node_termination_handler : local.empty_addons.aws_node_termination_handler
  #   "argoproj_argocd"              = contains(keys(var.enabled_addons), "argoproj_argocd") ? var.enabled_addons.argoproj_argocd : local.empty_addons.argoproj_argocd
  #   "argoproj_rollout"             = contains(keys(var.enabled_addons), "argoproj_rollout") ? var.enabled_addons.argoproj_rollout : local.empty_addons.argoproj_rollout
  #   "kong_ingress_controller"      = contains(keys(var.enabled_addons), "kong_ingress_controller") ? var.enabled_addons.metkong_ingress_controller : local.empty_addons.kong_ingress_controller
  # }

  enabled_addons = {
    "metrics_server"               = try(var.enabled_addons.metrics_server, local.empty_addons.metrics_server)
    "cluster_autoscaler"           = try(var.enabled_addons.cluster_autoscaler, local.empty_addons.cluster_autoscaler)
    "aws_node_termination_handler" = try(var.enabled_addons.aws_node_termination_handler, local.empty_addons.aws_node_termination_handler)
    "argoproj_argocd"              = try(var.enabled_addons.argoproj_argocd, local.empty_addons.argoproj_argocd)
    "argoproj_rollout"             = try(var.enabled_addons.argoproj_rollout, local.empty_addons.argoproj_rollout)
    "kong_ingress_controller"      = try(var.enabled_addons.kong_ingress_controller, local.empty_addons.kong_ingress_controller)
  }
}

module "argocd" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/addons/argoproj/argocd/?ref=develop"
  count  = local.enabled_addons.argoproj_argocd.enabled ? 1 : 0

  labels        = var.tags
  chart_version = try(local.enabled_addons.argoproj_argocd.version, "7.5.2")
  project_name  = var.project_name
}

module "kong" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/addons/kong/?ref=develop"
  count  = local.enabled_addons.kong_ingress_controller.enabled ? 1 : 0

  labels        = var.tags
  chart_version = try(local.enabled_addons.kong_ingress_controller.version, "2.42.0")
  project_name  = var.project_name
}
