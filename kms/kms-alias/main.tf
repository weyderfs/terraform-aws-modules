resource "aws_kms_key" "akk" {
  description             = var.description
  enable_key_rotation     = var.enable_rotation
  deletion_window_in_days = var.deletion_window_in_days

  policy = var.key_policy

  lifecycle {
    prevent_destroy = true
  }

  #  tags = var.tags
}

resource "aws_kms_alias" "aka" {
  name          = var.alias_name
  target_key_id = aws_kms_key.akk.key_id
}
