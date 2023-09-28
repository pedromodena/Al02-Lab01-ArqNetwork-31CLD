# Security Group da VM VPC-A
resource "aws_security_group" "srv_vpca_sg" {
  vpc_id = aws_vpc.vpc_a.id

  # Ingress rule 1 (SSH 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # All trafic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "srv-vpca-sg"
    Materia = var.resource_tags["Materia"]
    Projeto = var.resource_tags["Projeto"]
  }

  name = "srv-vpca-sg"
}

# Security Group da VM VPC-B
resource "aws_security_group" "srv_vpcb_sg" {
  vpc_id = aws_vpc.vpc_b.id

  # Ingress rule 1 (SSH 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # All trafic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "srv-vpcb-sg"
    Materia = var.resource_tags["Materia"]
    Projeto = var.resource_tags["Projeto"]
  }

  name = "srv-vpcb-sg"
}

# Security Group da VM VPC-C
resource "aws_security_group" "srv_vpcc_sg" {
  vpc_id = aws_vpc.vpc_c.id

  # Ingress rule 1 (SSH 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # All trafic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "srv-vpcc-sg"
    Materia = var.resource_tags["Materia"]
    Projeto = var.resource_tags["Projeto"]
  }

  name = "srv-vpcc-sg"
}