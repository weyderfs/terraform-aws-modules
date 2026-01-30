# AWS CloudFront Distribution Module

Módulo Terraform para gerenciar distribuições CloudFront da AWS com suporte a múltiplos origins, cache behaviors, validação de certificados SSL/TLS e geo-restrições.

## Table of Contents

- [Features](#features)
- [Usage](#usage)
  - [Terraform Example](#terraform-example)
    - [1. Distribuição Básica com S3](#1-distribuição-básica-com-s3)
    - [2. Distribuição com Certificado ACM](#2-distribuição-com-certificado-acm)
    - [3. Distribuição com Múltiplos Origins e Cache Behaviors](#3-distribuição-com-múltiplos-origins-e-cache-behaviors)
  - [Terragrunt Example](#terragrunt-example)
    - [1. Estrutura de Diretórios](#1-estrutura-de-diretórios)
    - [2. Arquivo terragrunt.hcl](#2-arquivo-terragruntcl)
    - [3. Variáveis e Deploy](#3-variáveis-e-deploy)
- [Requirements](#requirements)
- [Providers](#providers)
- [Modules](#modules)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Notes](#notes)

## Features

- Suporte a múltiplos origins (S3, custom, ALB, etc.)
- Cache policies modernizadas (`cache_policy_id` e `origin_request_policy_id`)
- Fallback para `forwarded_values` (deprecated, mas suportado)
- SSL/TLS com ACM, IAM ou certificado padrão CloudFront
- Múltiplos cache behaviors com path patterns customizados
- Geo-restrições (whitelist/blacklist)
- Logging para S3
- Custom headers e origin access control
- IPv6 habilitado por padrão
- Tags e validações de entrada

## Usage

### Terraform Example

#### 1. Distribuição Básica com S3

```hcl
module "cloudfront_s3" {
  source = "[...]"

  origins = [
    {
      domain_name              = "meu-bucket.s3.amazonaws.com"
      origin_id                = "s3-origin"
      origin_access_control_id = aws_cloudfront_origin_access_control.s3.id
    }
  ]

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Distribuição CloudFront para site estático"
  default_root_object = "index.html"

  default_cache_behavior = {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "s3-origin"
    viewer_protocol_policy = "redirect-to-https"
    cache_policy_id        = "000000-0000-000000-00000-000000000" # Managed-CachingOptimized
  }

  viewer_certificate = {
    cloudfront_default_certificate = true
  }

  tags = {
    Environment = "production"
    Team        = "platform"
  }
}

output "cloudfront_domain" {
  value = module.cloudfront_s3.domain_name
}
```

#### 2. Distribuição com Certificado ACM

```hcl
module "cloudfront_acm" {
  source = "[...]"

  origins = [
    {
      domain_name = "api.example.com"
      origin_id   = "custom-origin"
      custom_origin_config = {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "https-only"
        origin_ssl_protocols   = ["TLSv1.2"]
      }
    }
  ]

  aliases             = ["cdn.example.com", "assets.example.com"]
  enabled             = true
  comment             = "API CDN com certificado ACM"
  default_root_object = "index.html"

  default_cache_behavior = {
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "custom-origin"
    viewer_protocol_policy = "https-only"
    cache_policy_id        = "123455677-x000-4fxxx-axxx-0x000x0xx0x"
  }

  viewer_certificate = {
    acm_certificate_arn      = aws_acm_certificate.cdn.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  price_class = "PriceClass_100"

  tags = {
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}
```

#### 3. Distribuição com Múltiplos Origins e Cache Behaviors

```hcl
module "cloudfront_advanced" {
  source = "[...]"

  origins = [
    {
      domain_name              = "assets.s3.amazonaws.com"
      origin_id                = "s3-assets"
      origin_access_control_id = aws_cloudfront_origin_access_control.s3.id
    },
    {
      domain_name = "api.example.com"
      origin_id   = "api-origin"
      custom_origin_config = {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "https-only"
        origin_ssl_protocols   = ["TLSv1.2"]
      }
      custom_headers = [
        {
          name  = "X-Origin-Verify"
          value = "secret-token"
        }
      ]
    }
  ]

  aliases         = ["cdn.example.com"]
  enabled         = true
  comment         = "Advanced CloudFront com múltiplos origins"
  price_class     = "PriceClass_200"

  default_cache_behavior = {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "s3-assets"
    viewer_protocol_policy = "redirect-to-https"
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    compress               = true
  }

  ordered_cache_behaviors = [
    {
      path_pattern           = "/api/*"
      allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
      cached_methods         = ["GET", "HEAD"]
      target_origin_id       = "api-origin"
      viewer_protocol_policy = "https-only"
      cache_policy_id        = "0000000000000-0000000000-0000000" # Managed-CachingDisabled
      compress               = true
    },
    {
      path_pattern           = "/images/*"
      allowed_methods        = ["GET", "HEAD"]
      cached_methods         = ["GET", "HEAD"]
      target_origin_id       = "s3-assets"
      viewer_protocol_policy = "redirect-to-https"
      cache_policy_id        = "000000-0000000000-0000000000"
      default_ttl            = 31536000
      max_ttl                = 31536000
      compress               = true
    }
  ]

  logging_config = {
    bucket          = aws_s3_bucket.logs.id
    prefix          = "cloudfront-logs"
    include_cookies = false
  }

  restrictions = {
    geo_restriction = {
      restriction_type = "whitelist"
      locations        = ["US", "BR", "CA", "MX"]
    }
  }

  viewer_certificate = {
    acm_certificate_arn      = aws_acm_certificate.cdn.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  tags = {
    Environment = "production"
    Team        = "platform"
    CostCenter  = "engineering"
  }
}

output "cloudfront_id" {
  value = module.cloudfront_advanced.id
}
```

### Terragrunt Example

**`cloudfront/terragrunt.hcl`**

```hcl
include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "[...]
}

dependency "acm" {
  config_path = "../acm/certificate"
  mock_outputs = {
    arn = "arn:aws:acm:us-east-1:123456789012:certificate/xxxxx"
  }
}

inputs = {
  origins = [
    {
      domain_name              = "meu-bucket.s3.amazonaws.com"
      origin_id                = "s3-origin"
      origin_access_control_id = aws_cloudfront_origin_access_control.s3.id
    }
  ]

  aliases             = ["cdn.example.com"]
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront production distribution"
  default_root_object = "index.html"

  default_cache_behavior = {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "s3-origin"
    viewer_protocol_policy = "redirect-to-https"
    cache_policy_id        = "0000000-00000-0000-0000-00000000000"
    compress               = true
  }

  viewer_certificate = {
    acm_certificate_arn      = dependency.acm.outputs.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  price_class = "PriceClass_200"

  tags = {
    Environment = "production"
    ManagedBy   = "Terragrunt"
    Team        = "platform"
  }
}
```

## Requirements

| Name       | Version |
|------------|---------|
| terraform  | >= 1.0  |
| aws        | >= 5.0  |

## Providers

| Name | Version |
|------|---------|
| aws  | >= 5.0  |

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.acd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_origins"></a> [origins](#input_origins) | List of origins for the CloudFront distribution | `list(object({domain_name = string, origin_id = string, ...}))` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input_enabled) | Whether the distribution is enabled | `bool` | `true` | no |
| <a name="input_is_ipv6_enabled"></a> [is_ipv6_enabled](#input_is_ipv6_enabled) | Whether IPv6 is enabled | `bool` | `true` | no |
| <a name="input_comment"></a> [comment](#input_comment) | Comments about the distribution | `string` | `""` | no |
| <a name="input_default_root_object"></a> [default_root_object](#input_default_root_object) | Default root object | `string` | `"index.html"` | no |
| <a name="input_aliases"></a> [aliases](#input_aliases) | Extra CNAMEs for the distribution | `list(string)` | `[]` | no |
| <a name="input_default_cache_behavior"></a> [default_cache_behavior](#input_default_cache_behavior) | Default cache behavior configuration | `object({allowed_methods = list(string), cached_methods = list(string), target_origin_id = string, viewer_protocol_policy = string, ...})` | n/a | yes |
| <a name="input_ordered_cache_behaviors"></a> [ordered_cache_behaviors](#input_ordered_cache_behaviors) | List of ordered cache behaviors | `list(object({...}))` | `[]` | no |
| <a name="input_price_class"></a> [price_class](#input_price_class) | Price class for the distribution | `string` | `"PriceClass_200"` | no |
| <a name="input_logging_config"></a> [logging_config](#input_logging_config) | CloudFront logging configuration | `object({bucket = string, prefix = optional(string), include_cookies = optional(bool)})` | `null` | no |
| <a name="input_restrictions"></a> [restrictions](#input_restrictions) | CloudFront restrictions (geo-blocking) | `object({geo_restriction = optional(object({...}))})` | `null` | no |
| <a name="input_viewer_certificate"></a> [viewer_certificate](#input_viewer_certificate) | SSL certificate configuration | `object({cloudfront_default_certificate = optional(bool), acm_certificate_arn = optional(string), ssl_support_method = optional(string), ...})` | `{}` | no |
| <a name="input_tags"></a> [tags](#input_tags) | Tags to assign to the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output_id) | CloudFront distribution ID |
| <a name="output_arn"></a> [arn](#output_arn) | CloudFront distribution ARN |
| <a name="output_domain_name"></a> [domain_name](#output_domain_name) | CloudFront domain name |
| <a name="output_hosted_zone_id"></a> [hosted_zone_id](#output_hosted_zone_id) | CloudFront hosted zone ID for Route53 alias records |
| <a name="output_status"></a> [status](#output_status) | Distribution status (Deployed or InProgress) |
| <a name="output_etag"></a> [etag](#output_etag) | Current version of the distribution |
| <a name="output_caller_reference"></a> [caller_reference](#output_caller_reference) | Internal value used to uniquely identify the distribution |

## Notes

- Cache policy IDs são gerenciados pela AWS. Consulte [managed policies](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html).
- Para integrar com Route53, use o `hosted_zone_id` output.
- `forwarded_values` é deprecated no AWS Provider v5.0+, use `cache_policy_id` e `origin_request_policy_id` quando possível.
- Múltiplos origins permitem roteamento inteligente de requisições.
- Geo-restrições aplicam-se globalmente a toda a distribuição.
