output "name" {
    description = "The name of the ASG"
    value       = aws_autoscaling_group.asg.name
}

output "launch_configuration" {
    description = "The launch_configuration of the ASG"
    value       = aws_autoscaling_group.asg.launch_configuration
}

output "vpc_zone_identifier" {
    description = "The vpc_zone_identifier of the ASG"
    value       = aws_autoscaling_group.asg.vpc_zone_identifier
}
