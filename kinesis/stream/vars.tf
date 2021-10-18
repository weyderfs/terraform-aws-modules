variable "name" {
  type         = string
  description  = "(Required) A name to identify the stream. This is unique to the AWS account and region the Stream is created in."      
}
variable "shard_count" {
   type     = number
   default  = 1
   description = "(Required) The number of shards that the stream will use. Amazon has guidelines for specifying the Stream size that should be referenced when creating a Kinesis stream"
}
variable "retention_period" {
   type     = number
   default  = 24
   description = "(Optional) Length of time data records are accessible after they are added to the stream. The maximum value of a stream's retention period is 8760 hours. Minimum value is 24. Default is 24."
}
variable "encryption_type" {
   type        = string
   default     = "NONE"
   description = "(Optional) The encryption type to use. The only acceptable values are NONE or KMS. The default value is NONE"
}
variable "tags" {
   type     = map(string)
   default  = {}
}