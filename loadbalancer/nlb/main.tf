resource "aws_lb" "nlb" {

  name               = var.name
  internal           = var.internal
  load_balancer_type = "network"
  subnets            = var.subnets

  enable_deletion_protection = var.enable_deletion_protection

  dynamic "subnet_mapping" {
      for_each  = var.subnet_mapping
      content   {
          
          subnet_id             = subnet_mapping.value.subnet_id
          allocation_id         = subnet_mapping.value.allocation_id
          private_ipv4_address  = subnet_mapping.value.private_ipv4_address
      }
  }

  tags  = var.tags

}
