variable "bucket" {
  type        = string
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name. Must be lowercase and less than or equal to 63 characters in length."
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "The resource Tags"
}
variable "acl" {
  type        = string
  default     = "private"
  description = "(Optional, Conflicts with access_control_policy) The canned ACL to apply to the bucket."
}

variable "policy" {
  type        = string
  description = "(Required) The text of the policy. Although this is a bucket policy rather than an IAM policy, the aws_iam_policy_document data source may be used, so long as it specifies a principal."
}

variable "index_document_suffix" {
  type        = string
  description = "(Required) A suffix that is appended to a request that is for a directory on the website endpoint. For example, if the suffix is index.html and you make a request to samplebucket/images/, the data that is returned will be for the object with the key name images/index.html. The suffix must not be empty and must not include a slash character."
}
variable "index_document_error_document_key" {
  type        = string
  description = "(Required) The object key name to use when a 4XX class error occurs."
}