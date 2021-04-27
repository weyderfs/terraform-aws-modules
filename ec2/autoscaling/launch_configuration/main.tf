resource "aws_launch_configuration" "alc" {
  
  name                  = var.name
  image_id              = var.image_id
  instance_type         = var.instance_type
  security_groups       = var.security_groups
  iam_instance_profile  = var.iam_instance_profile
  user_data             = var.user_data

}