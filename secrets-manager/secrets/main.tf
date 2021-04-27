data "aws_secretsmanager_secret" "ass" {
  name = var.name
}

data "aws_secretsmanager_secret_version" "asv" {
  secret_id = data.aws_secretsmanager_secret.ass.name
}