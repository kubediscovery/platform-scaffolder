variable "tags" {
  type        = map(string)
  description = "Tags to be added to the AWS resources"
  default = {
    Environment = "dev"
    PartOf      = "learn-aws"
  }
}

variable "project_name" {
  type        = string
  description = "Name of the project and prefix for resources"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name to create MNG"
}

variable "enabled_csi_driver" {
  type        = bool
  description = "Enable EFS CSI driver"
  default     = false
}