# AWS Cloud Map Service Discovery Module

Terraform module to create an AWS Cloud Map Private DNS Namespace and Service Discovery services for internal service-to-service communication.

## Table of Contents

- [Features](#features)
- [Usage](#usage)
  - [Terragrunt Example](#terragrunt-example)
  - [Terraform Example](#terraform-example)
  - [Integration with ECS Service](#integration-with-ecs-service)
- [DNS Records Types](#dns-records-types)
- [Routing Policies](#routing-policies)
- [Health Checks](#health-checks)
- [Requirements](#requirements)
- [Providers](#providers)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Notes](#notes)

## Features

- Creates a private DNS namespace within a VPC
- Supports multiple service registrations
- Configurable DNS records (A, AAAA, SRV, CNAME)
- Optional health check configuration
- Integrates with AWS ECS for service discovery

## Usage

### Terragrunt Example


```hcl
terraform {
  source = "[...]"
}

dependency "vpc" {
  config_path = "../../vpc"
}

inputs = {
  namespace_name = "myapp-ecs.local"
  vpc_id         = dependency.vpc.outputs.vpc_id
  description    = "Service Discovery namespace for myapp"

  services = {
    "backend-api" = {
      description = "Backend API microservice"
      dns_config = {
        dns_records = [
          {
            type = "A"
            ttl  = 60
          }
        ]
        routing_policy = "MULTIVALUE"
      }
      health_check_custom_config = {}
    }

    "worker-service" = {
      description = "Background worker service"
      dns_config = {
        dns_records = [
          {
            type = "A"
            ttl  = 60
          }
        ]
        routing_policy = "MULTIVALUE"
      }
      health_check_custom_config = {}
    }








### Terraform Example

```hcl
module "service_discovery" {
  source = "[...]"

  namespace_name = "myapp.local"
  vpc_id         = "vpc-xxxxxxxxxxxxxxxx"
  description    = "Service Discovery namespace for myapp"

  services = {
    "backend-api" = {
      description = "Backend API service"
      dns_config = {
        dns_records = [
          {
            type = "A"
            ttl  = 60
          }
        ]
        routing_policy = "MULTIVALUE"
      }
      health_check_custom_config = {}
    }

    "frontend" = {
      description = "Frontend service"
      dns_config = {
        dns_records = [
          {
            type = "A"
            ttl  = 60
          }
        ]
        routing_policy = "MULTIVALUE"
      }
      health_check_custom_config = {}
    }
  }

  tags = {
    Environment = "dev"
    Project     = "myapp"
  }
}
```

    "frontend" = {
      description = "Frontend web application"
      dns_config = {
        dns_records = [
          {
            type = "A"
            ttl  = 60
          }
        ]
        routing_policy = "MULTIVALUE"
      }
      health_check_custom_config = {}
    }
  }

  tags = {
    region      = "us-east-1"
    environment = "production"
    cost-type   = "operational"
    cost-center = "engineering"
    team        = "platform"
    owner       = "devops"
    managed-by  = "terragrunt"
    component   = "service-discovery"
    project     = "myapp"
  }
}
```

### Integration with ECS Service

After creating the namespace and services, reference them in your ECS service configuration:

```hcl
# In your ECS service terragrunt.hcl
dependency "cloudmap" {
  config_path = "../../../cloudmap/service-discovery/myapp"
}

inputs = {
  # ... other ECS service inputs ...

  service_registries = [
    {
      registry_arn   = dependency.cloudmap.outputs.services["backend-api"].arn
      container_name = "backend-container"
      container_port = 8080
    }
  ]
}
```

## DNS Records Types

| Type | Description |
|------|-------------|
| `A` | IPv4 address record |
| `AAAA` | IPv6 address record |
| `SRV` | Service record (includes port) |
| `CNAME` | Canonical name record |

## Routing Policies

| Policy | Description |
|--------|-------------|
| `MULTIVALUE` | Returns multiple healthy targets (default) |
| `WEIGHTED` | Returns targets based on weight |

## Health Checks

For private DNS namespaces, use `health_check_custom_config = {}` (empty object). ECS manages the health status automatically based on container health.

Do not use `failure_threshold` as it's deprecated by AWS.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_service_discovery_private_dns_namespace.asdpdn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_private_dns_namespace) | resource |
| [aws_service_discovery_service.asds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description of the namespace | `string` | `""` | no |
| <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name) | Name of the private DNS namespace | `string` | n/a | yes |
| <a name="input_services"></a> [services](#input\_services) | Map of services to create in the namespace | <pre>map(object({<br>    description           = optional(string, "")<br>    dns_config = object({<br>      dns_records = list(object({<br>        ttl  = optional(number, 60)<br>        type = string<br>      }))<br>      routing_policy = optional(string, "MULTIVALUE")<br>    })<br>    health_check_custom_config = optional(object({}))<br>  }))</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID where the namespace will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_namespace_arn"></a> [namespace\_arn](#output\_namespace\_arn) | ARN of the private DNS namespace |
| <a name="output_namespace_id"></a> [namespace\_id](#output\_namespace\_id) | ID of the private DNS namespace |
| <a name="output_namespace_name"></a> [namespace\_name](#output\_namespace\_name) | Name of the private DNS namespace |
| <a name="output_services"></a> [services](#output\_services) | Map of created services with id, arn, and name |

## Notes

- The private DNS namespace is only resolvable within the specified VPC
- Service names will be fully qualified as `service-name.namespace-name` (e.g., `backend-api.myapp.local`)
- When using with ECS, ensure the `container_name` in `service_registries` matches the container name in your task definition
- DNS propagation is typically instant, but allow a few seconds for new registrations