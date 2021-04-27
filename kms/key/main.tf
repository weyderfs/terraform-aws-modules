resource "aws_kms_key" "kms" {
    
  description               = var.description
  deletion_window_in_days   = var.deletion_window_in_days
  key_usage                 = var.key_usage
  customer_master_key_spec  = var.customer_master_key_spec
  is_enabled                = var.is_enabled
  enable_key_rotation       = var.enable_key_rotation

  tags = var.tags

}