resource "aws_sagemaker_endpoint" "sagemaker_endpoint" {

  endpoint_config_name = var.endpoint_config_name
  deployment_config    = var.deployment_config
  name                 = var.name
  tags                 = var.tags
}