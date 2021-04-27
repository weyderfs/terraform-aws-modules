resource "aws_kms_alias" "kms_alias" {
  name          = "alias/${var.name}"
  target_key_id = aws_kms_key.kms_alias.key_id