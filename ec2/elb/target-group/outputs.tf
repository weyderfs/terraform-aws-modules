output "target_group_arn" {
  description = "ARN of the Target Group"
  value       = aws_lb_target_group.altg.arn
}

output "target_group_name" {
  description = "Name of the Target Group"
  value       = aws_lb_target_group.altg.name
}

output "target_group_id" {
  description = "ID of the Target Group"
  value       = aws_lb_target_group.altg.id
}
