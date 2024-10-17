output "eks_vpc_config" {
  value = module.cluster.eks_vpc_config
}

output "oidc_provider" {
  value = module.cluster.oidc_provider
}

output "oidc" {
  value = module.cluster.oidc
}

output "certificate_authority" {
  value = module.cluster.certificate_authority
}

output "vpc" {
  value = {
    "id"             = module.network.vpc_id
    "public_subnet"  = module.network.public_subnet
    "private_subnet" = module.network.private_subnet
    "eip"            = module.network.eip
  }
}

output "volume" {
  value = {
    "storage_class"     = module.volume.storage_class_name
    "persistent_volume" = module.volume.persistent_volume_name
  }
}

output "cluster" {
  value = {
    "endpoint"                   = module.cluster.endpoint
    "cluster_name"               = module.cluster.cluster_name
    "cluster_id"                 = module.cluster.raw.arn
    "certificate_authority"      = module.cluster.certificate_authority
    "cluster_ca_certificate"     = module.cluster.certificate_authority[0].data
    "cluster_ca_certificate_b64" = base64encode(module.cluster.certificate_authority[0].data)
    "kubeconfig"                 = module.cluster.kubeconfig
    "token"                      = module.cluster.token
    "volume" = {
      "storage_class"     = module.volume.storage_class_name
      "persistent_volume" = module.volume.persistent_volume_name
    }
  }
}

