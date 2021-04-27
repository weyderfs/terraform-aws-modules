resource "aws_autoscaling_group" "asg" {

  name                      = var.name
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  force_delete              = var.force_delete
  launch_configuration      = var.launch_configuration
  vpc_zone_identifier       = var.vpc_zone_identifier

  dynamic "tag" {
    for_each = var.tag
    content {
      key                 = tag.value.key
      value               = tag.value.value
      propagate_at_launch = tag.value.propagate_at_launch
    }
  }
}
