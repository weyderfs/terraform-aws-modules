output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.asg.id
}

output "security_group_arn" {
  description = "Security Group ARN"
  value       = aws_security_group.asg.arn
}

output "security_group_name" {
  description = "Security Group name"
  value       = aws_security_group.asg.name
}
