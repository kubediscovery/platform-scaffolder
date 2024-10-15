locals {
  kubeconfig = templatefile("${path.module}/templates/kubeconfig.tpl", {
    cluster_arn         = resource.aws_eks_cluster.eks_cluster.arn
    cluster_name        = resource.aws_eks_cluster.eks_cluster.id
    region              = data.aws_region.current.name
    kubeconfig_id       = resource.aws_eks_cluster.eks_cluster.id
    endpoint            = resource.aws_eks_cluster.eks_cluster.endpoint
    cluster_auth_base64 = resource.aws_eks_cluster.eks_cluster.certificate_authority[0].data
    token               = data.aws_eks_cluster_auth.this.token
  })
}
