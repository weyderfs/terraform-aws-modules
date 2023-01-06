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
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Fo what you be use this SG? | `string` | n/a | yes |
| <a name="input_egress"></a> [egress](#input\_egress) | Egress Rules | <pre>list(object({<br>    description = string,<br>    from_port   = number,<br>    to_port     = number,<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_ingress"></a> [ingress](#input\_ingress) | Ingress Rules | <pre>list(object({<br>    description = string,<br>    from_port   = number,<br>    to_port     = number,<br>    protocol    = string,<br>    cidr_blocks = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_ingress_sg"></a> [ingress\_sg](#input\_ingress\_sg) | Ingress Rules | <pre>list(object({<br>    description     = string,<br>    from_port       = number,<br>    to_port         = number,<br>    protocol        = string,<br>    security_groups = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of SG | `string` | n/a | yes |
| <a name="input_revoke_rules_on_delete"></a> [revoke\_rules\_on\_delete](#input\_revoke\_rules\_on\_delete) | (Optional) Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first. | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags of resource | `map(string)` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The name SG ID |
| <a name="output_name"></a> [name](#output\_name) | The name SG name |
<!-- END_TF_DOCS -->