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
| [aws_cloudfront_distribution.acd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aliases"></a> [aliases](#input\_aliases) | (Optional) - Extra CNAMEs (alternate domain names), if any, for this distribution. | `string` | n/a | yes |
| <a name="input_default_cache_behavior_allowed_methods"></a> [default\_cache\_behavior\_allowed\_methods](#input\_default\_cache\_behavior\_allowed\_methods) | (Required) - Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin. | `string` | n/a | yes |
| <a name="input_default_cache_behavior_cached_methods"></a> [default\_cache\_behavior\_cached\_methods](#input\_default\_cache\_behavior\_cached\_methods) | (Required) - Controls whether CloudFront caches the response to requests using the specified HTTP methods. | `string` | n/a | yes |
| <a name="input_default_cache_behavior_default_ttl"></a> [default\_cache\_behavior\_default\_ttl](#input\_default\_cache\_behavior\_default\_ttl) | (Optional) - The default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header. | `string` | `3600` | no |
| <a name="input_default_cache_behavior_forwarded_values_cookies_foward"></a> [default\_cache\_behavior\_forwarded\_values\_cookies\_foward](#input\_default\_cache\_behavior\_forwarded\_values\_cookies\_foward) | (Required) - Whether you want CloudFront to forward cookies to the origin that is associated with this cache behavior. You can specify all, none or whitelist. If whitelist, you must include the subsequent whitelisted\_names | `string` | `"all"` | no |
| <a name="input_default_cache_behavior_forwarded_values_query_string"></a> [default\_cache\_behavior\_forwarded\_values\_query\_string](#input\_default\_cache\_behavior\_forwarded\_values\_query\_string) | (Required) - Indicates whether you want CloudFront to forward query strings to the origin that is associated with this cache behavior. | `string` | n/a | yes |
| <a name="input_default_cache_behavior_max_ttl"></a> [default\_cache\_behavior\_max\_ttl](#input\_default\_cache\_behavior\_max\_ttl) | (Optional) - The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. Only effective in the presence of Cache-Control max-age, Cache-Control s-maxage, and Expires headers. | `number` | `86400` | no |
| <a name="input_default_cache_behavior_min_ttl"></a> [default\_cache\_behavior\_min\_ttl](#input\_default\_cache\_behavior\_min\_ttl) | (Optional) - The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated. Defaults to 0 seconds. | `number` | `0` | no |
| <a name="input_default_cache_behavior_target_origin_id"></a> [default\_cache\_behavior\_target\_origin\_id](#input\_default\_cache\_behavior\_target\_origin\_id) | (Required) - The value of ID for the origin that you want CloudFront to route requests to when a request matches the path pattern either for a cache behavior or for the default cache behavior. | `string` | n/a | yes |
| <a name="input_default_cache_behavior_viewer_protocol_policy"></a> [default\_cache\_behavior\_viewer\_protocol\_policy](#input\_default\_cache\_behavior\_viewer\_protocol\_policy) | (Required) - Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. One of allow-all, https-only, or redirect-to-https. | `string` | `"redirect-to-https"` | no |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | (Optional) - The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL. | `string` | `"index.html"` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) - Any descriptions you want to include about the distribution. | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | (Required) - The DNS domain name of either the S3 bucket, or web site of your custom origin. | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | (Required) - Whether the distribution is enabled to accept end user requests for content. | `bool` | `true` | no |
| <a name="input_is_ipv6_enabled"></a> [is\_ipv6\_enabled](#input\_is\_ipv6\_enabled) | (Optional) - Whether the IPv6 is enabled for the distribution. | `bool` | `true` | no |
| <a name="input_logging_config_bucket"></a> [logging\_config\_bucket](#input\_logging\_config\_bucket) | (Required) - The Amazon S3 bucket to store the access logs in | `string` | n/a | yes |
| <a name="input_logging_config_include_cookies"></a> [logging\_config\_include\_cookies](#input\_logging\_config\_include\_cookies) | (Optional) - Specifies whether you want CloudFront to include cookies in access logs. | `bool` | `false` | no |
| <a name="input_logging_config_prefix"></a> [logging\_config\_prefix](#input\_logging\_config\_prefix) | (Optional) - An optional string that you want CloudFront to prefix to the access log filenames for this distribution | `string` | n/a | yes |
| <a name="input_ordered_cache_behavior_compress"></a> [ordered\_cache\_behavior\_compress](#input\_ordered\_cache\_behavior\_compress) | (Optional) - Whether you want CloudFront to automatically compress content for web requests that include Accept-Encoding: gzip in the request header. | `bool` | `false` | no |
| <a name="input_ordered_cache_behavior_default_ttl"></a> [ordered\_cache\_behavior\_default\_ttl](#input\_ordered\_cache\_behavior\_default\_ttl) | (Optional) - The default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header. | `number` | `3600` | no |
| <a name="input_ordered_cache_behavior_forwarded_values_cookies_forward"></a> [ordered\_cache\_behavior\_forwarded\_values\_cookies\_forward](#input\_ordered\_cache\_behavior\_forwarded\_values\_cookies\_forward) | (Required) - Whether you want CloudFront to forward cookies to the origin that is associated with this cache behavior. You can specify all, none or whitelist. If whitelist, you must include the subsequent whitelisted\_names | `string` | `"all"` | no |
| <a name="input_ordered_cache_behavior_forwarded_values_headers"></a> [ordered\_cache\_behavior\_forwarded\_values\_headers](#input\_ordered\_cache\_behavior\_forwarded\_values\_headers) | (Optional) - Headers, if any, that you want CloudFront to vary upon for this cache behavior. Specify * to include all headers. | `string` | `"*"` | no |
| <a name="input_ordered_cache_behavior_forwarded_values_query_string"></a> [ordered\_cache\_behavior\_forwarded\_values\_query\_string](#input\_ordered\_cache\_behavior\_forwarded\_values\_query\_string) | (Required) - Indicates whether you want CloudFront to forward query strings to the origin that is associated with this cache behavior. | `string` | n/a | yes |
| <a name="input_ordered_cache_behavior_max_ttl"></a> [ordered\_cache\_behavior\_max\_ttl](#input\_ordered\_cache\_behavior\_max\_ttl) | (Optional) - The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. Only effective in the presence of Cache-Control max-age, Cache-Control s-maxage, and Expires headers. | `number` | `86400` | no |
| <a name="input_ordered_cache_behavior_min_ttl"></a> [ordered\_cache\_behavior\_min\_ttl](#input\_ordered\_cache\_behavior\_min\_ttl) | (Optional) - The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated. Defaults to 0 seconds. | `number` | `0` | no |
| <a name="input_ordered_cache_behavior_path_allowed_methods"></a> [ordered\_cache\_behavior\_path\_allowed\_methods](#input\_ordered\_cache\_behavior\_path\_allowed\_methods) | (Required) - Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin. | `string` | n/a | yes |
| <a name="input_ordered_cache_behavior_path_cached_methods"></a> [ordered\_cache\_behavior\_path\_cached\_methods](#input\_ordered\_cache\_behavior\_path\_cached\_methods) | (Required) - Controls whether CloudFront caches the response to requests using the specified HTTP methods. | `string` | n/a | yes |
| <a name="input_ordered_cache_behavior_path_pattern"></a> [ordered\_cache\_behavior\_path\_pattern](#input\_ordered\_cache\_behavior\_path\_pattern) | (Required) - The pattern (for example, images/*.jpg) that specifies which requests you want this cache behavior to apply to. | `string` | n/a | yes |
| <a name="input_ordered_cache_behavior_path_target_origin_id"></a> [ordered\_cache\_behavior\_path\_target\_origin\_id](#input\_ordered\_cache\_behavior\_path\_target\_origin\_id) | (Required) - The value of ID for the origin that you want CloudFront to route requests to when a request matches the path pattern either for a cache behavior or for the default cache behavior. | `string` | n/a | yes |
| <a name="input_ordered_cache_behavior_viewer_protocol_policy"></a> [ordered\_cache\_behavior\_viewer\_protocol\_policy](#input\_ordered\_cache\_behavior\_viewer\_protocol\_policy) | (Required) - Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. One of allow-all, https-only, or redirect-to-https. | `string` | `"redirect-to-https"` | no |
| <a name="input_origin_access_control_id"></a> [origin\_access\_control\_id](#input\_origin\_access\_control\_id) | (Optional) - The unique identifier of a CloudFront origin access control for this origin. | `string` | `null` | no |
| <a name="input_origin_id"></a> [origin\_id](#input\_origin\_id) | (Required) - A unique identifier for the origin. | `string` | n/a | yes |
| <a name="input_price_class"></a> [price\_class](#input\_price\_class) | (Optional) - The price class for this distribution. One of PriceClass\_All, PriceClass\_200, PriceClass\_100 | `string` | `"PriceClass_200"` | no |
| <a name="input_restrictions_geo_restriction_locations"></a> [restrictions\_geo\_restriction\_locations](#input\_restrictions\_geo\_restriction\_locations) | (Optional) - The ISO 3166-1-alpha-2 codes for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist). | `string` | n/a | yes |
| <a name="input_restrictions_geo_restriction_restriction_type"></a> [restrictions\_geo\_restriction\_restriction\_type](#input\_restrictions\_geo\_restriction\_restriction\_type) | (Required) - The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist. | `string` | `"none"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The list of resource tags | `map(string)` | `{}` | no |
| <a name="input_viewer_certificate_cloudfront_default_certificate"></a> [viewer\_certificate\_cloudfront\_default\_certificate](#input\_viewer\_certificate\_cloudfront\_default\_certificate) | true if you want viewers to use HTTPS to request your objects and you're using the CloudFront domain name for your distribution. Specify this, acm\_certificate\_arn, or iam\_certificate\_id. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of CDN |
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | The DNS domain name of either the S3 bucket |
| <a name="output_id"></a> [id](#output\_id) | The Cloudfront ID |
<!-- END_TF_DOCS -->