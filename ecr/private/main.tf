resource "aws_ecr_repository" "this" {
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability
  force_delete         = var.force_delete


  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  dynamic "image_tag_mutability_exclusion_filter" {
    for_each = var.image_tag_mutability_exclusion_filter
    content {
      filter_type = image_tag_mutability_exclusion_filter.value.filter_type
      filter      = image_tag_mutability_exclusion_filter.value.filter
    }
  }

  encryption_configuration {
    encryption_type = var.encryption_type
    kms_key         = var.kms_key_arn
  }

  tags = var.tags
}

