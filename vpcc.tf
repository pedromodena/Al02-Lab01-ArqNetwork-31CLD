# VPC C 10.2.0.0/16
# us-east-1a 10.2.0.0/24
# us-east-1b 10.2.1.0/24

resource "aws_vpc" "vpc_c" {
  cidr_block = "10.2.0.0/16"

  tags = {
    Name    = var.vpcc_names["vpc_name"]
    Materia = var.resource_tags["Materia"]
    Projeto = var.resource_tags["Projeto"]
  }
}

output "out_vpc_c_id" {
  value = aws_vpc.vpc_c.id
}

# Subnet A
resource "aws_subnet" "vpcc_subneta" {
  vpc_id            = aws_vpc.vpc_c.id
  cidr_block        = "10.2.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name    = var.vpcc_names["subneta"]
    Materia = var.resource_tags["Materia"]
    Projeto = var.resource_tags["Projeto"]
  }
}

# Subnet Privada
resource "aws_subnet" "vpcc_subnetb" {
  vpc_id            = aws_vpc.vpc_c.id
  cidr_block        = "10.2.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name    = var.vpcc_names["subnetb"]
    Materia = var.resource_tags["Materia"]
    Projeto = var.resource_tags["Projeto"]
  }
}

# Internet Gateway
resource "aws_internet_gateway" "vpcc_internet_gateway" {
  vpc_id = aws_vpc.vpc_c.id

  tags = {
    Name    = var.vpcc_names["igw"]
    Materia = var.resource_tags["Materia"]
    Projeto = var.resource_tags["Projeto"]
  }
}