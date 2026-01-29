<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_lb.al](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | ACM certificate ARN for HTTPS listener | `string` | `null` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | Enable deletion protection for the load balancer | `bool` | `true` | no |
| <a name="input_idle_timeout"></a> [idle\_timeout](#input\_idle\_timeout) | Idle timeout in seconds (ALB only) | `number` | `60` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | Whether the load balancer is internal (true) or internet-facing (false) | `bool` | `false` | no |
| <a name="input_listeners"></a> [listeners](#input\_listeners) | List of listener configurations. | `list(object({ name = string, port = number, protocol = string, ssl_policy = optional(string), certificate_arn = optional(string), alpn_policy = optional(string), default_action = object({ type = string, target_group_arn = optional(string), redirect = optional(object({ port = string, protocol = string, status_code = string, host = optional(string), path = optional(string), query = optional(string) })), fixed_response = optional(object({ content_type = string, message_body = optional(string), status_code = string })) }) }))` | `[]` | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | Load balancer type: application (ALB) or network (NLB) | `string` | `"application"` | no |
| <a name="input_name"></a> [name](#input\_name) | Load balancer name | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of security group IDs to attach to the ALB (ignored for NLB) | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs for the load balancer (public for internet-facing, private for internal) | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to load balancer resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_arn"></a> [lb\_arn](#output\_lb\_arn) | Load balancer ARN |
| <a name="output_lb_dns_name"></a> [lb\_dns\_name](#output\_lb\_dns\_name) | Load balancer DNS name |
| <a name="output_lb_id"></a> [lb\_id](#output\_lb\_id) | Load balancer resource ID |
| <a name="output_lb_name"></a> [lb\_name](#output\_lb\_name) | Load balancer name |
| <a name="output_lb_zone_id"></a> [lb\_zone\_id](#output\_lb\_zone\_id) | Load balancer hosted zone ID (useful for Route53 alias) |
| <a name="output_listener_arns"></a> [listener\_arns](#output\_listener\_arns) | Listener ARNs keyed by listener name |
<!-- END_TF_DOCS -->

## Example

```hcl
module "lb" {
	source              = "./ec2/elb/lb"
	name                = "chatbot-ai-dev"
	internal            = false
	load_balancer_type  = "application"
	subnet_ids          = ["subnet-aaa", "subnet-bbb"]
	security_group_ids  = ["sg-aaa"]
	enable_deletion_protection = true

	listeners = [
		{
			name            = "https-back"
			port            = 443
			protocol        = "HTTPS"
			ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-2021-06"
			certificate_arn = "arn:aws:acm:us-east-2:111111111111:certificate/xxxx"
			default_action = {
				type             = "forward"
				target_group_arn = "arn:aws:elasticloadbalancing:us-east-2:111111111111:targetgroup/back/xxxx"
			}
		},
		{
			name            = "https-front"
			port            = 8443
			protocol        = "HTTPS"
			ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-2021-06"
			certificate_arn = "arn:aws:acm:us-east-2:111111111111:certificate/xxxx"
			default_action = {
				type             = "forward"
				target_group_arn = "arn:aws:elasticloadbalancing:us-east-2:111111111111:targetgroup/front/xxxx"
			}
		}
	]

	tags = {
		project = "chatbot-ai"
	}
}
```
