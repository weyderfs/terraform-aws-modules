# AWS KMS Key and Alias Module

Terraform module to create an AWS KMS (Key Management Service) key with an alias for encryption key management.

## Table of Contents

- [Features](#features)
- [Usage](#usage)
  - [Terragrunt Example](#terragrunt-example)
  - [Terraform Example](#terraform-example)
- [Key Rotation](#key-rotation)
- [Key Policies](#key-policies)
- [Deletion Window](#deletion-window)
- [Requirements](#requirements)
- [Providers](#providers)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Notes](#notes)

## Features

- Creates a customer-managed KMS key for encryption operations
- Configurable key alias for easy reference and management
- Optional AWS-managed key rotation (enabled by default)
- Customizable deletion window for safe key deletion
- Support for custom key policies
- Lifecycle protection against accidental destruction
- Integration with AWS services for encryption at rest

## Usage

### Terragrunt Example

```hcl
terraform {
  source = "[...]"
}

inputs = {
  alias_name              = "alias/my-encryption-key"
  description             = "KMS key for application data encryption"
  enable_rotation         = true
  deletion_window_in_days = 30
}
```

### Terraform Example

```hcl
module "kms_key" {
  source = "[...]"

  alias_name              = "alias/my-app-key"
  description             = "KMS key for encrypting sensitive data"
  enable_rotation         = true
  deletion_window_in_days = 30

  tags = {
    Environment = "production"
    Application = "myapp"
    ManagedBy   = "Terraform"
  }
}

# Use the key for S3 bucket encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.example.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = module.kms_key.key_arn
    }
  }
}
```

## Key Rotation

AWS-managed key rotation is enabled by default. When enabled, AWS automatically rotates the key material annually. This is a security best practice as it limits the amount of data encrypted with the same key version.

**Note:** Key rotation can be disabled by setting `enable_rotation = false`, but this is not recommended for production use.

## Key Policies

By default, the KMS key uses the default AWS policy. You can provide a custom policy by using the `key_policy` variable with a valid JSON policy document.

**Example custom policy:**

```hcl
module "kms_key" {
  source = "[...]"

  alias_name  = "alias/my-secure-key"
  description = "KMS key with custom policy"
  key_policy  = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Enable IAM Root Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::ACCOUNT-ID:root"
        }
        Action   = "kms:*"
        Resource = "*"
      }
    ]
  })
}
```

## Deletion Window

The deletion window specifies the number of days (7-30) before a KMS key is deleted after scheduling deletion. This provides protection against accidental deletion.

- Default: 30 days
- Minimum: 7 days
- Maximum: 30 days

A longer deletion window is recommended for production keys to prevent accidental data loss.

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
| [aws_kms_key.akk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_alias.aka](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alias_name"></a> [alias\_name](#input\_alias\_name) | Alias name in the form 'alias/your-alias' | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | KMS key description | `string` | `"Managed by Terraform"` | no |
| <a name="input_enable_rotation"></a> [enable\_rotation](#input\_enable\_rotation) | Enable AWS-managed annual rotation for symmetric keys | `bool` | `true` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | KMS key deletion window in days (7-30) | `number` | `30` | no |
| <a name="input_key_policy"></a> [key\_policy](#input\_key\_policy) | Optional JSON policy for the KMS key | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_arn"></a> [key\_arn](#output\_key\_arn) | ARN of the KMS key |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | ID of the KMS key |
| <a name="output_alias_arn"></a> [alias\_arn](#output\_alias\_arn) | ARN of the KMS alias |
| <a name="output_alias_name"></a> [alias\_name](#output\_alias\_name) | Name of the KMS alias |

## Notes

- The KMS key is protected from deletion by a lifecycle rule (`prevent_destroy = true`). To delete the key, modify or remove this Terraform configuration.
- Alias names must start with `alias/` and must be unique within the AWS account.
- Key rotation cannot be disabled after the key is created - it can only be toggled at creation time.
- The key is stored in the region where the module is deployed.
- AWS charges per KMS key per month, plus per API call. Consider consolidating keys when possible.
- Always enable key rotation for production encryption keys to maintain security best practices.
- When scheduling a key for deletion, there is a waiting period (deletion window) before the key is actually deleted.
