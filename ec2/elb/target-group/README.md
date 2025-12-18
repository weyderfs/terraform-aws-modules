<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_lb_target_group.altg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_health_check_healthy_threshold"></a> [health\_check\_healthy\_threshold](#input\_health\_check\_healthy\_threshold) | Number of consecutive successful checks before target is healthy | `number` | `2` | no |
| <a name="input_health_check_interval"></a> [health\_check\_interval](#input\_health\_check\_interval) | Interval between health checks (seconds) | `number` | `30` | no |
| <a name="input_health_check_matcher"></a> [health\_check\_matcher](#input\_health\_check\_matcher) | HTTP codes to match for health check | `string` | `"200-399"` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Path for health check | `string` | `"/"` | no |
| <a name="input_health_check_timeout"></a> [health\_check\_timeout](#input\_health\_check\_timeout) | Timeout for health check (seconds) | `number` | `5` | no |
| <a name="input_health_check_unhealthy_threshold"></a> [health\_check\_unhealthy\_threshold](#input\_health\_check\_unhealthy\_threshold) | Number of consecutive failed checks before target is unhealthy | `number` | `2` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the Target Group | `map(string)` | `{}` | no |
| <a name="input_tg_name"></a> [tg\_name](#input\_tg\_name) | Name of the Target Group | `string` | n/a | yes |
| <a name="input_tg_port"></a> [tg\_port](#input\_tg\_port) | Port for the Target Group (must match ECS container port) | `number` | n/a | yes |
| <a name="input_tg_protocol"></a> [tg\_protocol](#input\_tg\_protocol) | Protocol for the Target Group (HTTP or HTTPS) | `string` | `"HTTP"` | no |
| <a name="input_tg_target_type"></a> [tg\_target\_type](#input\_tg\_target\_type) | Target type for the Target Group (instance or ip) | `string` | `"ip"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID where the Target Group will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_target_group_arn"></a> [target\_group\_arn](#output\_target\_group\_arn) | ARN of the Target Group |
| <a name="output_target_group_id"></a> [target\_group\_id](#output\_target\_group\_id) | ID of the Target Group |
| <a name="output_target_group_name"></a> [target\_group\_name](#output\_target\_group\_name) | Name of the Target Group |
<!-- END_TF_DOCS -->
