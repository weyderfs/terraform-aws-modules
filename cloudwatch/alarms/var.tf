variable "alarm_name" {
  type = string
}

variable "comparison_operator" {
  type = string
}

variable "datapoints_to_alarm" {
  type = number
}

variable "dimensions" {
  type = map
}

variable "evaluation_periods" {
  type = number
}

variable "metric_name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "period" {
  type = number
}

variable "statistic" {
  type = string
}

variable "threshold" {
  type = number
}

variable "alarm_actions" {
  type = list
}

variable "ok_actions" {
  type = list
}