resource "aws_sagemaker_model" "sagemaker_model" {
  name                     = var.name
  execution_role_arn       = var.execution_role_arn
  enable_network_isolation = var.enable_network_isolation

  dynamic "primary_container" {
    for_each = var.primary_container
    content {
      image          = lookup(primary_container.value, "image", null)
      mode           = lookup(primary_container.value, "mode", null)
      model_data_url = lookup(primary_container.value, "model_data_url", null)
      # container_hostname = lookup(primary_container.value, "container_hostname", null)
#      dynamic "environment" {
#        for_each = length(keys(lookup(primary_container.value, "environment", {}))) == 0 ? [] : [
#          lookup(primary_container.value, "environment", {})
#        ]
#        content {
#          SAGEMAKER_CONTAINER_LOG_LEVEL       = lookup(environment.value, "SAGEMAKER_CONTAINER_LOG_LEVEL", null)
#          SAGEMAKER_ENABLE_CLOUDWATCH_METRICS = lookup(environment.value, "SAGEMAKER_ENABLE_CLOUDWATCH_METRICS", null)
#          SAGEMAKER_PROGRAM                   = lookup(environment.value, "SAGEMAKER_PROGRAM", null)
#          SAGEMAKER_REGION                    = lookup(environment.value, "SAGEMAKER_REGION", null)
#          SAGEMAKER_REQUIREMENTS              = lookup(environment.value, "SAGEMAKER_REQUIREMENTS", null)
#          SAGEMAKER_SUBMIT_DIRECTORY          = lookup(environment.value, "SAGEMAKER_SUBMIT_DIRECTORY", null)
#        }
#      }
      # image_config       = lookup(primary_container.value, "image_config", null)
    }
  }

  tags = var.tags
}
