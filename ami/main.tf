resource "aws_ami" "ami" {

  name                      = var.name
  architecture              = var.architecture
  description               = var.description
  ena_support               = var.ena_support
  root_device_name          = var.root_device_name
  sriov_net_support         = var.sriov_net_support
  virtualization_type       = var.virtualization_type

  ebs_block_device {

    delete_on_termination = var.delete_on_termination
    device_name           = var.device_name
    encrypted             = var.encrypted
    iops                  = var.iops
    snapshot_id           = var.snapshot_id
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    
  }

  dynamic "ebs_block_device" {
    for_each  = var.extra_ebs_block_device
    content {

      delete_on_termination = ebs_block_device.value.extra_ebs_block_device_delete_on_termination
      device_name           = ebs_block_device.value.extra_ebs_block_device_device_name
      encrypted             = ebs_block_device.value.extra_ebs_block_device_encrypted
      iops                  = ebs_block_device.value.extra_ebs_block_device_iops
      snapshot_id           = ebs_block_device.value.extra_ebs_block_device_snapshot_id
      volume_size           = ebs_block_device.value.extra_ebs_block_device_volume_size
      volume_type           = ebs_block_device.value.extra_ebs_block_device_volume_type

    }
  }

  tags = var.tags
}