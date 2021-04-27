output "id" {
  value = data.aws_secretsmanager_secret.ass.id
}

output "value" {
  value = data.aws_secretsmanager_secret_version.secret_string
}