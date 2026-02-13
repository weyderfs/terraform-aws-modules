<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_ecs_task_definition.etd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_definitions"></a> [container\_definitions](#input\_container\_definitions) | Raw JSON for container\_definitions. If null/empty, jsonencode(var.containers) will be used. | `string` | `null` | no |
| <a name="input_containers"></a> [containers](#input\_containers) | (Optional) Structured container definitions to be jsonencoded when container\_definitions is empty. | <pre>list(object({<br/>    name         = string<br/>    image        = string<br/>    cpu          = number<br/>    memory       = number<br/>    essential    = bool<br/>    portMappings = optional(list(object({<br/>      containerPort = number<br/>      hostPort      = optional(number)<br/>      protocol      = optional(string, "tcp")<br/>    })), [])<br/>    environment  = optional(list(object({<br/>      name  = string<br/>      value = string<br/>    })), [])<br/>    secrets = optional(list(object({<br/>      name      = string<br/>      valueFrom = string<br/>    })), [])    <br/>    logConfiguration = optional(object({<br/>      logDriver = string<br/>      options   = optional(map(string), {})<br/>    }), null)<br/>    healthCheck = optional(object({<br/>    command     = list(string)<br/>    interval    = optional(number, 30)<br/>    timeout     = optional(number, 5)<br/>    retries     = optional(number, 3)<br/>    startPeriod = optional(number)<br/>    }), null)<br/>}))</pre> | `[]` | no |
| <a name="input_docker_volume_configuration"></a> [docker\_volume\_configuration](#input\_docker\_volume\_configuration) | (Optional - EC2) Docker volume configuration. | <pre>object({<br/>    autoprovision = optional(bool)<br/>    driver        = optional(string)<br/>    driver_opts   = optional(map(string))<br/>    labels        = optional(map(string))<br/>  })</pre> | `null` | no |
| <a name="input_efs_volume_configuration"></a> [efs\_volume\_configuration](#input\_efs\_volume\_configuration) | (Optional) EFS volume configuration for Fargate/EC2. | <pre>object({<br/>    file_system_id          = string<br/>    root_directory          = optional(string)<br/>    transit_encryption      = optional(string) # ENABLED/DISABLED<br/>    transit_encryption_port = optional(number)<br/>    authorization_config    = optional(object({<br/>      access_point_id = optional(string)<br/>      iam             = optional(string) # ENABLED/DISABLED<br/>    }))<br/>  })</pre> | `null` | no |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | IAM role that the ECS agent uses to pull images/send logs. | `string` | `null` | no |
| <a name="input_family"></a> [family](#input\_family) | (Required) Unique name for the task definition. | `string` | n/a | yes |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | Task network mode (awsvpc for Fargate). | `string` | `"awsvpc"` | no |
| <a name="input_requires_compatibilities"></a> [requires\_compatibilities](#input\_requires\_compatibilities) | Launch type compatibilities (e.g., ["FARGATE"], ["EC2"]). | `list(string)` | <pre>[<br/>  "FARGATE"<br/>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags list. | `map(string)` | `{}` | no |
| <a name="input_task_cpu"></a> [task\_cpu](#input\_task\_cpu) | Total CPU for the task (e.g., 256, 512, 1024). | `number` | `256` | no |
| <a name="input_task_memory"></a> [task\_memory](#input\_task\_memory) | Total memory (MiB) for the task (e.g., 512, 1024, 2048). | `number` | `512` | no |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | IAM role that your application containers assume. | `string` | `null` | no |
| <a name="input_volume_host_path"></a> [volume\_host\_path](#input\_volume\_host\_path) | (Optional - EC2 only) Host path for bind mount volumes. | `string` | `null` | no |
| <a name="input_volume_name"></a> [volume\_name](#input\_volume\_name) | (Optional) Volume name. If null, no volume block is created. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_definitions_json"></a> [container\_definitions\_json](#output\_container\_definitions\_json) | JSON of container definitions successfully registered. |
| <a name="output_container_names"></a> [container\_names](#output\_container\_names) | List of container names registered in the task definition. |
| <a name="output_execution_role_arn"></a> [execution\_role\_arn](#output\_execution\_role\_arn) | Execution role ARN (used by ECS agent). |
| <a name="output_network_mode"></a> [network\_mode](#output\_network\_mode) | Network mode configured for Task Definition. |
| <a name="output_requires_compatibilities"></a> [requires\_compatibilities](#output\_requires\_compatibilities) | List of compatibilities (FARGATE/EC2) associated with the Task. |
| <a name="output_task_cpu"></a> [task\_cpu](#output\_task\_cpu) | CPU Task Definition. |
| <a name="output_task_definition"></a> [task\_definition](#output\_task\_definition) | Full name to use in services/run-task (ex.: family:revision). |
| <a name="output_task_definition_arn"></a> [task\_definition\_arn](#output\_task\_definition\_arn) | Registered Task Definition ARN. |
| <a name="output_task_definition_family"></a> [task\_definition\_family](#output\_task\_definition\_family) | Task Definition Name (family). |
| <a name="output_task_definition_revision"></a> [task\_definition\_revision](#output\_task\_definition\_revision) | Task Definition Revision. |
| <a name="output_task_memory"></a> [task\_memory](#output\_task\_memory) | Memory Task Definition (MiB). |
| <a name="output_task_role_arn"></a> [task\_role\_arn](#output\_task\_role\_arn) | ARN of the task role assumed by the containers. |
| <a name="output_volumes"></a> [volumes](#output\_volumes) | List of volumes configured in the Task (host\_path/Docker/EFS). |
<!-- END_TF_DOCS -->
