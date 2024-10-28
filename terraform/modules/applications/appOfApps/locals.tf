locals {
  sourceRepos = [
    base64decode(kubernetes_manifest.repo_argoproj.manifest.data.url),
    base64decode(kubernetes_manifest.repo_bitnami.manifest.data.url),
    "git@github.com:kubediscovery/platform-infrastrucutre.git"
  ]
}