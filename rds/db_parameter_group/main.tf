resource "aws_db_parameter_group" "dpg" {
  name   = var.name
  family = var.family

  tags = var.tags
}