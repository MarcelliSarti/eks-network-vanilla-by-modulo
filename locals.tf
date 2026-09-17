locals {
  node_indices = [
    for idx, s in var.private_subnets : idx
    if length(regexall("private", s.name)) > 0
  ]

  pod_indices = [
    for idx, s in var.private_subnets : idx
    if length(regexall("pod", s.name)) > 0
  ]

  private_subnets = [for idx in local.node_indices : module.vpc.private_subnets[idx]]
  pod_subnets     = [for idx in local.pod_indices : module.vpc.private_subnets[idx]]
}