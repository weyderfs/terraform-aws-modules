output "arn" {
    value = aws_route53_zone.zone.arn
}

output "zone_id" {
    value = aws_route53_zone.zone.zone_id
}

output "name_servers" {
    value = aws_route53_zone.zone.name_servers
}
