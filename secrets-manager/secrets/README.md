<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.asm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [random_password.arp](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_secretsmanager_secret_name"></a> [aws\_secretsmanager\_secret\_name](#input\_aws\_secretsmanager\_secret\_name) | Friendly name of the new secret. The secret name can consist of uppercase letters, lowercase letters, digits, and any of the following characters: /\_+=.@- | `string` | n/a | yes |
| <a name="input_aws_secretsmanager_secret_tags"></a> [aws\_secretsmanager\_secret\_tags](#input\_aws\_secretsmanager\_secret\_tags) | The resource Tags | `map(string)` | `{}` | no |
| <a name="input_random_password_lenght"></a> [random\_password\_lenght](#input\_random\_password\_lenght) | The length of the string desired. The minimum value for length is 1 and, length must also be >= (min\_upper + min\_lower + min\_numeric + min\_special | `number` | `16` | no |
| <a name="input_random_password_override_special"></a> [random\_password\_override\_special](#input\_random\_password\_override\_special) | Supply your own list of special characters to use for string generation. This overrides the default character list in the special argument. The special argument must still be set to true for any overwritten characters to be used in generation. | `string` | `"_!%^"` | no |
| <a name="input_random_password_special"></a> [random\_password\_special](#input\_random\_password\_special) | Include special characters in the result. These are !@#$%&*()-\_=+[]{}<>:? | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
<!-- END_TF_DOCS -->