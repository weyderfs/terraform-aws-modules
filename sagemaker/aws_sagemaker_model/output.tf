output "sagemaker_model_arn" {
  value       = aws_sagemaker_model.sagemaker_model.arn
  description = "sagemaker_model_arn"
}

output "name" {
  value       = aws_sagemaker_model.sagemaker_model.name
  description = "Sagemaker model's name"
}
