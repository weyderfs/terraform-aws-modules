variable "primary_container" {
  type = list(map(string))
  default = []
}

variable "environment" {
  type    = map(string)
  default = {}
}

# variable "primary_container" {
#   type        = any
#   default     = []
#   description = "(Optional) The primary docker image containing inference code that is used when the model is deployed for predictions. If not specified, the container argument is required. Fields are documented below."
# }

variable "execution_role_arn" {
  type        = string
  description = "(Required) A role that SageMaker can assume to access model artifacts and docker images for deployment."
}

variable "name" {
  type        = string
  description = "(Optional) The name of the model (must be unique). If omitted, Terraform will assign a random, unique name."
}
variable "inference_execution_config" {
  type        = object({ mode = string })
  default     = { mode = "Serial" }
  description = "(Optional) Specifies details of how containers in a multi-container endpoint are called. see Inference Execution Config."
}
variable "container" {
  type        = any
  default     = []
  description = "(Optional) - Specifies containers in the inference pipeline. If not specified, the primary_container argument is required. Fields are documented below."
}

variable "enable_network_isolation" {
  type        = string
  description = "(Optional) - Isolates the model container. No inbound or outbound network calls can be made to or from the model container."
}

variable "vpc_config" {
  type        = string
  description = "(Optional) - Specifies the VPC that you want your model to connect to. VpcConfig is used in hosting services and in batch transform."
}

variable "tags" {
  type    = map(string)
  default = {}
}

