# AWS ECS Cluster Module

Terraform module to create an AWS ECS Cluster with support for Container Insights monitoring, capacity providers, and service connectivity features.

## Table of Contents

- [Features](#features)
- [Usage](#usage)
  - [Terragrunt Example](#terragrunt-example)
  - [Terraform Example](#terraform-example)
- [Container Insights](#container-insights)
- [Capacity Providers](#capacity-providers)
- [Service Connect](#service-connect)
- [Requirements](#requirements)
- [Providers](#providers)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Notes](#notes)

## Features

- Creates an ECS Cluster with configurable name and tags
- Container Insights support (basic and enhanced observability levels)
- Multiple capacity providers (FARGATE, FARGATE_SPOT, ASG)
- Default capacity provider strategy configuration
- Execute command configuration with optional logging
- Service Connect namespace integration
- VPC configuration support

## Usage

### Terragrunt Example

```hcl
terraform {
  source = "[...]"
}

inputs = {
  name                      = "chatbot-ai"
  enable_container_insights = true
  container_insights_level  = "enhanced"

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy = [
    { capacity_provider = "FARGATE", weight = 1 }
  ]

  cluster_configuration = {
    execute_command_configuration = {
      logging = "DEFAULT"
    }
  }

  tags = {

  }
}
```

### Terraform Example

```hcl
module "ecs_cluster" {
  source = "[...]"

  name                      = "production"
  enable_container_insights = true
  container_insights_level  = "enhanced"

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy = [
    {
      capacity_provider = "FARGATE"
      weight            = 1
      base              = 1
    }
  ]

  cluster_configuration = {
    execute_command_configuration = {
      logging = "DEFAULT"
    }
  }

  tags = {
    Environment = "production"
    Project     = "myapp"
  }
}
```

## Container Insights

Container Insights provides visibility into cluster, service, task, and container metrics.

### Levels

- `disabled` - Container Insights disabled
- `enabled` - Basic Container Insights (recommended for testing)
- `enhanced` - Enhanced observability with task and container-level metrics (recommended for production)

## Capacity Providers

The module supports multiple capacity providers:

- `FARGATE` - On-demand Fargate capacity
- `FARGATE_SPOT` - Fargate Spot instances (cost-optimized)
- `ASG` - Auto Scaling Groups (self-managed)

Configure the `default_capacity_provider_strategy` to define how tasks are distributed across providers.

## Service Connect

Service Connect enables simplified service-to-service communication using service names instead of IP addresses.

Configure via `service_connect_defaults`:

```hcl
service_connect_defaults = {
  namespace = "myapp.local"
}
```

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity_providers"></a> [capacity\_providers](#input\_capacity\_providers) | List of capacity providers associated with the cluster. | `list(string)` | `[]` | no |
| <a name="input_cluster_configuration"></a> [cluster\_configuration](#input\_cluster\_configuration) | Configuration of the execute command and cluster logs. | <pre>object({<br/>    execute_command_configuration = optional(object({<br/>      kms_key_id       = optional(string)<br/>      logging          = optional(string)<br/>      log_configuration = optional(object({<br/>        cloud_watch_log_group_name     = optional(string)<br/>        cloud_watch_encryption_enabled = optional(bool)<br/>      }))<br/>    }))<br/>  })</pre> | `null` | no |
| <a name="input_container_insights_level"></a> [container\_insights\_level](#input\_container\_insights\_level) | Container Insights observability level (disabled, enabled, enhanced). | `string` | `"disabled"` | no |
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

<!-- END_TF_DOCS -->

## Notes

- Enhanced Container Insights may incur additional CloudWatch costs
- Capacity provider strategies should be tailored to your workload and cost requirements
- Service Connect requires proper VPC and networking configuration
- Execute command logging requires appropriate CloudWatch Logs permissions