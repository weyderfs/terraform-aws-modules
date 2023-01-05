<!-- BEGIN_TF_DOCS -->
## Requirements

- [Registry reference](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) 

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role_policy.irp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (Optional) The name of the role policy. If omitted, Terraform will assign a random, unique name. | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | (Required) The inline policy document. This is a JSON formatted string. | `string` | n/a | yes |
| <a name="input_role"></a> [role](#input\_role) | (Required) The name of the IAM role to attach to the policy. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END_TF_DOCS -->