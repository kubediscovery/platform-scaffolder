terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.108.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.32.0"
    }
  }
}
provider "kubernetes" {
  host                   = local.kube.kube_config[0].host
  cluster_ca_certificate = base64decode(local.kube.kube_config[0].cluster_ca_certificate)
  token                  = local.kube.kube_config[0].password
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
