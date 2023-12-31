# VPC B 10.1.0.0/16
# us-east-1a 10.1.0.0/24
# us-east-1b 10.1.1.0/24

resource "aws_vpc" "vpc_b" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name    = var.vpcb_names["vpc_name"]
    Materia = var.resource_tags["Materia"]
    Projeto = var.resource_tags["Projeto"]
  }
}

output "out_vpc_b_id" {
  value = aws_vpc.vpc_b.id
}

# Subnet A
resource "aws_subnet" "vpcb_subneta" {
  vpc_id            = aws_vpc.vpc_b.id
  cidr_block        = "10.1.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name    = var.vpcb_names["subneta"]
    Materia = var.resource_tags["Materia"]
    Projeto = var.resource_tags["Projeto"]
  }
}

# Subnet Privada
resource "aws_subnet" "vpcb_subnetb" {
  vpc_id            = aws_vpc.vpc_b.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name    = var.vpcb_names["subnetb"]
    Materia = var.resource_tags["Materia"]
    Projeto = var.resource_tags["Projeto"]
  }
}

# Internet Gateway
resource "aws_internet_gateway" "vpcb_internet_gateway" {
  vpc_id = aws_vpc.vpc_b.id

  tags = {
    Name    = var.vpcb_names["igw"]
    Materia = var.resource_tags["Materia"]
    Projeto = var.resource_tags["Projeto"]
  }
}

# Route Table
resource "aws_route_table" "vpcb_rtb" {
  vpc_id = aws_vpc.vpc_b.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpcb_internet_gateway.id
  }

  tags = {
    Name    = var.vpcb_names["rtb"]
    Materia = var.resource_tags["Materia"]
    Projeto = var.resource_tags["Projeto"]
  }
}

resource "aws_main_route_table_association" "vpcb_rtb_association" {
  vpc_id         = aws_vpc.vpc_b.id
  route_table_id = aws_route_table.vpcb_rtb.id
}