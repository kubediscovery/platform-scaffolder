
# module "kong" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//modules/addons/kong/?ref=develop"

#   depends_on = [module.platform]
# }


locals {
  empty_addons = {
    "metrics-server" = {
      enabled = false
    }
    "cluster-autoscaler" = {
      enabled = false
    }
    "aws-node-termination-handler" = {
      enabled = false
    }
    "argoproj-argocd" = {
      enabled = false
    }
    "argoproj-rollout" = {
      enabled = false
    }
    "kong-ingress-controller" = {
      enabled = false
    }
  }

  enabled_addons = length(var.enabled_addons) > 0 ? var.enabled_addons : {
    "metrics-server"               = contains(keys(var.enabled_addons), "metrics-server") ? var.enabled_addons.metrics-server : local.empty_addons.metrics-server
    "cluster-autoscaler"           = contains(keys(var.enabled_addons), "cluster-autoscaler") ? var.enabled_addons.cluster-autoscaler : local.empty_addons.cluster-autoscaler
    "aws-node-termination-handler" = contains(keys(var.enabled_addons), "aws-node-termination-handler") ? var.enabled_addons.aws-node-termination-handler : local.empty_addons.aws-node-termination-handler
    "argoproj-argocd"              = contains(keys(var.enabled_addons), "argoproj-argocd") ? var.enabled_addons.argoproj-argocd : local.empty_addons.argoproj-argocd
    "argoproj-rollout"             = contains(keys(var.enabled_addons), "argoproj-rollout") ? var.enabled_addons.argoproj-rollout : local.empty_addons.argoproj-rollout
    "kong-ingress-controller"      = contains(keys(var.enabled_addons), "kong-ingress-controller") ? var.enabled_addons.metkong-ingress-controller : local.empty_addons.kong-ingress-controller
  }
}

module "argocd" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/addons/argoproj/argocd/?ref=develop"
  count  = local.enabled_addons.argoproj-argocd.enabled ? 1 : 0

  labels        = var.tags
  chart_version = try(local.enabled_addons.argoproj-argocd.version, "7.5.2")
  project_name  = var.project_name
}
