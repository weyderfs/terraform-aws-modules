resource "aws_kms_key" "kms" {
  count                    = var.policy != null ? 1 : 0
  customer_master_key_spec = var.customer_master_key_spec
  deletion_window_in_days  = var.deletion_window_in_days
  description              = var.description
  enable_key_rotation      = var.enable_key_rotation
  is_enabled               = var.is_enabled
  key_usage                = var.key_usage
  multi_region             = var.multi_region
  policy                   = var.policy

  tags = var.tags

}

resource "aws_kms_alias" "kms_alias" {
  name          = "alias/${var.name}"
  target_key_id = aws_kms_key.kms[0].key_id
}