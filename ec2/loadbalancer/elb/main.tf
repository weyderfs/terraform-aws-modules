resource "aws_elb" "elb" {

  name                        = var.elb_name
  availability_zones          = var.elb_availability_zones
  instances                   = var.elb_instances
  cross_zone_load_balancing   = var.elb_cross_zone_lb
  idle_timeout                = var.elb_idle_timeout
  connection_draining         = var.elb_connection_draining
  connection_draining_timeout = var.elb_connection_draining_timeout

  access_logs {

    bucket        = var.access_logs_bucket
    bucket_prefix = var.access_logs_bucket_prefix
    interval      = var.access_logs_interval

  }

  dynamic "listener" {
    for_each = var.elb_listener
    content {

      instance_port       = listener.value.lb_instance_port
      lb_port             = listener.value.lb_port
      lb_protocol         = listener.value.lb_protocol
      ssl_certificate_id  = listener.value.lb_ssl_certificate_id
      instance_protocol   = listener.value.lb_instance_protocol

    }
  }

  health_check {

    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.health_check_timeout
    target              = var.health_check_target
    interval            = var.health_check_interval

  }
}
