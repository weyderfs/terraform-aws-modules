resource "aws_lb" "alb" {

  name                = var.name
  ip_address_type     = var.ip_address_type
  internal            = var.internal
  idle_timeout        = var.idle_timeout
  load_balancer_type  = "application"
  security_groups     = var.security_groups
  subnets             = var.subnets
  
  enable_deletion_protection = var.enable_deletion_protection

  tags  = var.tags
}