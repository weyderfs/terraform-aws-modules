variable "name" {
   type        = string
   description = "(Required, Forces new resource) Name of the stream consumer." 
}
variable "stream_arn" {
   type        = string
   description = "Required, Forces new resource) Amazon Resource Name (ARN) of the data stream the consumer is registered with."
}