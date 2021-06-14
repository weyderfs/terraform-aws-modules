output "elb_name" {
  value       = aws_elb.elb.name
  description = "ELB Name"
}

output "id" {
    value       = aws_elb.elb.id
    description = "ID of ELB"
}

output "elb_instances" {
    value = aws_elb.elb.instances
    description = "The list of instances in the ELB"
}