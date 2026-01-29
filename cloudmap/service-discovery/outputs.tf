output "namespace_id" {
  description = "ID of the private DNS namespace"
  value       = aws_service_discovery_private_dns_namespace.asdpdn.id
}

output "namespace_arn" {
  description = "ARN of the private DNS namespace"
  value       = aws_service_discovery_private_dns_namespace.asdpdn.arn
}

output "namespace_name" {
  description = "Name of the private DNS namespace"
  value       = aws_service_discovery_private_dns_namespace.asdpdn.name
}

output "services" {
  description = "Map of created services"
  value = {
    for k, v in aws_service_discovery_service.asds : k => {
      id   = v.id
      arn  = v.arn
      name = v.name
    }
  }
}