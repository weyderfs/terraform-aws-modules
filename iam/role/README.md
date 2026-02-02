<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_iam_role.air](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_policy"></a> [assume\_role\_policy](#input\_assume\_role\_policy) | (Required) Policy that grants an entity permission to assume the role. | `string` | n/a | yes |
| <a name="input_managed_policy_arns"></a> [managed\_policy\_arns](#input\_managed\_policy\_arns) | (Optional) Set of IAM managed policy ARNs to attach to the role. | `list(string)` | `[]` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | (Optional) Maximum session duration (in seconds) for the role. Valid range is 1 hour to 12 hours. | `string` | `3600` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required, Forces new resource) Friendly name of the role. If omitted, Terraform will assign a random, unique name. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value mapping of tags for the IAM role. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | n/a |
<!-- END_TF_DOCS -->
