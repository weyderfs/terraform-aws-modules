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
| [aws_iam_access_key.user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (Required) The user's name. The name must consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-\_.. User names are not distinguished by case. For example, you cannot create users named both TESTUSER and testuser. | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | (Optional, default /) Path in which to create the user. | `string` | `"/"` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | policy - (Optional) A valid bucket policy JSON document. | `any` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | n/a | `string` | `"user_policy"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value map of tags for the IAM user | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_secret"></a> [secret](#output\_secret) | n/a |
| <a name="output_unique_id"></a> [unique\_id](#output\_unique\_id) | n/a |
<!-- END_TF_DOCS -->