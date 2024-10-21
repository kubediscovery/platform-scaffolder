locals {
    gitops_source_repos_urls = [
    {
      url  = kubernetes_manifest.repo_argoproj.manifest.data.url
      name = "argoproj"
},{
      url  = kubernetes_manifest.repo_bitnami.manifest.data.url
      name = "bitnami"
},{
      url  = kubernetes_manifest.repo_bitnami.manifest.data.url
      name = "postgres"
}
  ]
}