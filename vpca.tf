# VPC A 10.0.0.0/16
# us-east-1a 10.0.0.0/24
# us-east-1b 10.0.1.0/24

resource "aws_vpc" "vpc_a" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name    = var.vpca_names["vpc_name"],
    Materia = var.resource_tags["Materia"],
    Projeto = var.resource_tags["Projeto"]
  }
}

output "out_vpc_a_id" {
  value = aws_vpc.vpc_a.id
}

# Subnet A
resource "aws_subnet" "vpca_subneta" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name    = var.vpca_names["subneta"],
    Materia = var.resource_tags["Materia"],
    Projeto = var.resource_tags["Projeto"]
  }
}

# Subnet Privada
resource "aws_subnet" "vpca_subnetb" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name    = var.vpca_names["subnetb"]
    Materia = var.resource_tags["Materia"],
    Projeto = var.resource_tags["Projeto"]
  }
}