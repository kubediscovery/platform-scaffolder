
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

variable "gitops_namespace" {
  type        = string
  description = "Namespace for the GitOps resources in the cluster"
  default     = ""
}
