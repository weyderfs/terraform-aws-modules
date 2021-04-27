resource "aws_sns_topic" "topic" {
  
  name              = var.name
  display_name      = var.display_name
  policy            = var.policy
  delivery_policy   = var.delivery_policy
  kms_master_key_id = var.kms_master_key_id

  tags  = var.tags
}