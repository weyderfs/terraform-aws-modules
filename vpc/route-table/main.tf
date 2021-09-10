resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id
  tags   = var.tags
}

resource "aws_route" "route" {
  count = length(var.routes)

  route_table_id = aws_route_table.route_table.id

  destination_cidr_block      = try(var.routes[count.index].destination_cidr_block, null)
  destination_ipv6_cidr_block = try(var.routes[count.index].destination_ipv6_cidr_block, null)
  
  gateway_id                 = try(var.routes[count.index].gateway_id, null)
  carrier_gateway_id         = try(var.routes[count.index].carrier_gateway_id, null)
  destination_prefix_list_id = try(var.routes[count.index].destination_prefix_list_id, null)
  egress_only_gateway_id     = try(var.routes[count.index].egress_only_gateway_id, null)
  instance_id                = try(var.routes[count.index].instance_id, null)
  local_gateway_id           = try(var.routes[count.index].local_gateway_id, null)
  nat_gateway_id             = try(var.routes[count.index].nat_gateway_id, null)
  network_interface_id       = try(var.routes[count.index].network_interface_id, null)
  transit_gateway_id         = try(var.routes[count.index].transit_gateway_id, null)
  vpc_endpoint_id            = try(var.routes[count.index].vpc_endpoint_id, null)
  vpc_peering_connection_id  = try(var.routes[count.index].vpc_peering_connection_id, null)

  depends_on = [aws_route_table.route_table]
}

resource "aws_route_table_association" "a" {
  count = length(var.subnet_associations)

  route_table_id = aws_route_table.route_table.id
  subnet_id      = var.subnet_associations[count.index]
}
