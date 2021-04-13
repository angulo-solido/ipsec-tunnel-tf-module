# The virtual private gateway instance
resource "aws_vpn_gateway" "the_vpn_gateway" {
  count = var.create_virtual_private_gw ? 1 : 0
  availability_zone = "${var.aws_region}${var.aws_availability_zone}"

  tags = var.tags
}

# Attach the VPN gateway to the VPC
resource "aws_vpn_gateway_attachment" "vpn_vpc_attachment" {
  count = var.create_virtual_private_gw ? 1 : 0
  vpc_id         = var.vpc_id
  vpn_gateway_id = aws_vpn_gateway.the_vpn_gateway[0].id
}

# Automatically propagate routes between the VPN gateway and the
# necessary route tables
resource "aws_vpn_gateway_route_propagation" "the_route_propagation" {
  count = length(var.route_table_ids)

  vpn_gateway_id = aws_vpn_gateway.the_vpn_gateway[0].id
  route_table_id = var.route_table_ids[count.index]
}
