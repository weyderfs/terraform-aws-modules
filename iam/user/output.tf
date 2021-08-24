output "name" {
  value = aws_iam_user.user.name
}

output "arn" {
  value = aws_iam_user.user.arn
}

output "unique_id" {
  value = aws_iam_user.user.unique_id
}

output "secret" {
  value = aws_iam_access_key.user.secret
  sensitive = true
}
