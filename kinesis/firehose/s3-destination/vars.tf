variable "name" {
  type        = string
  description = "(Required) A name to identify the stream. This is unique to the AWS account and region the Stream is created in."
}
variable "kinesis_stream_arn" {
  type        = string
  default     = ""
  description = "(Required) The kinesis stream used as the source of the firehose delivery stream."
}
variable "role_arn" {
  type        = string
  default     = ""
  description = "(Required) The ARN of the role that provides access to the source Kinesis stream."
}
variable "bucket_arn" {
  type        = string
  default     = null
  description = "(Required) The ARN of the S3 bucket"
}
variable "error_output_prefix" {
  type        = string
  default     = null
  description = "(Optional) Prefix added to failed records before writing them to S3. This prefix appears immediately following the bucket name."
}
variable "prefix" {
  type        = string
  default     = null
  description = "(Optional) The YYYY/MM/DD/HH time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. Note that if the prefix ends with a slash, it appears as a folder in the S3 bucket"
}
variable "s3_backup_mode" {
  type        = string
  default     = "Disabled"
  description = "(Optional) The Amazon S3 backup mode. Valid values are Disabled and Enabled. Default value is Disabled."
}
variable "buffer_size" {
  type        = number
  default     = 5
  description = "(Optional) Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The default value is 5. We recommend setting SizeInMBs to a value greater than the amount of data you typically ingest into the delivery stream in 10 seconds. For example, if you typically ingest data at 1 MB/sec set SizeInMBs to be 10 MB or higher."
}
variable "buffer_interval" {
  type        = number
  default     = 300
  description = "(Optional) Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. The default value is 300."
}

variable "cloudwatch_enable" {
  type        = bool
  default     = true
  description = "(Optional) Enables or disables the logging. Defaults to false."
}

variable "log_group_name" {
  type        = string
  default     = ""
  description = "(Optional) The CloudWatch group name for logging. This value is required if enabled is true."
}

variable "log_stream_name" {
  type        = string
  default     = ""
  description = "(Optional) The CloudWatch log stream name for logging. This value is required if enabled is true."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The list of resource TAGs"
}

variable "data_format_conversion_configuration" {
  type = object({
    enabled = bool
    input_format_configuration = object({
      deserializer = object({
        open_x_json_ser_de = object({
          case_insensitive = bool
          column_to_json_key_mappings = object(map(string))
          convert_dots_in_json_keys_to_underscores = bool
        })
      })
    })
    output_format_configuration = object({
      serializer = object({
        parquet_ser_de = object({
          block_size_bytes = number
          compression = string
          enable_dictionary_compression = bool
          max_padding_bytes = number
          page_size_bytes = number
          writer_version = string
        })
      })
    })
    schema_configuration = object({
      database_name = string
      region = string
      role_arn = string
      table_name = string
      version_id = string
    })
  })
  default = {}
  description = "(Optional) Nested argument for the serializer, deserializer, and schema for converting data from the JSON format to the Parquet or ORC format before writing it to Amazon S3. More details given below."
}

variable "server_side_encryption" {
  type = object({
    enabled = bool
  })
  default = {
    enabled = false
  }
  description = "(Optional) Encrypt at rest options. Server-side encryption should not be enabled when a kinesis stream is configured as the source of the firehose delivery stream."
}