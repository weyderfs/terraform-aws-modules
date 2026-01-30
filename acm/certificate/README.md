# AWS ACM Certificate Module

Terraform module to provision AWS ACM certificates with support for SANs, email/DNS validation, and optional PCA or imported certificates.

## Table of Contents

- [Features](#features)
- [Usage](#usage)
	- [Terragrunt Example](#terragrunt-example)
	- [Terraform Example](#terraform-example)
- [Requirements](#requirements)
- [Providers](#providers)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Notes](#notes)

## Features

- Creates ACM certificates with DNS or EMAIL validation
- Supports Subject Alternative Names (SANs)
- Optional ACM PCA integration
- Optional import of existing certificates

## Usage

### Terragrunt Example

```hcl
terraform {
	source = "[...]"
}

inputs = {
	domain_name       = "example.com"
	validation_method = "DNS"
	subject_alternative_names = [
		"www.example.com",
		"api.example.com"
	]

	tags = {
		environment = "dev"
		project     = "platform"
	}
}
```

### Terraform Example

```hcl
module "acm_certificate" {
	source = "[...]"

	domain_name       = "example.com"
	validation_method = "EMAIL"

	validation_options = [
		{
			domain_name       = "example.com"
			validation_domain = "example.com"
		}
	]

	subject_alternative_names = [
		"www.example.com"
	]

	tags = {
		Environment = "production"
		Team        = "platform"
	}
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
| [aws_acm_certificate.acm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain_name](#input_domain_name) | (Required) Domain name for which the certificate should be issued | `string` | n/a | yes |
| <a name="input_subject_alternative_names"></a> [subject_alternative_names](#input_subject_alternative_names) | Optional set of domains that should be SANs in the certificate | `list(string)` | `[]` | no |
| <a name="input_validation_method"></a> [validation_method](#input_validation_method) | (Required) Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform. | `string` | `"DNS"` | no |
| <a name="input_validation_options"></a> [validation_options](#input_validation_options) | Optional validation options for EMAIL validation | `list(object({ domain_name = string, validation_domain = string }))` | `[]` | no |
| <a name="input_options"></a> [options](#input_options) | Optional ACM options (e.g., certificate transparency logging preference) | `object({ certificate_transparency_logging_preference = string })` | `null` | no |
| <a name="input_certificate_authority_arn"></a> [certificate_authority_arn](#input_certificate_authority_arn) | Optional ARN of the ACM PCA to issue the certificate | `string` | `null` | no |
| <a name="input_key_algorithm"></a> [key_algorithm](#input_key_algorithm) | Optional key algorithm for the certificate | `string` | `null` | no |
| <a name="input_certificate_body"></a> [certificate_body](#input_certificate_body) | Optional certificate body when importing a certificate | `string` | `null` | no |
| <a name="input_private_key"></a> [private_key](#input_private_key) | Optional private key when importing a certificate | `string` | `null` | no |
| <a name="input_certificate_chain"></a> [certificate_chain](#input_certificate_chain) | Optional certificate chain when importing a certificate | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input_tags) | The resource tag | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output_id) | The ACM ID |
| <a name="output_arn"></a> [arn](#output_arn) | The ACM ARN |
| <a name="output_domain_name"></a> [domain_name](#output_domain_name) | The ACM Domain Name |
| <a name="output_status"></a> [status](#output_status) | The ACM certificate status |
| <a name="output_subject_alternative_names"></a> [subject_alternative_names](#output_subject_alternative_names) | The ACM Subject Alternative Names |
| <a name="output_validation_emails"></a> [validation_emails](#output_validation_emails) | Validation email addresses for EMAIL validation |
| <a name="output_domain_validation_options"></a> [domain_validation_options](#output_domain_validation_options) | Domain validation options for DNS/EMAIL validation |
| <a name="output_not_before"></a> [not_before](#output_not_before) | Certificate validity start date |
| <a name="output_not_after"></a> [not_after](#output_not_after) | Certificate validity end date |

## Notes

- For DNS validation, you must create the DNS validation records separately (e.g., Route 53) using the `domain_validation_options` output and validate with the `/acm/certificate-validation` module.
- For imported certificates, set `validation_method = "NONE"` and provide `certificate_body`, `private_key`, and optionally `certificate_chain`.
- For EMAIL validation, provide `validation_options` with `validation_domain` for each `domain_name`.
- If using ACM PCA, set `certificate_authority_arn` accordingly.