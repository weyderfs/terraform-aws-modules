# AWS Lambda Function Module

This module creates and configures an AWS Lambda function with support for environment variables and VPC networking.

## Features

- **Lambda Function**: Configurable runtime, handler, memory, and timeout
- **Environment Variables**: Support for passing environment variables to the function
- **VPC Integration** (Optional): Deploy Lambda in a VPC for database/private resource access
- **IAM Role Integration**: Requires IAM role ARN for Lambda execution
- **Source Code Tracking**: Automatic hash-based tracking of deployment package changes

## Usage

### Basic Example (Local ZIP)

```hcl
locals {
  tag_vars = read_terragrunt_config(find_in_parent_folders("environment.hcl")).locals
}

dependency "iam_role" {
  config_path = "../../../iam/roles/lambda-exec"
}

terraform {
  source = "git::https://gitlab.dev.monitoralabs.com/marlabs/devops/terraform-aws-modules.git//lambda/function?ref=v0.1.0"
}

inputs = {
  function_name = "chatbot-ia-lambda"
  filename      = "/path/to/lambda_deployment.zip"
  role_arn      = dependency.iam_role.outputs.role_arn
  handler       = "lambda_handler.lambda_handler"
  runtime       = "python3.11"
  timeout       = 300
  memory_size   = 512

  environment_variables = {
    DB_HOST    = "your-database-host"
    DB_PORT    = "5432"
    DB_NAME    = "database_name"
    DB_USER    = "db_user"
    S3_BUCKET  = "artifacts-bucket"
  }

  tags = {
    region      = local.tag_vars.region
    environment = local.tag_vars.environment
    component   = "lambda"
    project     = "chatbot-ai"
  }
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}
```

### Basic Example (S3 ZIP)

```hcl
inputs = {
  function_name = "chatbot-ia-lambda"
  s3_bucket     = "artifacts-bucket"
  s3_key        = "lambda/chatbot-ia-lambda.zip"
  s3_object_version = "3HL4kqtJlcpXroDTDmJ+rmspXd3b" # Optional
  role_arn      = dependency.iam_role.outputs.role_arn
  handler       = "lambda_handler.lambda_handler"
  runtime       = "python3.11"
  timeout       = 300
  memory_size   = 512
}
```

### With VPC Configuration

```hcl
inputs = {
  # ... other configuration ...

  vpc_subnet_ids         = ["subnet-12345678", "subnet-87654321"]
  vpc_security_group_ids = ["sg-12345678"]
}
```

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `function_name` | Lambda function name | string | - | Yes |
| `filename` | Path to deployment package (.zip). Use this OR `s3_bucket` + `s3_key`. | string | `null` | No |
| `s3_bucket` | S3 bucket containing the deployment package | string | `null` | No |
| `s3_key` | S3 key of the deployment package | string | `null` | No |
| `s3_object_version` | S3 object version of the deployment package | string | `null` | No |
| `role_arn` | IAM role ARN for Lambda execution | string | - | Yes |
| `handler` | Function entry point | string | `index.handler` | No |
| `runtime` | Lambda runtime environment | string | `python3.11` | No |
| `timeout` | Function timeout in seconds | number | `60` | No |
| `memory_size` | Function memory in MB (128-10240) | number | `128` | No |
| `architectures` | CPU architecture (x86_64 or arm64) | list(string) | `["x86_64"]` | No |
| `environment_variables` | Environment variables map | map(string) | `{}` | No |
| `vpc_subnet_ids` | VPC subnet IDs for Lambda network | list(string) | `null` | No |
| `vpc_security_group_ids` | VPC security group IDs | list(string) | `null` | No |
| `tags` | Tags for Lambda function | map(string) | `{}` | No |

## Outputs

| Name | Description |
|------|-------------|
| `function_arn` | ARN of the Lambda function |
| `function_name` | Name of the Lambda function |
| `function_invoke_arn` | Invoke ARN of the Lambda function |
| `role_arn` | IAM role ARN used by Lambda |

## Requirements

### Deployment Package

Provide either `filename` or `s3_bucket` + `s3_key`.

If using `filename`, it must point to a valid .zip file containing:
- Python source files
- All dependencies (from `requirements.txt`)
- Handler function file with correct entry point

Example build:
```bash
pip install -r requirements.txt -t package/
cp *.py package/
cd package && zip -r ../lambda_deployment.zip . && cd ..
```

### IAM Role

The Lambda execution role must have at least:
- S3 permissions (if accessing S3)
- CloudWatch Logs permissions
- VPC permissions (if deployed in VPC)

### VPC Configuration

If `vpc_subnet_ids` and `vpc_security_group_ids` are provided:
- Lambda will run inside the VPC
- Requires EC2 permissions for ENI management
- Security group must allow outbound access to required services

## Pre-requisites

- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- Valid IAM role ARN for Lambda execution
- Compiled deployment package (.zip file) or S3 object

## Notes

- Source code hash is tracked to detect changes to the deployment package
- VPC configuration requires both subnet IDs and security group IDs to be set
