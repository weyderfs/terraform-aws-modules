output "name" {
  description = "The Policy Name"
  value       = aws_iam_policy.aip.name
}

output "arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = aws_iam_policy.aip.arn
}