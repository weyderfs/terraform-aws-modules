<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_lb.al](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | ACM certificate ARN for HTTPS listener | `string` | `null` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | Enable deletion protection for ALB | `bool` | `true` | no |
| <a name="input_enable_http"></a> [enable\_http](#input\_enable\_http) | Enable HTTP listener | `bool` | `true` | no |
| <a name="input_enable_https"></a> [enable\_https](#input\_enable\_https) | Enable HTTPS listener | `bool` | `false` | no |
| <a name="input_http_default_action_type"></a> [http\_default\_action\_type](#input\_http\_default\_action\_type) | Default action type for HTTP listener | `string` | `"forward"` | no |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | HTTP listener port | `number` | `80` | no |
| <a name="input_http_protocol"></a> [http\_protocol](#input\_http\_protocol) | HTTP listener protocol | `string` | `"HTTP"` | no |
| <a name="input_http_redirect_host"></a> [http\_redirect\_host](#input\_http\_redirect\_host) | Host for redirect (use '#{host}' to preserve) | `string` | `"#{host}"` | no |
| <a name="input_http_redirect_path"></a> [http\_redirect\_path](#input\_http\_redirect\_path) | Path for redirect (use '/#{path}' to preserve) | `string` | `"/#{path}"` | no |
| <a name="input_http_redirect_port"></a> [http\_redirect\_port](#input\_http\_redirect\_port) | Redirect port for HTTP listener | `string` | `"443"` | no |
| <a name="input_http_redirect_protocol"></a> [http\_redirect\_protocol](#input\_http\_redirect\_protocol) | Redirect protocol for HTTP listener | `string` | `"HTTPS"` | no |
| <a name="input_http_redirect_query"></a> [http\_redirect\_query](#input\_http\_redirect\_query) | Query for redirect (use '#{query}' to preserve) | `string` | `"#{query}"` | no |
| <a name="input_http_redirect_status_code"></a> [http\_redirect\_status\_code](#input\_http\_redirect\_status\_code) | Redirect status code | `string` | `"HTTP_301"` | no |
| <a name="input_http_target_group_arn"></a> [http\_target\_group\_arn](#input\_http\_target\_group\_arn) | Target group ARN for HTTP listener default action | `string` | `null` | no |
| <a name="input_https_default_action_type"></a> [https\_default\_action\_type](#input\_https\_default\_action\_type) | Default action type for HTTPS listener | `string` | `"forward"` | no |
| <a name="input_https_port"></a> [https\_port](#input\_https\_port) | HTTPS listener port | `number` | `443` | no |
| <a name="input_https_protocol"></a> [https\_protocol](#input\_https\_protocol) | HTTPS listener protocol | `string` | `"HTTPS"` | no |
| <a name="input_https_target_group_arn"></a> [https\_target\_group\_arn](#input\_https\_target\_group\_arn) | Target group ARN for HTTPS listener default action | `string` | `null` | no |
| <a name="input_idle_timeout"></a> [idle\_timeout](#input\_idle\_timeout) | Idle timeout in seconds | `number` | `60` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | Whether ALB is internal (true) or internet-facing (false) | `bool` | `false` | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | Load balancer type (must be 'application' for ALB) | `string` | `"application"` | no |
| <a name="input_name"></a> [name](#input\_name) | ALB name | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of security group IDs to attach to the ALB | `list(string)` | n/a | yes |
| <a name="input_ssl_policy"></a> [ssl\_policy](#input\_ssl\_policy) | SSL policy for the HTTPS listener | `string` | `"ELBSecurityPolicy-TLS13-1-2-2021-06"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs for the ALB (public for internet-facing, private for internal) | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to ALB resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_arn"></a> [alb\_arn](#output\_alb\_arn) | ALB ARN |
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | ALB DNS name |
| <a name="output_alb_id"></a> [alb\_id](#output\_alb\_id) | ALB resource ID |
| <a name="output_alb_name"></a> [alb\_name](#output\_alb\_name) | ALB name |
| <a name="output_alb_zone_id"></a> [alb\_zone\_id](#output\_alb\_zone\_id) | ALB hosted zone ID (useful for Route53 alias) |
| <a name="output_http_listener_arn"></a> [http\_listener\_arn](#output\_http\_listener\_arn) | HTTP listener ARN (null if disabled) |
| <a name="output_https_listener_arn"></a> [https\_listener\_arn](#output\_https\_listener\_arn) | HTTPS listener ARN (null if disabled) |
<!-- END_TF_DOCS -->
