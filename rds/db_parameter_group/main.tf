resource "aws_db_parameter_group" "dpg" {
  name      = var.name
  family    = var.family
  parameter = var.parameter

  tags = var.tags
}