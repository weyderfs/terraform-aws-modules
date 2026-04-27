# DynamoDB Table Module

This OpenTofu/Terraform module creates a DynamoDB table with customizable configuration including partition/sort keys, secondary indexes, streams, encryption, and TTL settings.

## Features

- DynamoDB table with configurable billing mode (PROVISIONED or PAY_PER_REQUEST)
- Support for partition key (hash key) and optional sort key (range key)
- Global Secondary Indexes (GSI) support
- Local Secondary Indexes (LSI) support
- DynamoDB Streams with configurable view types
- Server-side encryption with optional customer-managed KMS keys
- Point-in-time recovery (PITR) support
- Time-to-Live (TTL) configuration
- Flexible attribute definitions
- Custom tagging support

## Usage

```hcl
# terragrunt.hcl
terraform {
  source = "git::git@github.com:your-org/terraform-aws-modules.git//dynamodb?ref=v1.0.0"
}

inputs = {
  dynamodb_name  = "my-dynamodb-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "step"
  range_key      = "step_id"
  
  attributes = [
    {
      name = "step"
      type = "S"
    },
    {
      name = "step_id"
      type = "S"
    }
  ]

  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
  
  point_in_time_recovery = true
  
  server_side_encryption_enabled = true
  
  global_secondary_indexes = [
    {
      name               = "StepIdIndex"
      hash_key           = "step_id"
      range_key          = null
      write_capacity     = 5
      read_capacity      = 5
      projection_type    = "ALL"
      non_key_attributes = []
    }
  ]

  ttl = [
    {
      attribute_name = "expire_at"
      enabled        = true
    }
  ]

  tags = {
    Environment = "production"
    Project     = "example"
  }
}

```

### Example with PAY_PER_REQUEST Billing

```hcl
inputs = {
  dynamodb_name = "my-on-demand-table"
  billing_mode  = "PAY_PER_REQUEST"
  hash_key      = "id"
  
  attributes = [
    {
      name = "id"
      type = "S"
    }
  ]
  
  server_side_encryption_enabled = true
  point_in_time_recovery        = true
  
  tags = {
    Environment = "development"
  }
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.dynamodb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attributes"></a> [attributes](#input\_attributes) | The list of the attributes. | `list(map(string))` | `[]` | no |
| <a name="input_billing_mode"></a> [billing\_mode](#input\_billing\_mode) | Controls how you are charged for read and write throughput and how you manage capacity. The valid values are PROVISIONED and PAY\_PER\_REQUEST. Defaults to PROVISIONED. | `string` | `"PROVISIONED"` | no |
| <a name="input_dynamodb_name"></a> [dynamodb\_name](#input\_dynamodb\_name) | The name of the table, this needs to be unique within a region. | `string` | `null` | no |
| <a name="input_global_secondary_indexes"></a> [global\_secondary\_indexes](#input\_global\_secondary\_indexes) | (Optional) Describe a GSI for the table; subject to the normal limits on the number of GSIs, projected attributes, etc. | `any` | `[]` | no |
| <a name="input_hash_key"></a> [hash\_key](#input\_hash\_key) | (Forces new resource) The attribute to use as the hash (partition) key. | `string` | `null` | no |
| <a name="input_local_secondary_indexes"></a> [local\_secondary\_indexes](#input\_local\_secondary\_indexes) | (Optional, Forces new resource) Describe an LSI on the table; these can only be allocated at creation so you cannot change this definition after you have created the resource. | `any` | `[]` | no |
| <a name="input_point_in_time_recovery"></a> [point\_in\_time\_recovery](#input\_point\_in\_time\_recovery) | (Optional) Point-in-time recovery options. | `bool` | `false` | no |
| <a name="input_range_key"></a> [range\_key](#input\_range\_key) | (Forces new resource) The attribute to use as the range (sort) key. | `string` | `null` | no |
| <a name="input_read_capacity"></a> [read\_capacity](#input\_read\_capacity) | The number of read units for this table. If the billing\_mode is PROVISIONED, this field is required. | `number` | `0` | no |
| <a name="input_server_side_encryption_enabled"></a> [server\_side\_encryption\_enabled](#input\_server\_side\_encryption\_enabled) | (Required) Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK). | `bool` | `false` | no |
| <a name="input_server_side_encryption_kms_key_arn"></a> [server\_side\_encryption\_kms\_key\_arn](#input\_server\_side\_encryption\_kms\_key\_arn) | (Optional) The ARN of the CMK that should be used for the AWS KMS encryption. This attribute should only be specified if the key is different from the default DynamoDB CMK, alias/aws/dynamodb | `string` | `""` | no |
| <a name="input_stream_enabled"></a> [stream\_enabled](#input\_stream\_enabled) | Indicates whether Streams are to be enabled (true) or disabled (false). | `bool` | `false` | no |
| <a name="input_stream_view_type"></a> [stream\_view\_type](#input\_stream\_view\_type) | Indicates whether Streams are to be enabled (true) or disabled (false). | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The list of resource tags | `map(string)` | `{}` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | (Optional) Describe a GSI for the table; subject to the normal limits on the number of GSIs, projected attributes, etc. | `any` | `[]` | no |
| <a name="input_write_capacity"></a> [write\_capacity](#input\_write\_capacity) | The number of write units for this table. If the billing\_mode is PROVISIONED, this field is required. | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The arn of the table |
| <a name="output_id"></a> [id](#output\_id) | The name of the table |

## Notes

- When using `billing_mode = "PROVISIONED"`, you must specify `read_capacity` and `write_capacity`
- When using `billing_mode = "PAY_PER_REQUEST"`, read/write capacity values are ignored
- Local Secondary Indexes (LSI) can only be created at table creation time and cannot be modified later
- Global Secondary Indexes (GSI) can be added or removed after table creation
- DynamoDB Streams `stream_view_type` options: `KEYS_ONLY`, `NEW_IMAGE`, `OLD_IMAGE`, `NEW_AND_OLD_IMAGES`
- Attribute types: `S` (string), `N` (number), `B` (binary)
- Point-in-time recovery enables continuous backups for the table
- Server-side encryption is enabled by default using AWS managed keys when `server_side_encryption_enabled = true`
