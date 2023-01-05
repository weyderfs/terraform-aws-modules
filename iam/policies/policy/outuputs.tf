output "name" {
  description = "The Policy Name"
  value       = aws_iam_policy.policy.name
}

output "description" {
  description = "The porpouse of these policy"
  value       = aws_iam_policy.policy.description
}

output "arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = aws_iam_policy.policy.arn
}

output "path" {
  description = "The path of the policy in IAM"
  value       = aws_iam_policy.policy.path
}