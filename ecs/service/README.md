# AWS ECS Service Module

Terraform module to create and manage ECS Services with optional Service Discovery (Cloud Map) and load balancer integration.

## Table of Contents

- [Usage](#usage)
	- [Terragrunt Example](#terragrunt-example)
	- [Terraform Example](#terraform-example)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Notes](#notes)

## Usage

### Terragrunt Example

```hcl
terraform {
	source = "[...]"
}

dependency "ecs_cluster" {
	config_path = "../../cluster/myapp"
}

dependency "task_definition" {
	config_path = "../../task-definition/myapp"
}

dependency "cloudmap" {
	config_path = "../../../cloudmap/service-discovery/myapp"
}

inputs = {
	name                = "myapp-service"
	cluster_arn         = dependency.ecs_cluster.outputs.cluster_arn
	task_definition_arn = dependency.task_definition.outputs.task_definition_arn

	desired_count       = 2
	scheduling_strategy = "REPLICA"
	launch_type         = "FARGATE"
	platform_version    = "LATEST"

	network_configuration = {
		subnets         = ["subnet-xxxxxxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyyyyyy"]
		security_groups = ["sg-xxxxxxxxxxxxxxxxx"]
	}

	service_registries = [
		{
			registry_arn   = dependency.cloudmap.outputs.services["backend-api"].arn
			container_name = "backend-container"
			container_port = 8080
		}
	]

	tags = {
		environment = "production"
		project     = "myapp"
	}
}
```

### Terraform Example

```hcl
module "ecs_service" {
	source = "[...]"

	name                = "myapp-service"
	cluster_arn         = aws_ecs_cluster.main.arn
	task_definition_arn = aws_ecs_task_definition.main.arn

	desired_count       = 2
	scheduling_strategy = "REPLICA"
	launch_type         = "FARGATE"
	platform_version    = "LATEST"

	network_configuration = {
		subnets         = ["subnet-xxxxxxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyyyyyy"]
		security_groups = ["sg-xxxxxxxxxxxxxxxxx"]
	}

	service_registries = [
		{
			registry_arn   = aws_service_discovery_service.backend.arn
			container_name = "backend-container"
			container_port = 8080
		}
	]

	tags = {
		environment = "production"
		project     = "myapp"
	}
}
```

<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_ecs_service.ese](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity_provider_strategy"></a> [capacity\_provider\_strategy](#input\_capacity\_provider\_strategy) | Capacity provider strategy (e.g., FARGATE/FARGATE\_SPOT). | <pre>list(object({<br/>    capacity_provider = string<br/>    weight            = optional(number)<br/>    base              = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_cluster_arn"></a> [cluster\_arn](#input\_cluster\_arn) | ECS Cluster ARN/ID. | `string` | n/a | yes |
| <a name="input_deployment_controller"></a> [deployment\_controller](#input\_deployment\_controller) | Deployment controller (ECS or CODE\_DEPLOY). | <pre>object({<br/>    type = string<br/>  })</pre> | `null` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | Number of tasks desired (for REPLICA only). | `number` | `1` | no |
| <a name="input_enable_deployment_circuit_breaker"></a> [enable\_deployment\_circuit\_breaker](#input\_enable\_deployment\_circuit\_breaker) | Enables/Configures the ECS circuit breaker. | <pre>object({<br/>    enable   = bool<br/>    rollback = bool<br/>  })</pre> | `null` | no |
| <a name="input_enable_execute_command"></a> [enable\_execute\_command](#input\_enable\_execute\_command) | Enable ECS Exec. | `bool` | `false` | no |
| <a name="input_force_new_deployment"></a> [force\_new\_deployment](#input\_force\_new\_deployment) | Force a new deployment by changing the task definition. | `bool` | `false` | no |
| <a name="input_health_check_grace_period_seconds"></a> [health\_check\_grace\_period\_seconds](#input\_health\_check\_grace\_period\_seconds) | Health check period (when using LB). | `number` | `null` | no |
| <a name="input_launch_type"></a> [launch\_type](#input\_launch\_type) | Release type: FARGATE or EC2. Do not use if capacity\_provider\_strategy is set. | `string` | `null` | no |
| <a name="input_load_balancer"></a> [load\_balancer](#input\_load\_balancer) | Load balancer configuration for the service. | <pre>object({<br/>    target_group_arn = string<br/>    container_name   = string<br/>    container_port   = number<br/>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | ECS Service Name. | `string` | n/a | yes |
| <a name="input_network_configuration"></a> [network\_configuration](#input\_network\_configuration) | Network configuration for awsvpc (required for Fargate). | <pre>object({<br/>    subnets         = list(string)<br/>    security_groups = optional(list(string), [])<br/>    assign_public_ip = optional(bool, false)<br/>  })</pre> | `null` | no |
| <a name="input_placement_constraint_expression"></a> [placement\_constraint\_expression](#input\_placement\_constraint\_expression) | CQL expression for constraint memberOf. | `string` | `null` | no |
| <a name="input_placement_constraint_type"></a> [placement\_constraint\_type](#input\_placement\_constraint\_type) | Constraint type (memberOf, distinctInstance). | `string` | `null` | no |
| <a name="input_placement_strategy_field"></a> [placement\_strategy\_field](#input\_placement\_strategy\_field) | Field for placement (e.g.: cpu, memory, attribute:ecs.availability-zone, etc.). | `string` | `null` | no |
| <a name="input_placement_strategy_type"></a> [placement\_strategy\_type](#input\_placement\_strategy\_type) | Type of placement strategy (bin pack, random, spread). | `string` | `null` | no |
| <a name="input_platform_version"></a> [platform\_version](#input\_platform\_version) | Fargate platform version (e.g., LATEST). | `string` | `null` | no |
| <a name="input_scheduling_strategy"></a> [scheduling\_strategy](#input\_scheduling\_strategy) | Scheduling strategy (REPLICA or DAEMON). | `string` | `"REPLICA"` | no |
| <a name="input_service_registries"></a> [service\_registries](#input\_service\_registries) | Service discovery registries (Cloud Map) for the service. | <pre>list(object({<br/>    registry_arn   = string<br/>    container_name = optional(string)<br/>    container_port = optional(number)<br/>    port           = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags list. | `map(string)` | `{}` | no |
| <a name="input_task_definition_arn"></a> [task\_definition\_arn](#input\_task\_definition\_arn) | ARN or family:revision of Task Definition. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_assign_public_ip"></a> [assign\_public\_ip](#output\_assign\_public\_ip) | Whether a public IP is assigned to the tasks (awsvpc network mode). |
| <a name="output_capacity_provider_strategy"></a> [capacity\_provider\_strategy](#output\_capacity\_provider\_strategy) | Capacity provider strategy applied to the service (if used). |
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | ARN/ID of the ECS Cluster associated with the service. |
| <a name="output_deployment_circuit_breaker"></a> [deployment\_circuit\_breaker](#output\_deployment\_circuit\_breaker) | Deployment circuit breaker configuration (enable/rollback) if configured. |
| <a name="output_deployment_controller_type"></a> [deployment\_controller\_type](#output\_deployment\_controller\_type) | Deployment controller type (ECS or CODE\_DEPLOY) if configured. |
| <a name="output_desired_count"></a> [desired\_count](#output\_desired\_count) | Desired number of tasks (only relevant for REPLICA strategy). |
| <a name="output_enable_ecs_managed_tags"></a> [enable\_ecs\_managed\_tags](#output\_enable\_ecs\_managed\_tags) | Indicates whether ECS managed tags are enabled for this service. |
| <a name="output_enable_execute_command"></a> [enable\_execute\_command](#output\_enable\_execute\_command) | Indicates whether ECS Exec is enabled for this service. |
| <a name="output_health_check_grace_period_seconds"></a> [health\_check\_grace\_period\_seconds](#output\_health\_check\_grace\_period\_seconds) | Health check grace period used when the service is fronted by a load balancer. |
| <a name="output_input_load_balancer"></a> [input\_load\_balancer](#output\_input\_load\_balancer) | Load balancer block provided via module input (echo for composition). |
| <a name="output_input_network_configuration"></a> [input\_network\_configuration](#output\_input\_network\_configuration) | Network configuration block provided via module input (echo for composition). |
| <a name="output_launch_type"></a> [launch\_type](#output\_launch\_type) | Launch type configured for the service (FARGATE or EC2), if defined. |
| <a name="output_lb_container_name"></a> [lb\_container\_name](#output\_lb\_container\_name) | Container name mapped in the load balancer (first entry if multiple). |
| <a name="output_lb_container_port"></a> [lb\_container\_port](#output\_lb\_container\_port) | Container port mapped in the load balancer (first entry if multiple). |
| <a name="output_load_balancer"></a> [load\_balancer](#output\_load\_balancer) | Load balancer block(s) attached to the ECS Service (target group ARN, container name/port). |
| <a name="output_network_security_groups"></a> [network\_security\_groups](#output\_network\_security\_groups) | Security Groups associated with the service (awsvpc network mode). |
| <a name="output_network_subnets"></a> [network\_subnets](#output\_network\_subnets) | Subnets associated with the service (awsvpc network mode). |
| <a name="output_platform_version"></a> [platform\_version](#output\_platform\_version) | Fargate platform version if applicable (e.g., LATEST). |
| <a name="output_propagate_tags"></a> [propagate\_tags](#output\_propagate\_tags) | Source for tag propagation (SERVICE or TASK\_DEFINITION), if configured. |
| <a name="output_scheduling_strategy"></a> [scheduling\_strategy](#output\_scheduling\_strategy) | Scheduling strategy used by the ECS Service (REPLICA or DAEMON). |
| <a name="output_service_arn"></a> [service\_arn](#output\_service\_arn) | ARN of the ECS Service. |
| <a name="output_service_id"></a> [service\_id](#output\_service\_id) | ID of the ECS Service (commonly same as ARN). |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | Name of the ECS Service. |
| <a name="output_service_reference"></a> [service\_reference](#output\_service\_reference) | Convenient reference in the form of cluster\_arn/service\_name. |
| <a name="output_target_group_arn"></a> [target\_group\_arn](#output\_target\_group\_arn) | Target Group ARN used by the service (first entry if multiple). |
| <a name="output_task_definition"></a> [task\_definition](#output\_task\_definition) | Task definition (ARN or family:revision) currently set on the service. |

## Notes

- For Fargate, `network_configuration` is required and must use private or public subnets with `awsvpc`.
- Use either `launch_type` or `capacity_provider_strategy` (not both) to avoid conflicts.
- When using Cloud Map, ensure `service_registries.container_name` matches the container name in the task definition.
- If using `load_balancer`, set `health_check_grace_period_seconds` to allow task warm‑up.
<!-- END_TF_DOCS -->