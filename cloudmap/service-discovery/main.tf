resource "aws_service_discovery_private_dns_namespace" "asdpdn" {
  name            = var.namespace_name
  vpc             = var.vpc_id
  description     = var.description

  tags = var.tags
}

resource "aws_service_discovery_service" "asds" {
  for_each = var.services

  name            = each.key
  description     = each.value.description

  dns_config {
    namespace_id   = aws_service_discovery_private_dns_namespace.asdpdn.id
    
    dynamic "dns_records" {
      for_each = each.value.dns_config.dns_records
      content {
        ttl  = dns_records.value.ttl
        type = dns_records.value.type
      }
    }

    routing_policy = each.value.dns_config.routing_policy
  }

  dynamic "health_check_custom_config" {
    for_each = each.value.health_check_custom_config != null ? [each.value.health_check_custom_config] : []
    content {}
  }

  tags = var.tags
}