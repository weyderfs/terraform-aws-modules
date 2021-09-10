resource "aws_vpc_endpoint_service" "endpoint_service" {
  acceptance_required         = var.acceptance_required
  network_load_balancer_arns  = var.network_load_balancer_arns
  allowed_principals          = var.allowed_principals

  private_dns_name            = var.private_dns_name

  tags  = var.tags
}