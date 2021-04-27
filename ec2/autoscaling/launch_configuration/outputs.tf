output "id" {
    description = "The id of the Launch Configuration"
    value       = aws_launch_configuration.alc.id
}

output "arn" {
    description = "The ARN of resource"
    value = aws_launch_configuration.alc.arn
}

output "security_groups" {
    description   = "The SG of resource"
    value = aws_launch_configuration.alc.security_groups
}