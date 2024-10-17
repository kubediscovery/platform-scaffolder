resource "kubernetes_namespace_v1" "kong" {
  metadata {
    name   = var.namespace
    labels = var.labels
  }
}

resource "kubernetes_secret_v1" "license" {
  metadata {
    name      = var.name
    namespace = kubernetes_namespace_v1.kong.metadata.0.name
    labels    = var.labels
  }
  data = {
    license = "'{}'"
  }
}
