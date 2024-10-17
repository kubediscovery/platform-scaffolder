output "eks_vpc_config" {
  value = aws_eks_cluster.eks_cluster.vpc_config
}

output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}

output "oidc_provider" {
  value = aws_eks_cluster.eks_cluster.identity.0.oidc.0.issuer
}

output "oidc" {
  value = aws_eks_cluster.eks_cluster.identity
}

output "certificate_authority" {
  value = aws_eks_cluster.eks_cluster.certificate_authority
}

output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "raw" {
  value = aws_eks_cluster.eks_cluster
}

output "kubeconfig" {
  value = local.kubeconfig
}

output "token" {
  value = data.aws_eks_cluster_auth.this.token
}

output "security_group_id" {
  value = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}
