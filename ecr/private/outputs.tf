
output "repository_name" {
  description = "Name of the ECR repository."
  value       = aws_ecr_repository.this.name
}

output "repository_arn" {
  description = "ARN of the ECR repository."
  value       = aws_ecr_repository.this.arn
}

output "repository_url" {
  description = "Repository URI used to tag/pull images (ACCOUNT_ID.dkr.ecr.REGION.amazonaws.com/NAME)."
  value       = aws_ecr_repository.this.repository_url
}

# Tags
output "tags" {
  description = "Tags applied to the ECR repository."
  value       = aws_ecr_repository.this.tags
}
