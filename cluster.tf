module "cluster" {
  source = "github.com/MarcelliSarti/eks-vanilla?ref=0.0.7"

  providers = {
    aws  = aws
    helm = helm
  }

  project_name = "linuxtips-cluster"
  region       = var.region

  k8s_version = var.k8s_version

  ssm_vpc_id = module.vpc.vpc_id

  ssm_public_subnets = module.vpc.public_subnets

  ssm_private_subnets = local.private_subnets

  ssm_pod_subnets = local.pod_subnets

  ssm_database_subnets = module.vpc.database_subnets

  auto_scale_options = var.auto_scale_options

  nodes_instance_sizes = var.nodes_instance_sizes
}