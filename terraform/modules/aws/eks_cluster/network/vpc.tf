
resource "aws_vpc" "eks_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  lifecycle {
    create_before_destroy = true
  }
  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-vpc"
    }
  )
}