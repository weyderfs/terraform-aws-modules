variable "topic_arn" {
    type = string
    description = "(Required) The ARN of the SNS topic to subscribe to"
    validation {
        condition     = length(var.topic_arn) > 12 && substr(var.topic_arn, 0, 12) == "arn:aws:sns:"
        error_message = "The topic_arn must be a valid SNS topic ARN, starting with 'arn:aws:sns:'."
    }
}

variable "protocol" {
    type = string
    default = "sqs"
    description = "(Required) The protocol to use. The possible values for this are: sqs, sms, lambda, application, http or https."
    validation {
        condition     = contains(["sqs", "sms", "lambda", "application", "http", "https"], var.protocol)
        error_message = "The protocol value must be one of: sqs, sms, lambda, application, http or https."
    }
}

variable "endpoint" {
    type = string
    description = "(Required) The endpoint to send data to, the contents will vary with the protocol. Endpoints have different format requirements according to the protocol that is chosen. SQS endpoints come in the form of the SQS queue's ARN (not the URL of the queue) e.g: arn:aws:sqs:us-west-2:432981146916:terraform-queue-too"
}

variable "endpoint_auto_confirms" {
    type = bool
    default = false
    description = "(Optional) Boolean indicating whether the end point is capable of auto confirming subscription e.g., PagerDuty (default is false)."
}

variable "confirmation_timeout_in_minutes" {
    type = number
    default = 1
    description = "(Optional) Integer indicating number of minutes to wait in retying mode for fetching subscription arn before marking it as failure. Only applicable for http and https protocols (default is 1 minute)."
    validation {
        condition     = var.confirmation_timeout_in_minutes > 0
        error_message = "The confirmation_timeout_in_minutes value must be a positive number."
    }
}

variable "raw_message_delivery" {
    type = bool
    default = false
    description = "(Optional) Boolean indicating whether or not to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property) (default is false)"
}

variable "filter_policy" {
    type = string
    description = "(Optional) JSON String with the filter policy that will be used in the subscription to filter messages seen by the target resource. Refer to the SNS docs for more details."
}

variable "delivery_policy" {
    type = string
    description = "(Optional) JSON String with the delivery policy (retries, backoff, etc.) that will be used in the subscription - this only applies to HTTP/S subscriptions. Refer to the SNS docs for more details."
}