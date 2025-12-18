resource "aws_lb_target_group" "altg" {
  name        = var.tg_name
  port        = var.tg_port
  protocol    = var.tg_protocol
  vpc_id      = var.vpc_id
  target_type = var.tg_target_type

  health_check {
    path                = var.health_check_path
    protocol            = var.tg_protocol
    matcher             = var.health_check_matcher
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }

  tags = var.tags
}