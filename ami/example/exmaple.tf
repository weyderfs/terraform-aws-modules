locals {
    
    name                    = "MyServerName"
    description             = "MyServerName Image for playland"
    ena_support             = "ena_support"
    virtualization_type     = "hvm"
    root_device_name        = "/dev/xvda"
    architecture            = "x86_64"
    ephemeral_block_device  = "/dev/xvda=snap-XXXXXXXXXXXXXX:8:true:gp2"
    
}

module "ami" {
    source = "path_to_module/terraform-aws-modules/ami"
    
    name                = local.name
    description         = local.description
    ena_support         = local.ena_support
    virtualization_type = local.virtualization_type
    root_device_name    = local.root_device_name
    architecture        = local.architecture    

}