locals {
  name                            = "my-dynamodb-name"
  hash_key                        = "step"    ###PARTITION KEY
  range_key                       = "step_id" ###SORT KEY
  billing_mode                    = "PROVISIONED"
  read_capacity                   = 5
  write_capacity                  = 5
  ttl_enabled                     = false
  stream_enabled                  = true
  stream_view_type                = "NEW_AND_OLD_IMAGES"
  server_side_encryption_enabled  = false

}

module "dynamodb" {
  source = "path_to_module/terraform-aws-modules/dynamodb"

  dynamodb_name                   = local.name
  read_capacity                   = local.read_capacity
  write_capacity                  = local.write_capacity
  hash_key                        = local.hash_key
  range_key                       = local.range_key
  billing_mode                    = local.billing_mode
  stream_enabled                  = local.stream_enabled
  stream_view_type                = local.stream_view_type
  server_side_encryption_enabled  = local.server_side_encryption_enabled

   attributes = [{
     
    name   = local.hash_key
    type = "S"
  
   }]
}

