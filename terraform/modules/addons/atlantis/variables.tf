
variable "name" {
  type        = string
  default     = "antlantis"
  description = "Atlantis name to install"
}

variable "repository" {
  type        = string
  default     = "https://runatlantis.github.io/helm-charts"
  description = "Repository helm to install Atlantis"
}

variable "chart" {
  type        = string
  default     = "atlantis"
  description = "Chart of helm"
}

variable "chart_version" {
  type        = string
  default     = "5.7.0"
  description = "Chart version"
}

variable "namespace" {
  type        = string
  default     = "atlantis"
  description = "Namespace"
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
  description = "Ingress class to use in the Atlantis"
}

variable "aws_config" {
  type        = map(any)
  nullable    = false
  description = "AWS configuration"
}

variable "github_config" {
  type        = map(any)
  nullable    = false
  description = "GitHub configuration to Atlantis"
}