# Create a Transit Gateway
resource "aws_ec2_transit_gateway" "tgw_1" {
  description = "Example Transit Gateway"
  tags = {
    Name    = "lab02-transit-gateway"
    Materia = var.resource_tags["Materia"]
    Projeto = var.resource_tags["Projeto"]
  }
}

# Associate VPCs with Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_attachment1" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_1.id
  vpc_id             = aws_vpc.vpc_a.id
  subnet_ids         = [aws_subnet.vpca_subneta.id]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_attachment2" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_1.id
  vpc_id             = aws_vpc.vpc_b.id
  subnet_ids         = [aws_subnet.vpcb_subneta.id]
}