terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.32.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.8.0"
    }
    # argocd = {
    #   source = "oboukili/argocd"
    #   version = "6.2.0"
    # }
  }
}

provider "kubernetes" {
  host                   = module.platform.cluster.endpoint
  cluster_ca_certificate = base64decode(module.platform.cluster.cluster_ca_certificate)
  token                  = module.platform.cluster.token
}

provider "helm" {
  debug = true
  kubernetes {
    host                   = module.platform.cluster.endpoint
    token                  = module.platform.cluster.token
    cluster_ca_certificate = base64decode(module.platform.cluster.cluster_ca_certificate)
  }
}

# provider "argocd" {
#   server_addr = "argocd.local:443"
#   auth_token  = "1234..."
# }