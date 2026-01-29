# AWS Elastic Load Balancer Module

Terraform module to create AWS Load Balancers (ALB/NLB) with configurable listeners and target group integration.

## Table of Contents

- [Features](#features)
- [Usage](#usage)
  - [Terragrunt Example](#terragrunt-example)
  - [Terraform Example](#terraform-example)
  - [ALB vs NLB](#alb-vs-nlb)
- [Load Balancer Types](#load-balancer-types)
- [Listeners and Actions](#listeners-and-actions)
- [SSL/TLS Configuration](#ssltls-configuration)
- [Requirements](#requirements)
- [Providers](#providers)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Notes](#notes)

## Features

- Support for Application Load Balancer (ALB) and Network Load Balancer (NLB)
- Configurable internal or internet-facing deployment
- Multiple listener support with protocol flexibility (HTTP, HTTPS, TCP, UDP, TLS)
- SSL/TLS termination with AWS Certificate Manager integration
- Forward actions to target groups or fixed responses
- Redirect rules for protocol/port conversion (e.g., HTTP to HTTPS)
- Deletion protection for production safety
- Customizable idle timeout and health check settings
- Full tagging support for resource organization

## Usage

### Terragrunt Example

```hcl
terraform {
  source = "[...]"
}

dependency "security_group" {
  config_path = "../../security-group/alb"
}

dependency "target_group" {
  config_path = "../target-group"
}

dependency "certificate" {
  config_path = "../../../acm/certificate"
}

inputs = {
  name                       = "myapp-alb"
  internal                   = false
  load_balancer_type         = "application"
  subnet_ids                 = ["subnet-xxxxx", "subnet-yyyyy"]
  security_group_ids         = [dependency.security_group.outputs.security_group_id]
  enable_deletion_protection = true
  idle_timeout               = 60

  listeners = [
    {
      name     = "http-redirect"
      port     = 80
      protocol = "HTTP"
      default_action = {
        type = "redirect"
        redirect = {
          port        = "443"
          protocol    = "HTTPS"
          status_code = "HTTP_301"
        }
      }
    },
    {
      name            = "https"
      port            = 443
      protocol        = "HTTPS"
      ssl_policy      = "ELBSecurityPolicy-TLS-1-2-2017-01"
      certificate_arn = dependency.certificate.outputs.certificate_arn
      default_action = {
        type             = "forward"
        target_group_arn = dependency.target_group.outputs.target_group_arn
      }
    }
  ]

  tags = {
    Environment = "production"
    Project     = "myapp"
  }
}
```

### Terraform Example

```hcl
module "alb" {
  source = "[...]"

  name                       = "myapp-alb"
  internal                   = false
  load_balancer_type         = "application"
  subnet_ids                 = ["subnet-xxxxx", "subnet-yyyyy"]
  security_group_ids         = ["sg-xxxxxxxx"]
  enable_deletion_protection = true
  idle_timeout               = 60

  listeners = [
    {
      name     = "http-redirect"
      port     = 80
      protocol = "HTTP"
      default_action = {
        type = "redirect"
        redirect = {
          port        = "443"
          protocol    = "HTTPS"
          status_code = "HTTP_301"
        }
      }
    },
    {
      name            = "https"
      port            = 443
      protocol        = "HTTPS"
      ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-2021-06"
      certificate_arn = "arn:aws:acm:us-east-1:111111111111:certificate/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
      default_action = {
        type             = "forward"
        target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:111111111111:targetgroup/myapp/xxxxxxxxxxxxx"
      }
    }
  ]

  tags = {
    Environment = "production"
    Application = "myapp"
    ManagedBy   = "Terraform"
  }
}
```

## ALB vs NLB

### Application Load Balancer (ALB)
- Best for: HTTP/HTTPS traffic, web applications, microservices
- Layer: Layer 7 (Application)
- Features: Host/path-based routing, hostname matching
- Latency: ~100ms
- Use case: REST APIs, web services, container-based applications

### Network Load Balancer (NLB)
- Best for: Extreme performance, TCP/UDP traffic, gaming, IoT
- Layer: Layer 4 (Transport)
- Features: Ultra-high throughput, extreme performance
- Latency: Ultra-low (microseconds)
- Use case: Real-time applications, high-throughput systems

## Load Balancer Types

| Type | Protocol | Use Case |
|------|----------|----------|
| `application` | HTTP/HTTPS | Web apps, APIs, microservices |
| `network` | TCP/UDP/TLS | High-performance, real-time apps |

## Listeners and Actions

Listeners can support three types of default actions:

### Forward Action
Routes traffic to a target group:

```hcl
default_action = {
  type             = "forward"
  target_group_arn = "arn:aws:elasticloadbalancing:..."
}
```

### Redirect Action
Redirects traffic (e.g., HTTP to HTTPS):

```hcl
default_action = {
  type = "redirect"
  redirect = {
    port        = "443"
    protocol    = "HTTPS"
    status_code = "HTTP_301"
    host        = "example.com"  # optional
    path        = "/new-path"    # optional
    query       = "param=value"  # optional
  }
}
```

### Fixed Response Action
Returns a static response:

```hcl
default_action = {
  type = "fixed-response"
  fixed_response = {
    content_type = "text/plain"
    message_body = "Service Unavailable"
    status_code  = "503"
  }
}
```

## SSL/TLS Configuration

### HTTPS Listener with Certificate

```hcl
{
  name            = "https"
  port            = 443
  protocol        = "HTTPS"
  ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn = "arn:aws:acm:us-east-1:111111111111:certificate/xxxxxxxx"
  default_action = {
    type             = "forward"
    target_group_arn = "arn:aws:elasticloadbalancing:..."
  }
}
```

### Available SSL Policies

- `ELBSecurityPolicy-TLS13-1-2-2021-06` - Highest security (TLS 1.3 + 1.2)
- `ELBSecurityPolicy-TLS-1-2-2017-01` - Balanced security
- `ELBSecurityPolicy-2016-08` - Legacy support

**Recommendation:** Use the most recent TLS 1.3 policy for production.

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
| [aws_lb.al](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Load balancer name | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs for the load balancer (public for internet-facing, private for internal) | `list(string)` | n/a | yes |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | Load balancer type: application (ALB) or network (NLB) | `string` | `"application"` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | Whether the load balancer is internal (true) or internet-facing (false) | `bool` | `false` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of security group IDs to attach to the ALB (ignored for NLB) | `list(string)` | `[]` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | Enable deletion protection for the load balancer | `bool` | `true` | no |
| <a name="input_idle_timeout"></a> [idle\_timeout](#input\_idle\_timeout) | Idle timeout in seconds (ALB only) | `number` | `60` | no |
| <a name="input_listeners"></a> [listeners](#input\_listeners) | List of listener configurations | `list(object({...}))` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to load balancer resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_arn"></a> [lb\_arn](#output\_lb\_arn) | Load balancer ARN |
| <a name="output_lb_id"></a> [lb\_id](#output\_lb\_id) | Load balancer resource ID |
| <a name="output_lb_name"></a> [lb\_name](#output\_lb\_name) | Load balancer name |
| <a name="output_lb_dns_name"></a> [lb\_dns\_name](#output\_lb\_dns\_name) | Load balancer DNS name for CNAME records |
| <a name="output_lb_zone_id"></a> [lb\_zone\_id](#output\_lb\_zone\_id) | Load balancer hosted zone ID (useful for Route53 alias) |
| <a name="output_listener_arns"></a> [listener\_arns](#output\_listener\_arns) | Listener ARNs keyed by listener name |

## Notes

- Always enable deletion protection (`enable_deletion_protection = true`) for production load balancers to prevent accidental deletion.
- Use public subnets for internet-facing load balancers and private subnets for internal load balancers.
- ALB requires security groups; NLB can work without them but security groups should be used for better control.
- SSL/TLS termination at the load balancer reduces CPU overhead on backend instances.
- DNS propagation can take a few minutes after creation. Use the `lb_dns_name` or `lb_zone_id` for Route53 alias records.
- For HTTP traffic, always implement a redirect to HTTPS in production environments.
- Target groups must be created separately using the ec2/elb/target-group module.
- Monitor listener rules and ensure default actions are properly configured to avoid unexpected behavior.
- Use CloudWatch metrics to monitor load balancer performance and backend health.
