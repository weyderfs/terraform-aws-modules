output "name" {
  description = "Subnet Group Name"
  value       = aws_elasticache_subnet_group.aesg.name
}

output "subnet_ids" {
  description = "Subnet Group Name"
  value       = aws_elasticache_subnet_group.aesg.subnet_ids
}