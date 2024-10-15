/*
*  # Terraform EKS Cluster example
*
*  ## Terraform EKS Cluster with S3 Backend
*  terraform init -upgrade -backend-config=backend.hcl
*  
* ## Terraform EKS Cluster without
*  terraform init -upgrade
*
*/
locals {
  yaml_configs = yamldecode(file("${path.module}/projects/labs.yaml"))
  tags = merge(
    local.yaml_configs.tags,
    {
      PartOf = "${local.yaml_configs.name}-on-${local.yaml_configs.provider}"
    }
  )
  region = local.yaml_configs.provider == "aws" ? "us-east-1" : "eastus"
}