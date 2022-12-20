output "name" {
  value = data.aws_secretsmanager_secret.ass.name
}

output "arn" {
  value = data.aws_secretsmanager_secret.ass.arn
}

output "value" {
  value     = data.aws_secretsmanager_secret_version.asv.secret_string
  sensitive = true
}