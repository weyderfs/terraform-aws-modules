output "arn" {
    value       = aws_vpc.vpc.arn
    description = "Amazon Resource Name (ARN) of VPC"
}

output "id" {
    value       = aws_vpc.vpc.id
    description = "The ID of the VPC"
}

output "cidr_block" {
    value       = aws_vpc.vpc.cidr_block
    description = "The CIDR block of the VPC"
}

output "instance_tenancy" {
    value       = aws_vpc.vpc.instance_tenancy
    description = "Tenancy of instances spin up within VPC."
}

output "enable_dns_support" {
    value       = aws_vpc.vpc.enable_dns_support
    description = "Whether or not the VPC has DNS support"
} 

output "default_security_group_id" {
    value       = aws_vpc.vpc.default_security_group_id
    description = "The ID of the security group created by default on VPC creation"
}

output "default_route_table_id" {
    value       = aws_vpc.vpc.default_route_table_id
    description = "The ID of the route table created by default on VPC creation"
}