output "replication_instance_arn" {
    value = aws_dms_replication_instance.instance.replication_instance_arn   
}

output "replication_instance_id" {
    value = aws_dms_replication_instance.instance.replication_instance_id   
}

output "replication_instance_private_ips" {
    value = aws_dms_replication_instance.instance.replication_instance_private_ips   
}

output "replication_instance_public_ips" {
    value = aws_dms_replication_instance.instance.replication_instance_public_ips   
}