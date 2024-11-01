resource "kubernetes_manifest" "repo_argoproj" {
  manifest = {
    apiVersion = "v1"
    kind        = "Secret"
    metadata = {
      name      = "repo-argoproj"
      namespace = "argoproj"
      labels    = merge(var.labels, { "argocd.argoproj.io/secret-type" = "repository" })
      annotations = {
        "argocd.argoproj.io/sync-wave" = "1"
      }
    }

    data = {

      name    = base64encode("argoproj")
      project = base64encode(var.project_name)
      type    = base64encode("helm")
      url     = base64encode("https://argoproj.github.io/argo-helm")
    }
    type = "Opaque"
  }
}

resource "kubernetes_manifest" "repo_bitnami" {
  manifest = {
    apiVersion = "v1"
    kind        = "Secret"
    metadata = {
      name      = "repo-bitnami"
      namespace = "argoproj"
      labels    = merge(var.labels, { "argocd.argoproj.io/secret-type" = "repository" })
      annotations = {
        "argocd.argoproj.io/sync-wave" = "1"
      }
    }

    data = {

      name    = base64encode("bitnami")
      project = base64encode(var.project_name)
      type    = base64encode("helm")
      url     = base64encode("https://charts.bitnami.com/bitnami")
    }
    type = "Opaque"
  }
}

resource "kubernetes_manifest" "repo_exsecrets" {
  manifest = {
    apiVersion = "v1"
    kind        = "Secret"
    metadata = {
      name      = "repo-external-secrets"
      namespace = "argoproj"
      labels    = merge(var.labels, { "argocd.argoproj.io/secret-type" = "repository" })
      annotations = {
        "argocd.argoproj.io/sync-wave" = "1"
      }
    }

    data = {
      name    = base64encode("external-secrets")
      project = base64encode(var.project_name)
      type    = base64encode("helm")
      url     = base64encode("https://charts.external-secrets.io")
    }
    type = "Opaque"
  }
}

resource "kubernetes_manifest" "repo_konga" {
  manifest = {
    apiVersion = "v1"
    kind        = "Secret"
    metadata = {
      name      = "repo-konga"
      namespace = "argoproj"
      labels    = merge(var.labels, { "argocd.argoproj.io/secret-type" = "repository" })
      annotations = {
        "argocd.argoproj.io/sync-wave" = "1"
      }
    }

    data = {
      name    = base64encode("konga")
      project = base64encode(var.project_name)
      type    = base64encode("helm")
      url     = base64encode("https://lakshanmamalgaha96.github.io/konga-helm")
    }
    type = "Opaque"
  }
}


resource "kubernetes_manifest" "repo_kong" {
  manifest = {
    apiVersion = "v1"
    kind        = "Secret"
    metadata = {
      name      = "repo-kong"
      namespace = "argoproj"
      labels    = merge(var.labels, { "argocd.argoproj.io/secret-type" = "repository" })
      annotations = {
        "argocd.argoproj.io/sync-wave" = "1"
      }
    }

    data = {
      name    = base64encode("kong")
      project = base64encode(var.project_name)
      type    = base64encode("helm")
      url     = base64encode("https://charts.konghq.com")
    }
    type = "Opaque"
  }
}

resource "kubernetes_manifest" "repo_kd_helm" {
  manifest = {
    apiVersion = "v1"
    kind        = "Secret"
    metadata = {
      name      = "repo-kd-helm"
      namespace = "argoproj"
      labels    = merge(var.labels, { "argocd.argoproj.io/secret-type" = "repository" })
      annotations = {
        "argocd.argoproj.io/sync-wave" = "1"
      }
    }

    data = {
      name    = base64encode("kd-helm-repo")
      project = base64encode(var.project_name)
      type    = base64encode("helm")
      url     = base64encode("https://kubediscovery.github.io/helm-repo")
    }
    type = "Opaque"
  }
}

resource "kubernetes_manifest" "repo_external_dns" {
  manifest = {
    apiVersion = "v1"
    kind        = "Secret"
    metadata = {
      name      = "repo-external-dns"
      namespace = "argoproj"
      labels    = merge(var.labels, { "argocd.argoproj.io/secret-type" = "repository" })
      annotations = {
        "argocd.argoproj.io/sync-wave" = "1"
      }
    }

    data = {
      name    = base64encode("external-dns")
      project = base64encode(var.project_name)
      type    = base64encode("helm")
      url     = base64encode("https://kubernetes-sigs.github.io/external-dns")
    }
    type = "Opaque"
  }
}


resource "kubernetes_manifest" "repo_grafana" {
  manifest = {
    apiVersion = "v1"
    kind        = "Secret"
    metadata = {
      name      = "repo-grafana"
      namespace = "argoproj"
      labels    = merge(var.labels, { "argocd.argoproj.io/secret-type" = "repository" })
      annotations = {
        "argocd.argoproj.io/sync-wave" = "1"
      }
    }

    data = {
      name    = base64encode("grafana")
      project = base64encode(var.project_name)
      type    = base64encode("helm")
      url     = base64encode("https://grafana.github.io/helm-charts")
    }
    type = "Opaque"
  }
}

resource "kubernetes_manifest" "repo_prometheus" {
  manifest = {
    apiVersion = "v1"
    kind        = "Secret"
    metadata = {
      name      = "repo-prometheus"
      namespace = "argoproj"
      labels    = merge(var.labels, { "argocd.argoproj.io/secret-type" = "repository" })
      annotations = {
        "argocd.argoproj.io/sync-wave" = "1"
      }
    }

    data = {
      name    = base64encode("prometheus")
      project = base64encode(var.project_name)
      type    = base64encode("helm")
      url     = base64encode("https://prometheus-community.github.io/helm-charts")
    }
    type = "Opaque"
  }
}

resource "kubernetes_manifest" "repo_opentelemetry" {
  manifest = {
    apiVersion = "v1"
    kind        = "Secret"
    metadata = {
      name      = "repo-opentelemetry"
      namespace = "argoproj"
      labels    = merge(var.labels, { "argocd.argoproj.io/secret-type" = "repository" })
      annotations = {
        "argocd.argoproj.io/sync-wave" = "1"
      }
    }

    data = {
      name    = base64encode("opentelemetry")
      project = base64encode(var.project_name)
      type    = base64encode("helm")
      url     = base64encode("https://open-telemetry.github.io/opentelemetry-helm-charts")
    }
    type = "Opaque"
  }
}
