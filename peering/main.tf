resource "aws_vpc_peering_connection" "peering" {
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = var.peer_vpc_id
  vpc_id        = var.vpc_id
  auto_accept   = var.auto_accept
  peer_region   = var.peer_region
  
  dynamic "accepter"  {
    for_each  = var.accepter
    content {
      
      allow_remote_vpc_dns_resolution   = accepter.value.allow_remote_vpc_dns_resolution
      allow_classic_link_to_remote_vpc  = accepter.value.allow_classic_link_to_remote_vpc
      allow_vpc_to_remote_classic_link  = accepter.value.allow_vpc_to_remote_classic_link
    }
  }
  
  dynamic "requester" {
    for_each  = var.requester
    content {
      
      allow_remote_vpc_dns_resolution   = requester.value.allow_remote_vpc_dns_resolution
      allow_classic_link_to_remote_vpc  = requester.value.allow_classic_link_to_remote_vpc
      allow_vpc_to_remote_classic_link  = requester.value.allow_vpc_to_remote_classic_link
    }
  }

  tags  = {
    Name  = var.name
  }
}