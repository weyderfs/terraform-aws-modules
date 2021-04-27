output "id" {
  value       = aws_subnet.subnet.id
  description = "The Subnet ID"
}

output "cidr_block" {
  value       = aws_subnet.subnet.cidr_block
  description = "The CIDR block"

}
