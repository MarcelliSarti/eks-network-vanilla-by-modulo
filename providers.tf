data "aws_eks_cluster_auth" "default" {
  name = module.cluster.cluster_name
}

provider "aws" {
  region = var.region
}

provider "kubernetes" {
  host                   = module.cluster.cluster_endpoint
  cluster_ca_certificate = base64decode(module.cluster.cluster_ca_certificate)
  token                  = data.aws_eks_cluster_auth.default.token
}

provider "helm" {
  kubernetes = {
    host                   = module.cluster.cluster_endpoint
    cluster_ca_certificate = base64decode(module.cluster.cluster_ca_certificate)
    token                  = data.aws_eks_cluster_auth.default.token
  }
}