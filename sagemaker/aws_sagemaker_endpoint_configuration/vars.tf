variable "production_variants" {
  type        = object({
    initial_instance_count = number, instance_type = string, accelerator_type = string, initial_variant_weight = number,
    model_name             = string, variant_name = string
  })
  description = "(Required) Fields are documented below."
}

variable "kms_key_arn" {
  type        = string
  description = "(Optional) Amazon Resource Name (ARN) of a AWS Key Management Service key that Amazon SageMaker uses to encrypt data on the storage volume attached to the ML compute instance that hosts the endpoint."
}

variable "name" {
  type        = string
  description = "(Optional) The name of the model (must be unique). If omitted, Terraform will assign a random, unique name."
}
variable "data_capture_config" {
  type        = object({
    initial_sampling_percentage = number, destination_s3_uri = string,
    capture_options             = object({ capture_mode = string }), kms_key_id = string,
    enable_capture              = bool,
    capture_content_type_header = object({ csv_content_types = string, json_content_types = string })
  })
  description = "(Optional) Specifies the parameters to capture input/output of Sagemaker models endpoints. Fields are documented below."
}
variable "async_inference_config" {
  type        = object({
    output_config = object({
      s3_output_path      = string, kms_key_id = string,
      notification_config = object({ error_topic = string, success_topic = string })
    }),
    client_config = object({ max_concurrent_invocations_per_instance = number })
  })
  description = "(Optional) Specifies configuration for how an endpoint performs asynchronous inference."
}

variable "tags" {
  type    = map(string)
  default = {}
}

