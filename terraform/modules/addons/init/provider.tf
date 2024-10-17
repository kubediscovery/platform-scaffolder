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
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.0.0-alpha1"
    }
  }
}

provider "kubernetes" {
  host                   = var.cluster_endpoint
  cluster_ca_certificate = var.cluster_ca_certificate
  token                  = var.cluster_token
}

provider "helm" {
  debug = true
  kubernetes {
    host                   = var.cluster_endpoint
    cluster_ca_certificate = var.cluster_ca_certificate
    token                  = var.cluster_token
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

