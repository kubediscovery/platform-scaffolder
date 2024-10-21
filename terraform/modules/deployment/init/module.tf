
module "argocd" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/deployment/argocd/?ref=develop"
  # count  = local.enabled_addons.argoproj_argocd.enabled ? 1 : 0

  labels        = var.tags
  project_name  = var.project_name
  # ingress_class = var.ingress_class_name
  storage = var.storage
  gitops_namespace = var.gitops_namespace
}


module "postgres" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/deployment/postgres/?ref=develop"
  # count  = local.enabled_addons.argoproj_argocd.enabled ? 1 : 0

  labels        = var.tags
  project_name  = var.project_name
  # ingress_class = var.ingress_class_name
  storage = var.storage
  gitops_namespace = var.gitops_namespace
  gitops_source_repos_urls = var.gitops_source_repos_urls
}

