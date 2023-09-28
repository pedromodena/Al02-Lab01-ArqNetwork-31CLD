# Variables
variable "resource_tags" {
  description = "Tags"
  type        = map(string)
  default = {
    "Materia" = "Arquitetura Network"
    "Projeto" = "AULA02-LAB01-MULTI-VPC"
  }
}

variable "vpca_names" {
  type = map(string)
  default = {
    "vpc_name" = "VPC-A"
    "subneta"  = "VPC-A-AZ1"
    "subnetb"  = "VPC-A-AZ2"
    "igw"      = "VPC-A-IGW"
    "rtb"      = "VPC-A-RTB"
  }
}

variable "vpcb_names" {
  type = map(string)
  default = {
    "vpc_name" = "VPC-B"
    "subneta"  = "VPC-B-AZ1"
    "subnetb"  = "VPC-B-AZ2"
    "igw"      = "VPC-B-IGW"
    "rtb"      = "VPC-B-RTB"
  }
}

variable "vpcc_names" {
  type = map(string)
  default = {
    "vpc_name" = "VPC-C"
    "subneta"  = "VPC-C-AZ1"
    "subnetb"  = "VPC-C-AZ2"
    "igw"      = "VPC-C-IGW"
    "rtb"      = "VPC-C-RTB"
  }
}

variable "amazon_linux_2023_x64_ami" {
  description = "Amazon Linux 2023 AMI 2023.2.20230920.1 x86_64 HVM kernel-6.1"
  type        = string
  default     = "ami-03a6eaae9938c858c"
}

variable "ec2_name" {
  type    = string
  default = "srv-arqnet-lab01"
}