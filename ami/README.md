<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ami.ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ami) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_architecture"></a> [architecture](#input\_architecture) | (Optional) Machine architecture for created instances. Defaults to x86\_64. | `string` | `"x86_64"` | no |
| <a name="input_delete_on_termination"></a> [delete\_on\_termination](#input\_delete\_on\_termination) | (Optional) Boolean controlling whether the EBS volumes created to support each created instance will be deleted once that instance is terminated.value | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) A longer, human-readable description for the AMI. | `string` | `null` | no |
| <a name="input_device_name"></a> [device\_name](#input\_device\_name) | value | `string` | `"/dev/xvda"` | no |
| <a name="input_ena_support"></a> [ena\_support](#input\_ena\_support) | (Optional) Specifies whether enhanced networking with ENA is enabled. Defaults to false. | `bool` | `false` | no |
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | (Optional) Boolean controlling whether the created EBS volumes will be encrypted. Can't be used with snapshot\_id | `bool` | `false` | no |
| <a name="input_extra_ebs_block_device"></a> [extra\_ebs\_block\_device](#input\_extra\_ebs\_block\_device) | (Optional) Nested block describing an EBS block device that should be attached to created instances. The structure of this block is described below. | `list(object({ extra_ebs_block_device_delete_on_termination = bool, extra_ebs_block_device_device_name = string, extra_ebs_block_device_encrypted = bool, extra_ebs_block_device_iops = number, extra_ebs_block_device_snapshot_id = string, extra_ebs_block_device_volume_size = number, extra_ebs_block_device_volume_type = string }))` | `[]` | no |
| <a name="input_iops"></a> [iops](#input\_iops) | (Required only when volume\_type is io1/io2) Number of I/O operations per second the created volumes will support. | `number` | `0` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) A region-unique name for the AMI. | `string` | `null` | no |
| <a name="input_root_device_name"></a> [root\_device\_name](#input\_root\_device\_name) | (Optional) The name of the root device (for example, /dev/sda1, or /dev/xvda). | `string` | `null` | no |
| <a name="input_snapshot_id"></a> [snapshot\_id](#input\_snapshot\_id) | (Optional) The id of an EBS snapshot that will be used to initialize the created EBS volumes. If set, the volume\_size attribute must be at least as large as the referenced snapshot. | `string` | `null` | no |
| <a name="input_sriov_net_support"></a> [sriov\_net\_support](#input\_sriov\_net\_support) | (Optional) When set to simple (the default), enables enhanced networking for created instances. No other value is supported at this time. | `string` | `"simple"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The Tags to resource | `map(string)` | `{}` | no |
| <a name="input_virtualization_type"></a> [virtualization\_type](#input\_virtualization\_type) | (Optional) Keyword to choose what virtualization mode created instances will use. Can be either: paravirtual (the default) or hvm. The choice of virtualization type changes the set of further arguments that are required, as described below. | `string` | `"hvm"` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | (Required unless snapshot\_id is set) The size of created volumes in GiB. If snapshot\_id is set and volume\_size is omitted then the volume will have the same size as the selected snapsho | `number` | `15` | no |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | (Optional) The type of EBS volume to create. Can be one of standard (the default), io1, io2 or gp2. | `string` | `"ebs"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_architecture"></a> [architecture](#output\_architecture) | n/a |
| <a name="output_description"></a> [description](#output\_description) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->