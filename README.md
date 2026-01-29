# Terraform AWS Modules 

> Simple & clean modules to use.

![Terraform](https://img.shields.io/badge/terraform-%3E%3D1.0-blue?style=flat-square)
![OpenTofu](https://img.shields.io/badge/OpenTofu-%3E%3D1.6-yellow?style=flat-square)
![AWS Provider](https://img.shields.io/badge/AWS%20Provider-%3E%3D4.0-orange?style=flat-square)
![Modules](https://img.shields.io/badge/modules-50%2B-brightgreen?style=flat-square)
![Maintained](https://img.shields.io/badge/maintained%3F-yes-brightgreen?style=flat-square) 

## 📋 Table of Contents

- [About](#about)
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Available Modules](#available-modules)
- [Contributing](#contributing)
- [Support](#support)

---

## 🎯 About

This repository contains a **comprehensive collection of Terraform modules** for AWS services, organized by service category. Each module is designed to be:

- **Simple & Clean**: Minimal complexity with clear configuration options
- **Production-Ready**: Follows AWS best practices and security guidelines
- **Well-Documented**: Each module includes detailed README files with examples
- **Modular**: Can be used independently or composed together
- **Terraform/OpenTofu Compatible**: Works with both Terraform and OpenTofu

---

## 🚀 Getting Started

### Repository Organization

This repository is organized by **AWS service categories**, with each service containing one or more specialized modules. The directory structure follows a clear hierarchy:

```
terraform-aws-modules/
├── service-name/           # AWS Service (e.g., vpc, ecs, s3)
│   ├── module-name/        # Specific module (e.g., vpc, subnet, security-group)
│   │   ├── main.tf         # Main resource definitions
│   │   ├── variables.tf    # Input variables
│   │   ├── outputs.tf      # Output values
│   │   └── README.md       # Module documentation with examples
```

**Key Points:**
- Each module is **self-contained** and can be used independently
- Modules follow **consistent naming conventions** and structure
- Every module includes a **detailed README** with usage examples
- Variables are **well-documented** with descriptions and defaults
- Outputs are **clearly defined** for easy integration with other modules

### Module Naming Convention

Modules are referenced using the following pattern:

```hcl
module "resource_name" {
  source = "github.com/weyderfs/terraform-aws-modules//service/module-name"
  
  # Your configuration here
}
```
## 📦 Prerequisites

Before using these modules, ensure you have:

- **Terraform** >= 1.0 or **OpenTofu** >= 1.6 installed
- **AWS CLI** configured with valid credentials
- **AWS Provider** >= 4.0 configured in your Terraform code
- Appropriate **IAM permissions** to create the resources

### Basic Provider Configuration

```hcl
terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
```

---

## 📚 Available Modules

- **[ACM](#acm)**
  - [Certificate](./acm/certificate/)
- **[AMI](#ami)**
  - [AMI](./ami/)
- **[Cloud Map](#cloud-map)**
  - [Service Discovery](./cloudmap/service-discovery/)
- **[CloudFront](#cloudfront)**
  - [Distribution](./cloudfront/cloudfront-distribution/)
  - [Log Group](./cloudwatch/log-group/)
- **[CloudWatch](#cloudwatch)**
  - [Alarms](./cloudwatch/alarms/)
  - [Log Group](./cloudwatch/log-group/)
- **[DMS](#dms)**
  - [Certificate](./dms/dms_certificate/)
  - [Endpoint](./dms/dms_endpoint/)
  - [Event Subscription](./dms/dms_event_subscription/)
  - [Replication Instance](./dms/dms_replication_instance/)
  - [Replication Subnet Group](./dms/dms_replication_subnet_group/)
  - [Task](./dms/dms_task/)
- **[DynamoDB](#dynamodb)**
  - [DynamoDB](./dynamodb/)
- **[EC2](#ec2)**
  - [Auto Scaling](./ec2/autoscaling/)
  - [Load Balancer](./ec2/loadbalancer/)
    - [ALB](./ec2/loadbalancer/alb/)
    - [ELB](./ec2/elb/lb/)
    - [NLB](./ec2/loadbalancer/nlb/)
- **[ECS](#ecs)**
  - [Cluster](./ecs/cluster/)
  - [Service](./ecs/service/)
  - [Task Definition](./ecs/task-definition/)
- **[ECR](#ecr)**
  - [Private Registry](./ecr/private/)
- **[EKS](#eks)**
  - [Cluster](./eks/cluster/)
- **[ElastiCache](#elasticache)**
  - [Memcached](./elasticache/memcached/)
  - [Redis](./elasticache/redis/)
  - [Subnet Group](./elasticache/subnet-group/)
- **[IAM](#iam)**
  - [Groups](./iam/groups/)
  - [Instance Profile](./iam/instance_profile/)
  - [Policies](./iam/policies/)
  - [Policy](./iam/policy/)
  - [Roles](./iam/roles/)
  - [Users](./iam/users/)
- **[Kinesis](#kinesis)**
  - [Consumer](./kinesis/consumer/)
  - [Firehose](./kinesis/firehose/)
  - [Stream](./kinesis/stream/)
- **[KMS](#kms)**
  - [Alias](./kms/kms-alias/)
  - [Key](./kms/key/)
- **[RDS](#rds)**
  - [DB Option Group](./rds/db-option-group/)
  - [DB Parameter Group](./rds/db-parameter-group/)
  - [DB Subnet Group](./rds/db-subnet-group/)
  - [RDS Cluster](./rds/rds-cluster/)
  - [RDS Instance](./rds/rds-instance/)
- **[Route53](#route53)**
  - [Hosted Zone](./route53/hosted_zone/)
  - [Record](./route53/record/)
- **[S3](#s3)**
  - [Bucket](./s3/bucket/)
  - [Bucket ACL](./s3/bucket-acl/)
  - [Bucket Static Webhosting](./s3/bucket-static-webhosting/)
- **[Secrets Manager](#secrets-manager)**
  - [Secrets](./secrets-manager/secrets/)
  - [Secrets Data](./secrets-manager/secrets-data/)
- **[SNS](#sns)**
  - [Subscription](./sns/subscription/)
  - [Topic](./sns/topic/)
- **[SQS](#sqs)**
  - [Queue](./sqs/queue/)
- **[VPC](#vpc)**
  - [Elastic IP](./vpc/elastic-ip/)
  - [Endpoint](./vpc/endpoint/)
  - [Endpoint Service](./vpc/endpoint-service/)
  - [Internet Gateway](./vpc/internet-gateway/)
  - [NAT Gateway](./vpc/nat-gateway/)
  - [Peering](./vpc/peering/)
  - [Route Table](./vpc/route-table/)
  - [Security Group](./vpc/security-group/)
  - [Subnet](./vpc/subnet/)
  - [Transit Gateway](./vpc/transit-gateway/)
  - [VPC](./vpc/vpc/)

---

## 🤝 Contributing

Contributions are welcome! If you'd like to contribute:

1. **Fork** the repository
2. Create a **feature branch** (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. Open a **Pull Request**

### Guidelines

- Follow existing code style and structure
- Update documentation (README.md) for any changes
- Add examples when introducing new features
- Test your changes thoroughly
- Keep modules simple and focused

---

## 💬 Support

If you encounter issues or have questions:

- **📖 Documentation**: Check the module-specific README files
- **🐛 Bug Reports**: Open an issue on GitHub
- **💡 Feature Requests**: Open an issue with the "enhancement" label
- **📧 Direct Contact**: Reach out via [LinkedIn](https://www.linkedin.com/in/weyderfs)

---

### Usage

Each module can be used independently in your Terraform or Terragrunt code:

#### Terragrunt Example

```hcl
# terragrunt.hcl
terraform {
  source = "github.com/weyderfs/terraform-aws-modules//service/module-name"
}

# Dependencies (optional)
dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  # Configure your inputs here
  name   = "my-resource"
  vpc_id = dependency.vpc.outputs.vpc_id
  
  tags = {
    Environment = "production"
    ManagedBy   = "terragrunt"
  }
}
```

#### Terraform Example

```hcl
module "example" {
  source = "github.com/weyderfs/terraform-aws-modules//service/module-name"
  
  # Configure your inputs here
  name = "my-resource"
  
  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

For detailed usage instructions, see the README.md file in each module directory.

---

### Author

:computer: **SRE | DevOps Culture | AWS**  
:round_pushpin: **LinkedIn**: [@weyderfs](https://www.linkedin.com/in/weyderfs)


