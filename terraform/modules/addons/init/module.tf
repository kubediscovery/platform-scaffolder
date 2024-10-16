
# module "kong" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//modules/addons/kong/?ref=develop"

#   depends_on = [module.platform]
# }


# module "newrelic" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//modules/addons/newrelic?ref=develop"

#   depends_on = [module.platform]
# }

locals {
  enabled_addons = length(var.enabled_addons) > 0 ? var.enabled_addons : {
    "metrics-server"               = contains(keys(var.enabled_addons), "metrics-server") ? var.enabled_addons.metrics-server : false
    "cluster-autoscaler"           = contains(keys(var.enabled_addons), "cluster-autoscaler") ? var.enabled_addons.cluster-autoscaler : false
    "aws-node-termination-handler" = contains(keys(var.enabled_addons), "aws-node-termination-handler") ? var.enabled_addons.aws-node-termination-handler : false
    "argoproj-argocd"              = contains(keys(var.enabled_addons), "argoproj-argocd") ? var.enabled_addons.argoproj-argocd : false
    "argoproj-rollout"             = contains(keys(var.enabled_addons), "argoproj-rollout") ? var.enabled_addons.argoproj-rollout : false
    "kong-ingress-controller"      = contains(keys(var.enabled_addons), "kong-ingress-controller") ? var.enabled_addons.metkong-ingress-controller : false
  }
}

module "argocd" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/addons/argoproj/argocd/?ref=develop"
  count  = local.enabled_addons.argoproj-argocd ? 1 : 0




  labels       = var.tags
  project_name = var.project_name
}
