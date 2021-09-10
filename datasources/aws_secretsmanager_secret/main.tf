data "aws_secretsmanager_secret" "secret_name" {
  name = var.name
}

data "aws_secretsmanager_secret_version" "secret_val" {
  secret_id = data.aws_secretsmanager_secret.secret_name.id
}
