output "id" {
  value       = aws_db_parameter_group.dpg.id
  description = "Parameter Group id"
}

output "arn" {
  value       = aws_db_parameter_group.dpg.arn
  description = "Parameter Group arn"
}
