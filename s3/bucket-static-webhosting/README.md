<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket_website_configuration.aswc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl"></a> [acl](#input\_acl) | (Optional, Conflicts with access\_control\_policy) The canned ACL to apply to the bucket. | `string` | `"private"` | no |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | (Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name. Must be lowercase and less than or equal to 63 characters in length. | `string` | n/a | yes |
| <a name="input_index_document_error_document_key"></a> [index\_document\_error\_document\_key](#input\_index\_document\_error\_document\_key) | (Required) The object key name to use when a 4XX class error occurs. | `string` | n/a | yes |
| <a name="input_index_document_suffix"></a> [index\_document\_suffix](#input\_index\_document\_suffix) | (Required) A suffix that is appended to a request that is for a directory on the website endpoint. For example, if the suffix is index.html and you make a request to samplebucket/images/, the data that is returned will be for the object with the key name images/index.html. The suffix must not be empty and must not include a slash character. | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | (Required) The text of the policy. Although this is a bucket policy rather than an IAM policy, the aws\_iam\_policy\_document data source may be used, so long as it specifies a principal. | `string` | n/a | yes |
| <a name="input_routing_rule_condition_key_prefix_equals"></a> [routing\_rule\_condition\_key\_prefix\_equals](#input\_routing\_rule\_condition\_key\_prefix\_equals) | (Optional, Required if http\_error\_code\_returned\_equals is not specified) The object key name prefix when the redirect is applied. If specified with http\_error\_code\_returned\_equals, then both must be true for the redirect to be applied. | `string` | n/a | yes |
| <a name="input_routing_rule_redirect_replace_key_prefix_with"></a> [routing\_rule\_redirect\_replace\_key\_prefix\_with](#input\_routing\_rule\_redirect\_replace\_key\_prefix\_with) | (Optional, Conflicts with replace\_key\_with) The object key prefix to use in the redirect request. For example, to redirect requests for all pages with prefix docs/ (objects in the docs/ folder) to documents/, you can set a condition block with key\_prefix\_equals set to docs/ and in the redirect set replace\_key\_prefix\_with to /documents. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The resource Tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket"></a> [bucket](#output\_bucket) | Name of the Bucket |
<!-- END_TF_DOCS -->