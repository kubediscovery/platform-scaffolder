resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 7, 3)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true
  tags = merge(
    local.tags,
    {
      Name                              = "${var.project_name}-pri-subnet-1a"
      "Kubernetes.io/role/internal-elb" = "1"
    }
  )
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "eks_subnet_private_1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 7, 4)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true
  tags = merge(
    local.tags,
    {
      Name                              = "${var.project_name}-pri-subnet-1b"
      "Kubernetes.io/role/internal-elb" = "1"
    }
  )
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "eks_rtn_assoc_priv_1a" {
  subnet_id      = aws_subnet.eks_subnet_private_1a.id
  route_table_id = aws_route_table.eks_private_route_table_1a.id
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "eks_rtn_assoc_priv_1b" {
  subnet_id      = aws_subnet.eks_subnet_private_1b.id
  route_table_id = aws_route_table.eks_private_route_table_1b.id
  lifecycle {
    create_before_destroy = true
  }
}