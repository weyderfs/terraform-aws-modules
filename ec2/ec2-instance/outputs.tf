output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = aws_instance.this.arn
}

output "private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.this.private_ip
}

output "public_ip" {
  description = "Public IP address of the EC2 instance (if applicable)"
  value       = aws_instance.this.public_ip
}

output "security_group_id" {
  description = "ID of the security group attached to the instance"
  value       = aws_security_group.instance.id
}

output "iam_role_name" {
  description = "Name of the IAM role attached to the instance"
  value       = aws_iam_role.instance.name
}

output "iam_role_arn" {
  description = "ARN of the IAM role attached to the instance"
  value       = aws_iam_role.instance.arn
}

output "instance_profile_name" {
  description = "Name of the IAM instance profile"
  value       = aws_iam_instance_profile.instance.name
}

output "ami_id" {
  description = "AMI ID used for the instance"
  value       = aws_instance.this.ami
}

output "availability_zone" {
  description = "Availability zone where the instance is running"
  value       = aws_instance.this.availability_zone
}

output "dns_name" {
  description = "DNS name of the Route53 record (if created)"
  value       = var.route53_zone_id != "" && var.route53_lookup_domain_name != "" ? aws_route53_record.instance[0].fqdn : null
}
