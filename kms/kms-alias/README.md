<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.aka](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.akk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alias_name"></a> [alias\_name](#input\_alias\_name) | Alias name in the form 'alias/your-alias' | `string` | n/a | yes |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | KMS key deletion window | `number` | `30` | no |
| <a name="input_description"></a> [description](#input\_description) | KMS key description | `string` | `"Managed by Terraform"` | no |
| <a name="input_enable_rotation"></a> [enable\_rotation](#input\_enable\_rotation) | Enable AWS-managed annual rotation for symmetric keys | `bool` | `true` | no |
| <a name="input_key_policy"></a> [key\_policy](#input\_key\_policy) | Optional JSON policy for the KMS key | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alias_arn"></a> [alias\_arn](#output\_alias\_arn) | KMS alias ARN |
| <a name="output_alias_name"></a> [alias\_name](#output\_alias\_name) | KMS alias name |
| <a name="output_key_arn"></a> [key\_arn](#output\_key\_arn) | KMS key ARN |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | KMS key ID |
<!-- END_TF_DOCS -->
