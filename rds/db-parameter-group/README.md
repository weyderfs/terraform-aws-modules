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
| [aws_db_parameter_group.dpg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | The description of Parameter Group resource | `string` | n/a | yes |
| <a name="input_family"></a> [family](#input\_family) | The Family RDS used | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of Parameter Group resource | `string` | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | (Optional) A list of DB parameters to apply. Note that parameters may differ from a family to an other. | `list(map(string))` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The Tag list | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Parameter Group arn |
| <a name="output_id"></a> [id](#output\_id) | Parameter Group id |
<!-- END_TF_DOCS -->