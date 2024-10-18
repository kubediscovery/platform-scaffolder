variable "tags" {
  type        = map(string)
  description = "Tags to be added to the AWS resources"
  default = {}
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
  type    = string
  default = "Name of the project and prefix for resources"
}

variable "cidr_block" {
  type        = string
  description = "Networking CIDR block to be used for the VPC"
  default     = "10.0.0.0/16"
}

variable "region" {
  type        = string
  description = "Azure region to create the resources"
}

variable "kubeconfig_aws_authenticator_command" {
  description = "Command to use to fetch AWS EKS credentials."
  type        = string
  default     = "aws-iam-authenticator"
}

variable "cluster_version" {
  type        = string
  description = "Cluster version"
  default     = "1.31"
}

variable "cluster_group_version" {
  type        = string
  description = "Cluster version"
  default     = "1.31"
}

variable "enabled_addons" {
  type        = any
  description = "Enabled addons for the cluster"
  default     = {}
}

variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token to manage DNS records"
  default     = ""
}

variable "cloudflare_zone_id" {
  type        = string
  description = "Cloudflare API token to manage DNS records"
  default     = ""
}

