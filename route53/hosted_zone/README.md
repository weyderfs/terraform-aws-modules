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
| [aws_route53_zone.zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comment"></a> [comment](#input\_comment) | (Optional) A comment for the hosted zone. Defaults to 'Managed by Terraform'. | `string` | `"Managed by Terraform"` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) This is the name of the hosted zone. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags. | `map(string)` | `{}` | no |
| <a name="input_vpcs"></a> [vpcs](#input\_vpcs) | (Optional) Configuration block(s) specifying VPC(s) to associate with a private hosted zone. | <pre>list(object({<br>        vpc_id = string<br>        vpc_region = string<br>    }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | n/a |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | n/a |
<!-- END_TF_DOCS -->