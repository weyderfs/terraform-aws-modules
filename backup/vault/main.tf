resource "aws_backup_vault" "vault" {
    
  name              = var.name_vault
  kms_key_arn       = var.kms_key_arn
  recovery_points   = var.recovery_points

}
