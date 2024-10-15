
resource "helm_release" "datadog" {
  name             = "datadog"
  repository       = "https://helm.datadoghq.com"
  chart            = "datadog"
  version          = "3.74.1"
  namespace        = "datadog"
  create_namespace = true
  values = [templatefile("${path.module}/templates/values.tpl", {
    secret_name = kubernetes_secret.datadog_secret.metadata.0.name
  })]

}

data "kubernetes_service" "datadog" {
  metadata {
    name      = "${helm_release.datadog.name}-${helm_release.datadog.chart}"
    namespace = helm_release.datadog.namespace
  }
}

resource "kubernetes_secret" "datadog_secret" {
  metadata {
    name      = "datalog-agent"
    namespace = "datadog"
  }

  data = {
    api-key = base64decode("YzY4NjFlMmUwZjkyZmNmMGQ5MjQ0MmYwYzcwODU1ZTgK")
  }

  type = "Opaque"
}
