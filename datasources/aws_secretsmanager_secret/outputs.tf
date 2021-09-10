output "value" {
  value     = data.aws_secretsmanager_secret_version.secret_val.secret_string
  sensitive = true
}
