locals {
  sourceRepos = [
    base64decode(kubernetes_manifest.repo_argoproj.manifest.data.url),
    base64decode(kubernetes_manifest.repo_bitnami.manifest.data.url),
    base64decode(kubernetes_manifest.repo_newrelic.manifest.data.url),
    "https://github.com/kubernetes-sigs/gateway-api.git",
    "git@github.com:kubediscovery/platform-infrastrucutre.git"
  ]
}