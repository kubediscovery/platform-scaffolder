data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_eks_cluster" "current" {
  name = var.cluster_name
}
