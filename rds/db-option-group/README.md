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
| [aws_db_option_group.dog](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_option_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_engine_name"></a> [engine\_name](#input\_engine\_name) | The family database engine | `string` | n/a | yes |
| <a name="input_major_engine_version"></a> [major\_engine\_version](#input\_major\_engine\_version) | The version of the database | `number` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of RDS Option Group | `string` | n/a | yes |
| <a name="input_option_group_description"></a> [option\_group\_description](#input\_option\_group\_description) | The description, pourpose of the option group | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The list of Tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Option Group arn |
| <a name="output_id"></a> [id](#output\_id) | Option Group id |
<!-- END_TF_DOCS -->