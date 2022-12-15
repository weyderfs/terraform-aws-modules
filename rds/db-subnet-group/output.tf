output "id" {
  value       = aws_db_subnet_group.dsg.id
  description = "DB Subnet Group id"
}

output "arn" {
  value       = aws_db_subnet_group.dsg.arn
  description = "DB Subnet Group arn"
}
