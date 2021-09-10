output "arn" {
    value       = aws_vpc_endpoint.endpoint.arn
    description = "Amazon Resource Name (ARN) of VPC"
}

output "id" {
    value       = aws_vpc_endpoint.endpoint.id
    description = "The ID of the Endpoint"
}