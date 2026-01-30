# AWS ECR Private Repository Module

Terraform module to create a private Amazon ECR repository with encryption, immutability, and image scanning configuration.

## Table of Contents

- [Features](#features)
- [Usage](#usage)
	- [Terragrunt Example](#terragrunt-example)
	- [Terraform Example](#terraform-example)
- [Encryption](#encryption)
- [Tag Mutability](#tag-mutability)
- [Image Scanning](#image-scanning)
- [Requirements](#requirements)
- [Providers](#providers)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Notes](#notes)

## Features

- Creates a private ECR repository with configurable name and tags
- Supports AES-256 or KMS encryption
- Optional image tag mutability and exclusion filters
- Optional force delete for repositories with images
- Enables image vulnerability scanning on push

## Usage

### Terragrunt Example

```hcl
terraform {
	source = "[...]"
}

inputs = {
	name          = "myapp"
	scan_on_push  = true
	force_delete  = false
	encryption_type = "AES256"
	image_tag_mutability = "IMMUTABLE"

	tags = {
        # TAGs here...
	}
}
```

### Terraform Example

```hcl
module "ecr_private" {
	source = "[...]"

	name                 = "myapp"
	scan_on_push         = true
	force_delete         = false
	encryption_type      = "AES256"
	image_tag_mutability = "IMMUTABLE"

	tags = {
		Environment = "production"
		Project     = "myapp"
	}
}
```

## Encryption

- `AES256` uses the default ECR-managed encryption
- `KMS` uses a customer-managed CMK when `kms_key_arn` is provided

## Tag Mutability

- `MUTABLE` allows overwriting tags
- `IMMUTABLE` prevents overwriting tags (recommended for release pipelines)
- Use `image_tag_mutability_exclusion_filter` to allow specific tags to remain mutable

## Image Scanning

Enable `scan_on_push` to run vulnerability scanning whenever a new image is pushed.

<!-- BEGIN_TF_DOCS -->

## Resources

| Name | Type |
|------|------|
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_encryption_type"></a> [encryption\_type](#input\_encryption\_type) | Encryption type: AES256 or KMS. If kms\_key\_arn is provided, set to KMS. | `string` | `"AES256"` | no |
| <a name="input_force_delete"></a> [force\_delete](#input\_force\_delete) | If true, forces deletion of the repository even if it contains images. | `bool` | `false` | no |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | Controls image tag mutability: MUTABLE or IMMUTABLE. | `string` | `"IMMUTABLE"` | no |
| <a name="input_image_tag_mutability_exclusion_filter"></a> [image\_tag\_mutability\_exclusion\_filter](#input\_image\_tag\_mutability\_exclusion\_filter) | Optional list of tag exclusion filters from immutability. Each item supports: filter\_type and filter. | `list(object({ filter_type = string, filter = string }))` | `[]` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | Optional KMS key ARN for repository encryption (if null, ECR uses AES-256). | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the ECR repository. | `string` | n/a | yes |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Enable vulnerability scanning on image push. | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to the ECR repository. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_arn"></a> [repository\_arn](#output\_repository\_arn) | ARN of the ECR repository. |
| <a name="output_repository_name"></a> [repository\_name](#output\_repository\_name) | Name of the ECR repository. |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | Repository URI used to tag/pull images (ACCOUNT\_ID.dkr.ecr.REGION.amazonaws.com/NAME). |
| <a name="output_tags"></a> [tags](#output\_tags) | Tags applied to the ECR repository. |

<!-- END_TF_DOCS -->

## Notes

- Enabling scan on push can increase image push time
- Immutable tags are recommended for production release pipelines
