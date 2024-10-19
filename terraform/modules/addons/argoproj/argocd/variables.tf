
variable "name" {
  type        = string
  default     = "argocd"
  description = "ArgoCD name"
}

variable "repository" {
  type        = string
  default     = "https://argoproj.github.io/argo-helm"
  description = "Repository helm to install Argo CD"
}

variable "chart" {
  type        = string
  default     = "argo-cd"
  description = "Chart of helm"
}

variable "chart_version" {
  type        = string
  default     = "7.6.12"
  description = "Chart version"
}

variable "namespace" {
  type        = string
  default     = "argoproj"
  description = "Namespace"
}

variable "installCRDs" {
  type        = bool
  default     = true
  description = "Enabled  install installCRDs"
}

variable "create_namespace" {
  type        = bool
  default     = true
  description = "Enable create a namespace"
}

variable "labels" {
  type        = map(string)
  description = "Labels to registry in Backstage and Cloud resources"
  default     = {}
}

variable "project_name" {
  type        = string
  nullable    = false
  description = "Name of the project and prefix for resources"
}

variable "ingress_class" {
  type        = string
  default     = "kong"
  description = "Ingress class to use in the ArgoCD"
}

variable "storage" {
  type = object({
    storage_class_name = string
    persistent_volume_name = string
    persistent_volume_size = string
  })
  description = "Storage configuration for ArgoCD persistent volume"
  default = {
    persistent_volume_name = "default"
    storage_class_name     = "default"
    persistent_volume_size = "2Gi"
  }
}
