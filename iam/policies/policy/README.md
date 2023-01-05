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
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | (Optional, Forces new resource) Description of the IAM policy. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Optional, Forces new resource) The name of the policy. If omitted, Terraform will assign a random, unique name. | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | (Optional, default /) Path in which to create the policy. See IAM Identifiers for more information. | `string` | `"/"` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | (Required) The policy document. This is a JSON formatted string. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The TAG list | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_description"></a> [description](#output\_description) | The porpouse of these policy |
| <a name="output_name"></a> [name](#output\_name) | The Policy Name |
| <a name="output_path"></a> [path](#output\_path) | The path of the policy in IAM |
<!-- END_TF_DOCS -->