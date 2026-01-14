resource "aws_security_group" "asg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = try(ingress.value.description, null)
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = try(ingress.value.cidr_blocks, null)
      ipv6_cidr_blocks = try(ingress.value.ipv6_cidr_blocks, null)
      security_groups  = try(ingress.value.security_groups, null)
    }
  }

  egress {
    description         = var.egress_description
    from_port           = var.egress_from_port
    to_port             = var.egress_to_port
    protocol            = var.egress_protocol
    cidr_blocks         = var.egress_cidr_blocks
    ipv6_cidr_blocks    = var.egress_ipv6_cidr_blocks
  }

  tags = var.tags
}