output "sagemaker_model_arn" {
  value       = aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configuration.arn
  description = "sagemaker_endpoint_configuration_arn"
}

output "name" {
  value       = aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configuration.name
  description = "Sagemaker endpoint configuration's name"
}
