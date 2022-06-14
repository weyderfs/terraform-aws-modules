resource "aws_sagemaker_endpoint_configuration" "sagemaker_endpoint_configuration" {
  name                   = var.name
  tags                   = var.tags
  production_variants    = var.production_variants
  kms_key_arn            = var.kms_key_arn
  data_capture_config    = var.data_capture_config
  async_inference_config = var.async_inference_config
}