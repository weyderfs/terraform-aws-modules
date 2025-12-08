## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity_providers"></a> [capacity\_providers](#input\_capacity\_providers) | List of capacity providers available in the cluster.<br/>Ex.: ["FARGATE", "FARGATE\_SPOT"] or ["FARGATE"] or ["EC2"] with previously defined providers. | `list(string)` | <pre>[<br/>  "FARGATE",<br/>  "FARGATE_SPOT"<br/>]</pre> | no |
| <a name="input_cluster_configuration"></a> [cluster\_configuration](#input\_cluster\_configuration) | Optional cluster configuration.<br/>Supports execute\_command\_configuration, including log\_configuration.<br/>Example:<br/>{<br/>  execute\_command\_configuration = {<br/>    logging = "OVERRIDE"<br/>    kms\_key\_id = "arn:aws:kms:REGION:ACCOUNT:key/ID"<br/>    log\_configuration = {<br/>      cloud\_watch\_log\_group\_name      = "/ecs/execute-command"<br/>      cloud\_watch\_encryption\_enabled  = true<br/>      s3\_bucket\_name                  = "my-bucket"<br/>      s3\_key\_prefix                   = "ecs-exec"<br/>      s3\_encryption\_enabled           = true<br/>    }<br/>  }<br/>} | <pre>object({<br/>    execute_command_configuration = optional(object({<br/>      kms_key_id = optional(string)<br/>      logging    = optional(string) # NONE | DEFAULT | OVERRIDE<br/>      log_configuration = optional(object({<br/>        cloud_watch_log_group_name      = optional(string)<br/>        cloud_watch_encryption_enabled  = optional(bool)<br/>        s3_bucket_name                  = optional(string)<br/>        s3_key_prefix                   = optional(string)<br/>        s3_encryption_enabled           = optional(bool)<br/>      }))<br/>    }))<br/>  })</pre> | `null` | no |
| <a name="input_default_capacity_provider_strategy"></a> [default\_capacity\_provider\_strategy](#input\_default\_capacity\_provider\_strategy) | Standard capacity provider strategy for services without their own strategy.<br/>Each item: { capacity\_provider = string, weight = optional number, base = optional number }<br/>Ex.: [{ capacity\_provider = "FARGATE", weight = 1 }] | <pre>list(object({<br/>    capacity_provider = string<br/>    weight            = optional(number)<br/>    base              = optional(number)<br/>  }))</pre> | <pre>[<br/>  {<br/>    "capacity_provider": "FARGATE",<br/>    "weight": 1<br/>  }<br/>]</pre> | no |
| <a name="input_enable_container_insights"></a> [enable\_container\_insights](#input\_enable\_container\_insights) | Enable Container Insights (CloudWatch). | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | ECS Cluster name | `string` | n/a | yes |
| <a name="input_service_connect_defaults"></a> [service\_connect\_defaults](#input\_service\_connect\_defaults) | Service Connect defaults (Cloud Map namespace ARN or name).<br/>Example: { namespace = "arn:aws:servicediscovery:REGION:ACCOUNT:namespace/xxxx" } or just namespace name. | <pre>object({<br/>    namespace = string<br/>  })</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Mapa de tags adicionais. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ECS Cluster ARN. |
| <a name="output_capacity_providers"></a> [capacity\_providers](#output\_capacity\_providers) | Capacity providers avaliable on cluster. |
| <a name="output_default_capacity_provider_strategy"></a> [default\_capacity\_provider\_strategy](#output\_default\_capacity\_provider\_strategy) | Standard strategy for capacity providers. |
| <a name="output_id"></a> [id](#output\_id) | ECS Cluster ID. |
| <a name="output_name"></a> [name](#output\_name) | ECS Cluster Name. |## Requirements



## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity_providers"></a> [capacity\_providers](#input\_capacity\_providers) | Lista de capacity providers associados ao cluster | `list(string)` | `[]` | no |
| <a name="input_cluster_configuration"></a> [cluster\_configuration](#input\_cluster\_configuration) | Configuration of the 'execute command' and cluster logs. | <pre>object({<br/>    execute_command_configuration = optional(object({<br/>      kms_key_id       = optional(string)<br/>      logging          = optional(string)<br/>      log_configuration = optional(object({<br/>        cloud_watch_log_group_name     = optional(string)<br/>        cloud_watch_encryption_enabled = optional(bool)<br/>      }))<br/>    }))<br/>  })</pre> | `null` | no |
| <a name="input_default_capacity_provider_strategy"></a> [default\_capacity\_provider\_strategy](#input\_default\_capacity\_provider\_strategy) | Estratégia default do cluster (lista de maps) | <pre>list(object({<br/>    capacity_provider = string<br/>    weight            = optional(number)<br/>    base              = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_enable_container_insights"></a> [enable\_container\_insights](#input\_enable\_container\_insights) | Habilita Container Insights no cluster | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Nome do ECS Cluster | `string` | n/a | yes |
| <a name="input_service_connect_defaults"></a> [service\_connect\_defaults](#input\_service\_connect\_defaults) | Namespace default for Service Connect | <pre>object({<br/>    namespace = string<br/>  })</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource Tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | ARN do ECS Cluster |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Nome do ECS Cluster |

| Name | Type |
|------|------|
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity_providers"></a> [capacity\_providers](#input\_capacity\_providers) | List of capacity providers associated with the cluster. | `list(string)` | `[]` | no |
| <a name="input_cluster_configuration"></a> [cluster\_configuration](#input\_cluster\_configuration) | Configuration of the execute command and cluster logs. | <pre>object({<br/>    execute_command_configuration = optional(object({<br/>      kms_key_id       = optional(string)<br/>      logging          = optional(string)<br/>      log_configuration = optional(object({<br/>        cloud_watch_log_group_name     = optional(string)<br/>        cloud_watch_encryption_enabled = optional(bool)<br/>      }))<br/>    }))<br/>  })</pre> | `null` | no |
| <a name="input_default_capacity_provider_strategy"></a> [default\_capacity\_provider\_strategy](#input\_default\_capacity\_provider\_strategy) | Default cluster strategy (list of maps) | <pre>list(object({<br/>    capacity_provider = string<br/>    weight            = optional(number)<br/>    base              = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_enable_container_insights"></a> [enable\_container\_insights](#input\_enable\_container\_insights) | Enable Container Insights on the cluster | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | ECS Cluster Name | `string` | n/a | yes |
| <a name="input_service_connect_defaults"></a> [service\_connect\_defaults](#input\_service\_connect\_defaults) | Namespace default for Service Connect | <pre>object({<br/>    namespace = string<br/>  })</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource Tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | ECS Cluster ARN |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | ECS Cluster Name |
