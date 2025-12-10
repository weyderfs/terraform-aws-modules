<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_encryption_type"></a> [encryption\_type](#input\_encryption\_type) | Encryption type: AES256 or KMS. If kms\_key\_arn is provided, set to KMS. | `string` | `"AES256"` | no |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | Controls image tag mutability: MUTABLE or IMMUTABLE. | `string` | `"IMMUTABLE"` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | Optional KMS key ARN for repository encryption (if null, ECR uses AES-256). | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the ECR repository. | `string` | n/a | yes |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Enable vulnerability scanning on image push. | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to the ECR repository. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_arn"></a> [repository\_arn](#output\_repository\_arn) | ARN of the ECR repository. |
| <a name="output_repository_name"></a> [repository\_name](#output\_repository\_name) | Name of the ECR repository. |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | Repository URI used to tag/pull images (ACCOUNT\_ID.dkr.ecr.REGION.amazonaws.com/NAME). |
| <a name="output_tags"></a> [tags](#output\_tags) | Tags applied to the ECR repository. |
<!-- END_TF_DOCS -->