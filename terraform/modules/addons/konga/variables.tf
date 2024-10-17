
variable "name" {
  type        = string
  default     = "konga"
  description = "Kong ingress controller name"
}

variable "repository" {
  type        = string
  default     = "https://lakshanmamalgaha96.github.io/konga-helm"
  description = "Repository helm to install Kong ingress controller"
}

variable "chart" {
  type        = string
  default     = "konga"
  description = "Chart of helm"
}

variable "chart_version" {
  type        = string
  default     = "1.1.0"
  description = "Chart version"
}

variable "namespace" {
  type        = string
  default     = "kong-controller"
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

