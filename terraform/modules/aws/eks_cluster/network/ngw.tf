resource "aws_eip" "eks_ngw_eip_1a" {
  vpc = true
  tags = merge(
    local.tags,
    {
      Name                     = "${var.project_name}-eip-1a"
      "Kubernetes.io/role/elb" = "1"
    }
  )
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_eip" "eks_ngw_eip_1b" {
  vpc = true
  tags = merge(
    local.tags,
    {
      Name                     = "${var.project_name}-eip-1b"
      "Kubernetes.io/role/elb" = "1"
    }
  )
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_nat_gateway" "eks_ngw_1a" {
  allocation_id = aws_eip.eks_ngw_eip_1a.id
  subnet_id     = aws_subnet.eks_subnet_plublic_1a.id
  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-1a"
    }
  )
}

resource "aws_nat_gateway" "eks_ngw_1b" {
  allocation_id = aws_eip.eks_ngw_eip_1b.id
  subnet_id     = aws_subnet.eks_subnet_plublic_1b.id
  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-1b"
    }
  )
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table" "eks_private_route_table_1a" {

  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1a.id
  }

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-priv-rtb-1a"
    }
  )
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table" "eks_private_route_table_1b" {

  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1b.id
  }

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-priv-rtb-1b"
    }
  )
  lifecycle {
    create_before_destroy = true
  }
}