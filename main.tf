# Config
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 5.17"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

# Criação da VM VPC-A
resource "aws_instance" "srv-vpca" {
  ami           = var.amazon_linux_2023_x64_ami
  instance_type = "t2.micro"

  tags = {
    Name    = "srv-vpca",
    Materia = var.resource_tags["Materia"],
    Projeto = var.resource_tags["Projeto"]
  }

  subnet_id                   = aws_subnet.vpca_subneta.id
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.srv_vpca_sg.id]

  iam_instance_profile = var.iam_instance_profile
}

output "out_srv_vpca_private_ip" {
  value = aws_instance.srv-vpca.private_ip
}

# Criação da VM VPC-B
resource "aws_instance" "srv-vpcb" {
  ami           = var.amazon_linux_2023_x64_ami
  instance_type = "t2.micro"

  tags = {
    Name    = "srv-vpcb",
    Materia = var.resource_tags["Materia"],
    Projeto = var.resource_tags["Projeto"]
  }

  subnet_id                   = aws_subnet.vpcb_subneta.id
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.srv_vpcb_sg.id]

  iam_instance_profile = var.iam_instance_profile
}

output "out_srv_vpcb_private_ip" {
  value = aws_instance.srv-vpcb.private_ip
}

# Criação da VM VPC-C
resource "aws_instance" "srv-vpcc" {
  ami           = var.amazon_linux_2023_x64_ami
  instance_type = "t2.micro"

  tags = {
    Name    = "srv-vpcc",
    Materia = var.resource_tags["Materia"],
    Projeto = var.resource_tags["Projeto"]
  }

  subnet_id                   = aws_subnet.vpcc_subneta.id
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.srv_vpcc_sg.id]

  iam_instance_profile = var.iam_instance_profile
}

output "out_srv_vpcc_private_ip" {
  value = aws_instance.srv-vpcc.private_ip
}