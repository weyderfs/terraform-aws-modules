# CloudWatch Log Group Module

This module creates and manages AWS CloudWatch Log Groups with support for retention policies and optional KMS encryption.

## Features

- Create CloudWatch Log Groups
- Configure log retention policies
- Optional KMS encryption for log data
- Customizable tags for resource organization

## Usage

### Terraform

```hcl
module "log_group" {

  source = "./cloudwatch/log-group"

  name              = "/aws/lambda/my-function"
  retention_in_days = 30
  kms_key_id        = "alias/aws/logs"

  tags = {
    Environment = "production"
    Application = "my-app"
  }
}
```

### Terragrunt

```hcl
terraform {
  source = "git::https://gitlab.dev.monitoralabs.com/marlabs/devops/terraform-aws-modules.git//cloudwatch/log-group?ref=v0.1.0"
}

inputs = {
  name              = "/aws/lambda/chatbot-ia-lambda"
  retention_in_days = 30
  kms_key_id        = "alias/aws/logs"

  tags = {
    region      = local.tag_vars.region
    environment = local.tag_vars.environment
    cost-type   = local.tag_vars.cost-type
    cost-center = local.tag_vars.cost-center
    team        = local.tag_vars.team
    owner       = local.tag_vars.owner
    managed-by  = local.tag_vars.managed-by
    component   = "cloudwatch-log-group"
    project     = "my-project"
  }
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}
```

<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.aclg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the CloudWatch Log Group | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | The number of days to retain log events in the specified log group | `number` | `15` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN of the KMS key to use for encrypting log data. If not provided, logs are not encrypted | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the log group | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | Name of the CloudWatch Log Group |
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the CloudWatch Log Group |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | KMS Key ID used for encryption (if configured) |
<!-- END_TF_DOCS -->

