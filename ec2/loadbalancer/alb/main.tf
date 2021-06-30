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

resource "aws_lb_listener" "listener" {
  count =  length(var.listeners)
  load_balancer_arn = aws_lb.alb.arn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type = var.default_action_type

    redirect {
      port        = var.port_redirect
      host        = var.host
      protocol    = var.protocol_redirect
      status_code = var.status_code
      query       = var.query
    }
  }
}

