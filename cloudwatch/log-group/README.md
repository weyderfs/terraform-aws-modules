<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.aclg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the CloudWatch Log Group | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | The number of days to retain log events in the specified log group. | `number` | `15` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the log group. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | Name of the ECR repository. |
<!-- END_TF_DOCS -->
