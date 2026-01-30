resource "aws_acm_certificate" "acm" {
  domain_name               = var.domain_name
  validation_method         = var.validation_method
  subject_alternative_names = var.subject_alternative_names

  dynamic "validation_option" {
    for_each = { for option in var.validation_options : option.domain_name => option }
    content {
      domain_name       = validation_option.value.domain_name
      validation_domain = validation_option.value.validation_domain
    }
  }

  dynamic "options" {
    for_each = var.options == null ? [] : [var.options]
    content {
      certificate_transparency_logging_preference = options.value.certificate_transparency_logging_preference
    }
  }

  certificate_authority_arn = var.certificate_authority_arn
  key_algorithm             = var.key_algorithm
  certificate_body          = var.certificate_body
  private_key               = var.private_key
  certificate_chain         = var.certificate_chain

  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags
}