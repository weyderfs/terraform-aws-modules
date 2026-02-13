variable "name" {
    type        = string
    default     = null
    description = "(Required) A region-unique name for the AMI."
}

variable "description" {
    type        = string
    default     = null
    description = "(Optional) A longer, human-readable description for the AMI."
}

variable "ena_support" {
    type        = bool
    default     = false
    description = "(Optional) Specifies whether enhanced networking with ENA is enabled. Defaults to false."
}

variable "virtualization_type" {
    type        = string
    default     = "hvm"
    description = "(Optional) Keyword to choose what virtualization mode created instances will use. Can be either: paravirtual (the default) or hvm. The choice of virtualization type changes the set of further arguments that are required, as described below."
}

variable "root_device_name" {
    type        = string
    default     = null
    description = "(Optional) The name of the root device (for example, /dev/sda1, or /dev/xvda)."
}

variable "delete_on_termination"    {
    type        = bool 
    default     = true
    description = "(Optional) Boolean controlling whether the EBS volumes created to support each created instance will be deleted once that instance is terminated.value"
}

variable "device_name"  {
    type        = string 
    default     = "/dev/xvda"
    description = "value"
}

variable "encrypted"    {
    type        = bool
    default     = false
    description = "(Optional) Boolean controlling whether the created EBS volumes will be encrypted. Can't be used with snapshot_id"
}

variable "iops" {
    type        = number
    default     = 0
    description = "(Required only when volume_type is io1/io2) Number of I/O operations per second the created volumes will support."
}

variable "snapshot_id"  {
    type        = string 
    default     = null
    description = "(Optional) The id of an EBS snapshot that will be used to initialize the created EBS volumes. If set, the volume_size attribute must be at least as large as the referenced snapshot."
}

variable "volume_size"  {
    type        = number 
    default     = 15
    description = "(Required unless snapshot_id is set) The size of created volumes in GiB. If snapshot_id is set and volume_size is omitted then the volume will have the same size as the selected snapsho"
}

variable "volume_type"  {
    type        = string
    default     = "ebs"
    description = "(Optional) The type of EBS volume to create. Can be one of standard (the default), io1, io2 or gp2."
}

variable "extra_ebs_block_device" {
    type        = list(object({ extra_ebs_block_device_delete_on_termination = bool, extra_ebs_block_device_device_name = string, extra_ebs_block_device_encrypted = bool, extra_ebs_block_device_iops = number, extra_ebs_block_device_snapshot_id = string, extra_ebs_block_device_volume_size = number, extra_ebs_block_device_volume_type = string }))
    default     = []
    description = "(Optional) Nested block describing an EBS block device that should be attached to created instances. The structure of this block is described below."  
}

variable "architecture" {
    type        = string
    default     = "x86_64"
    description = "(Optional) Machine architecture for created instances. Defaults to x86_64."
}

variable "sriov_net_support" {
    type        = string
    default     = "simple"
    description = "(Optional) When set to simple (the default), enables enhanced networking for created instances. No other value is supported at this time."
}

variable "tags" {
  type          = map(string)
  default       = {}
  description   = "The Tags to resource"
}
