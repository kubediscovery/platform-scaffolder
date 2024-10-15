output "subnet_pub_1a" {
  value = aws_subnet.eks_subnet_plublic_1a.id
}

output "subnet_pub_1b" {
  value = aws_subnet.eks_subnet_plublic_1b.id
}

output "subnet_priv_1a" {
  value = aws_subnet.eks_subnet_private_1a.id
}

output "subnet_priv_1b" {
  value = aws_subnet.eks_subnet_private_1b.id
}

output "private_subnet" {
  value = [aws_subnet.eks_subnet_private_1a.id, aws_subnet.eks_subnet_private_1b.id]
}

output "public_subnet" {
  value = [aws_subnet.eks_subnet_plublic_1a.id, aws_subnet.eks_subnet_plublic_1b.id]
}

output "vpc_arn" {
  value = aws_vpc.eks_vpc.arn
}

output "vpc_id" {
  value = aws_vpc.eks_vpc.id
}

output "eip" {
  value = [aws_eip.eks_ngw_eip_1a.id, aws_eip.eks_ngw_eip_1b.id]
}