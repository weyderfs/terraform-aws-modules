resource "aws_db_parameter_group" "dpg" {
  name      = var.name
  family    = var.family
  dynamic "parameter" {
    for_each = var.parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = lookup(parameter.value, "apply_method", null)
    }
  }
  tags = var.tags
}