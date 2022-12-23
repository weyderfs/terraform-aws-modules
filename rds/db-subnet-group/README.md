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
| [aws_db_subnet_group.dsg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | (Optional) The description of the DB subnet group. Defaults to Managed by Terraform. | `string` | `"Managed by IaC"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of Subnet group | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | (Required) A list of VPC subnet IDs. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The TAG list | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | DB Subnet Group arn |
| <a name="output_id"></a> [id](#output\_id) | DB Subnet Group id |
<!-- END_TF_DOCS -->