output "arn" {
    value       = aws_vpc_endpoint_service.endpoint_service.arn
    description = "Amazon Resource Name (ARN) of VPC"
}

output "id" {
    value       = aws_vpc_endpoint_service.endpoint_service.id
    description = "The ID of the Endpoint"
}