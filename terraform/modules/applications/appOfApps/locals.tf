locals {
  sourceRepos = [
    base64decode(kubernetes_manifest.repo_argoproj.manifest.data.url),
    base64decode(kubernetes_manifest.repo_bitnami.manifest.data.url),
    base64decode(kubernetes_manifest.repo_exsecrets.manifest.data.url),
    base64decode(kubernetes_manifest.repo_konga.manifest.data.url),
    base64decode(kubernetes_manifest.repo_kong.manifest.data.url),
    "git@github.com:kubediscovery/platform-infrastrucutre.git"
  ]

  project_name = "${var.project_name}-shared"
}