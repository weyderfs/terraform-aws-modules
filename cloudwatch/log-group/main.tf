resource "aws_cloudwatch_log_group" "aclg" {
  name              = var.name
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_id

  tags = var.tags
}
