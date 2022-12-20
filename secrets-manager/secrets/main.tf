resource "random_password" "arp" {
  length           = var.random_password_lenght
  special          = var.random_password_special
  override_special = var.random_password_override_special
}

resource "aws_secretsmanager_secret" "asm" {
  name = var.aws_secretsmanager_secret_name
  tags = var.aws_secretsmanager_secret_tags
}

resource "aws_secretsmanager_secret_version" "password" {
  secret_id     = aws_secretsmanager_secret.asm.name
  secret_string = random_password.arp.result
}