## Commom variables
variable "region" {
  type = string
}

## Network variables
variable "vpc_cidr" {
  type        = string
  description = "CIDR principal da VPC"
}

variable "vpc_additional_cidrs" {
  type        = list(string)
  description = "Lista de CIDRs adicionais da VPC"
  default     = []
}

variable "public_subnets" {
  description = "Lista de subnets publicas da VPC"
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}

variable "private_subnets" {
  description = "Lista de subnets privadas da VPC"
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}

variable "database_subnets" {
  description = "Lista de subnets privadas da VPC"
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
  default = []
}

## Cluster variables
variable "k8s_version" {

}

variable "auto_scale_options" {
  type = object({
    min     = number
    max     = number
    desired = number
  })
}

variable "nodes_instance_sizes" {
  type = list(string)
}

variable "addon_cni_version" {
  type    = string
  default = "v1.23.0-eksbuild.1"
}

variable "addon_coredns_version" {
  type    = string
  default = "v1.13.2-eksbuild.11"
}

variable "addon_kubeproxy_version" {
  type    = string
  default = "v1.35.3-eksbuild.18"
}