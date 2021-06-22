resource "aws_dynamodb_table" "dynamodb" {

  name                    = var.dynamodb_name
  billing_mode            = var.billing_mode
  read_capacity           = var.read_capacity
  write_capacity          = var.write_capacity
  hash_key                = var.hash_key         ###PARTITION KEY
  range_key               = var.range_key        ###SORT KEY
  
  point_in_time_recovery {
    enabled = var.point_in_time_recovery
  }
  
  dynamic "ttl" {
    for_each  = var.ttl
    content {

    attribute_name = ttl.value.attribute_name
    enabled        = ttl.value.enabled

    }
  }

  dynamic "attribute" {
    for_each  = var.attributes
    content {

      name = attribute.value.name
      type = attribute.value.type

    }
  }
  
  dynamic "local_secondary_index" {
    for_each  = var.local_secondary_indexes
    content {
      
      name                = local_secondary_index.value.name
      range_key           = local_secondary_index.value.range_key
      projection_type     = local_secondary_index.value.projection_type
      non_key_attributes  = local_secondary_index.value.non_key_attributes
    }
  }

  dynamic "global_secondary_index" {
    for_each  = var.global_secondary_indexes
    content {

      name                  = global_secondary_index.value.name
      hash_key              = global_secondary_index.value.hash_key
      range_key             = global_secondary_index.value.range_key
      write_capacity        = global_secondary_index.value.write_capacity
      read_capacity         = global_secondary_index.value.read_capacity
      projection_type       = global_secondary_index.value.projection_type
      non_key_attributes    = global_secondary_index.value.non_key_attributes

    }
  }

  stream_enabled = var.stream_enabled
  stream_view_type = var.stream_view_type
    
  server_side_encryption  {

    enabled = var.server_side_encryption_enabled
    kms_key_arn = var.server_side_encryption_kms_key_arn

    }

  tags  = var.tags
}