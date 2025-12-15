<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_security_group.asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_egress_cidr_blocks"></a> [egress\_cidr\_blocks](#input\_egress\_cidr\_blocks) | Egress IPv4 CIDR blocks | `list(string)` | <pre>[<br/>  "0.0.0.0/0"<br/>]</pre> | no |
| <a name="input_egress_description"></a> [egress\_description](#input\_egress\_description) | Egress rule description | `string` | `"Allow all outbound"` | no |
| <a name="input_egress_from_port"></a> [egress\_from\_port](#input\_egress\_from\_port) | Egress from port | `number` | `0` | no |
| <a name="input_egress_ipv6_cidr_blocks"></a> [egress\_ipv6\_cidr\_blocks](#input\_egress\_ipv6\_cidr\_blocks) | Egress IPv6 CIDR blocks | `list(string)` | <pre>[<br/>  "::/0"<br/>]</pre> | no |
| <a name="input_egress_protocol"></a> [egress\_protocol](#input\_egress\_protocol) | Egress protocol ('-1' for all) | `string` | `"-1"` | no |
| <a name="input_egress_to_port"></a> [egress\_to\_port](#input\_egress\_to\_port) | Egress to port | `number` | `0` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | List of ingress rules. Each rule supports:<br/>- description        (optional)<br/>- from\_port          (required)<br/>- to\_port            (required)<br/>- protocol           (required, e.g., 'tcp', 'udp', '-1')<br/>- cidr\_blocks        (optional, list of CIDRs)<br/>- ipv6\_cidr\_blocks   (optional, list of IPv6 CIDRs)<br/>- security\_groups    (optional, list of SG IDs; must be in same VPC) | <pre>list(object({<br/>    description      = optional(string)<br/>    from_port        = number<br/>    to_port          = number<br/>    protocol         = string<br/>    cidr_blocks      = optional(list(string))<br/>    ipv6_cidr_blocks = optional(list(string))<br/>    security_groups  = optional(list(string))<br/>  }))</pre> | `[]` | no |
| <a name="input_sg_description"></a> [sg\_description](#input\_sg\_description) | Security Group description | `string` | `"Security group managed by Terraform"` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | Security Group name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the Security Group | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID where the Security Group will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | Security Group ARN |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | Security Group ID |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | Security Group name |
<!-- END_TF_DOCS -->
