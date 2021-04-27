locals {
    name                        = "My KMS Key"
    description                 = "My KMS Key Pair"
    key_usage                   = "ENCRYPT_DECRYPT"
    customer_master_key_spec    = "SYMMETRIC_DEFAULT"
    is_enabled                  = true
    enable_key_rotation         = false
    deletion_window_in_days     = 7

}

module "kms" {
    source = "path_to_module/terraform-aws-modules/kms"
    
    name                        = local.name
    description                 = local.description
    deletion_window_in_days     = local.deletion_window_in_days
    key_usage                   = local.key_usage
    customer_master_key_spec    = local.customer_master_key_spec
    is_enabled                  = local.is_enabled
    enable_key_rotation         = local.enable_key_rotation

}