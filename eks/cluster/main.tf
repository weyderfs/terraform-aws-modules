resource "aws_eks_cluster" "cluster" {
  name     = var.name
  role_arn = var.role_arn
  version  = var.eks_version

  vpc_config {
    subnet_ids              = var.subnets
    endpoint_private_access = var.endpoint_private_access
    security_group_ids      = var.security_group_ids
  }

  enabled_cluster_log_types = var.enabled_cluster_log_types
}