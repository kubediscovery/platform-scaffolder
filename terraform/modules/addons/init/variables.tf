variable "tags" {
  type        = map(string)
  description = "Tags to be added to the AWS resources"
  default = {
    Environment = "dev"
    PartOf      = "learn-aws"
  }
}

variable "cloud_provider" {
  type        = string
  default     = "aws"
  description = "Name of the cloud provider"
  validation {
    condition     = var.cloud_provider == "aws" || var.cloud_provider == "azure"
    error_message = "Cloud provider must be either 'aws' or 'azure'"
  }
}

variable "project_name" {
  type        = string
  description = "Name of the project and prefix for resources"
}

variable "cluster_endpoint" {
  type        = string
  description = "Address endpoint of the cluster. E.g. https://cluster-endpoint:6443"
}

variable "cluster_ca_certificate" {
  type        = string
  description = "value of the cluster certificate authority data. E.g. base64 encoded string"
}

variable "cluster_token" {
  type        = string
  description = "value of the cluster token."
}

variable "enabled_addons" {
  type        = any
  description = "Enabled addons for the cluster"
  default     = {}
}
