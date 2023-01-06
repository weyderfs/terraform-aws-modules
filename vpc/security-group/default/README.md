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
| [aws_default_security_group.dsg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_egress"></a> [egress](#input\_egress) | Egress Rules | <pre>list(object({<br>    description = string,<br>    from_port   = number,<br>    to_port     = number,<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_ingress"></a> [ingress](#input\_ingress) | Ingress Rules | <pre>list(object({<br>    description = string,<br>    from_port   = number,<br>    to_port     = number,<br>    protocol    = string,<br>    cidr_blocks = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_ingress_sg"></a> [ingress\_sg](#input\_ingress\_sg) | Ingress Rules | <pre>list(object({<br>    description     = string,<br>    from_port       = number,<br>    to_port         = number,<br>    protocol        = string,<br>    security_groups = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | (Optional, Forces new resource) VPC ID. Note that changing the vpc\_id will not restore any default security group rules that were modified, added, or removed. It will be left in its current state. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The name SG ID |
| <a name="output_name"></a> [name](#output\_name) | The name SG ID |
<!-- END_TF_DOCS -->