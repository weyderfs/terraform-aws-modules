# AWS ACM Certificate Validation Module

Terraform module to validate AWS ACM certificates using DNS validation records.

## Table of Contents

- [Features](#features)
- [Usage](#usage)
  - [Terragrunt Example](#terragrunt-example)
    - [Step 1 - Create the ACM certificate](#step-1---create-the-acm-certificate)
    - [Step 2 - Create Route53 validation records](#step-2---create-route53-validation-records)
    - [Step 3 - Validate the certificate](#step-3---validate-the-certificate)
  - [Terraform Example](#terraform-example)
    - [Step 1 - Create the ACM certificate](#step-1---create-the-acm-certificate-1)
    - [Step 2 - Create Route53 validation records](#step-2---create-route53-validation-records-1)
    - [Step 3 - Validate the certificate](#step-3---validate-the-certificate-1)
- [Requirements](#requirements)
- [Providers](#providers)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Notes](#notes)

## Features

- Validates ACM certificates using DNS validation records
- Accepts a list of validation record FQDNs

## Usage

### Terragrunt Example

#### Step 1 - Create the ACM certificate

```hcl
# acm/certificate/terragrunt.hcl
terraform {
  source = "[...]"
}

dependency "acm" {
  config_path = "../certificate"
}

inputs = {
  certificate_arn         = dependency.acm.outputs.arn
  validation_record_fqdns = dependency.acm.outputs.domain_validation_options[*].resource_record_name
}
```

#### Step 2 - Create Route53 validation records

```hcl
terraform {
  source = "[...]"
}

dependency "acm" {
  config_path = "../../acm/certificate"
}

generate "records" {
  path      = "records.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
locals {
  domain_validation_options = ${jsonencode(dependency.acm.outputs.domain_validation_options)}
}

resource "aws_route53_record" "validation" {
  for_each = {
    for dvo in local.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.zone_id
}

output "validation_record_fqdns" {
  value = [for record in aws_route53_record.validation : record.fqdn]
}
EOF
}

inputs = {
  zone_id = "Z123456ABCDEFG"
}
```

#### Step 3 - Validate the certificate

```hcl
terraform {
  source = "[...]"
}

dependency "acm" {
  config_path = "../certificate"
}

dependency "validation_records" {
  config_path = "../../route53/validation-records"
}

inputs = {
  certificate_arn         = dependency.acm.outputs.arn
  validation_record_fqdns = dependency.validation_records.outputs.validation_record_fqdns
}
```

### Terraform Example

```hcl
```

#### Step 1 - Create the ACM certificate

```hcl
module "acm_certificate" {
  source = "[...]"

  domain_name       = "example.com"
  validation_method = "DNS"
}
```

#### Step 2 - Create Route53 validation records

```hcl
resource "aws_route53_record" "validation" {
  for_each = {
    for dvo in module.acm_certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = "Z123456ABCDEFG"
}
```

#### Step 3 - Validate the certificate

```hcl
module "acm_validation" {
  source = "[...]"

  certificate_arn         = module.acm_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.validation : record.fqdn]
}
```

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
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_arn"></a> [certificate_arn](#input_certificate_arn) | (Required) ACM certificate ARN to validate | `string` | n/a | yes |
| <a name="input_validation_record_fqdns"></a> [validation_record_fqdns](#input_validation_record_fqdns) | Optional list of FQDNs that implement the validation | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output_id) | The ACM certificate validation ID |
| <a name="output_certificate_arn"></a> [certificate_arn](#output_certificate_arn) | The ACM certificate ARN |

## Notes

- Ensure DNS records are created before running this module.
- For email validation, this resource is not required.
