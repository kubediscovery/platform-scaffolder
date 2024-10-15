resource "helm_release" "eks_helm_controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = "1.4.7"
  namespace  = "kube-system"
  values = [templatefile("${path.module}/templates/values.tpl", {
    cluster_name   = var.cluster_name
    serviceAccount = kubernetes_service_account.eks_controller_sa.metadata.0.name
  })]
}