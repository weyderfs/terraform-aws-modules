variable "peer_owner_id"    {
    type        = string
    default     = null
    description = "(Optional) The AWS account ID of the owner of the peer VPC. Defaults to the account ID the AWS provider is currently connected to."
}

variable "peer_vpc_id"  {
    type        = string
    default     = ""
    description = "(Required) The ID of the VPC with which you are creating the VPC Peering Connection."
}

variable "vpc_id"   {
    type        = string
    default     = ""
    description = "(Required) The ID of the requester VPC."
}

variable "auto_accept"   {
    type        = bool
    default     = true
    description = "Optional) Accept the peering (both VPCs need to be in the same AWS account)."
}

variable "peer_region"  {
    type        = bool
    default     = false
    description = "(Optional) The region of the accepter VPC of the [VPC Peering Connection]. auto_accept must be false, and use the aws_vpc_peering_connection_accepter to manage the accepter side."
}

variable "accepter" {
    type        = list
    default     = []
    description = "(Optional) - An optional configuration block that allows for [VPC Peering Connection] (https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html) options to be set for the VPC that accepts the peering connection (a maximum of one)."
}

variable "requester"    {
    type        = list
    default     = []
    description = "(Optional) - A optional configuration block that allows for [VPC Peering Connection] (https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html) options to be set for the VPC that requests the peering connection (a maximum of one)."
}

variable "name" {
    type        = string
    default     = ""
    description = "Name of Peering"
}