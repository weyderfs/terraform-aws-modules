output "sagemaker_endpoint_arn" {
  value       = aws_sagemaker_endpoint.sagemaker_endpoint.arn
  description = "sagemaker_endpoint_arn"
}

output "name" {
  value       = aws_sagemaker_endpoint.sagemaker_endpoint.name
  description = "Sagemaker endpoint's name"
}
