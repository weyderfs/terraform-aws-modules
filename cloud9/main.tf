resource "aws_cloud9_environment_ec2" "cloud9" {

  instance_type                 = var.instance_type
  name                          = var.name
  automatic_stop_time_minutes   = var.automatic_stop_time_minutes
  description                   = var.description
  owner_arn                     = var.owner_arn
  subnet_id                     = var.subnet_id

}
