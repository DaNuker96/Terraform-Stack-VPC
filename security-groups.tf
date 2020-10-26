
#SECURITY GROUPS

resource "aws_security_group" "terraform_sg" {
  name        = "terraform_ec2_sg"
  description = "Allow limited inbound external traffic"
  vpc_id      = aws_vpc.terraform_vpc.id

  ingress {
    protocol    = "tcp"
    cidr_blocks = [var.trusted-ipv4-address]
    from_port   = 22
    to_port     = 22
    description = "SSH Access"
  }
  ingress {
    protocol    = "tcp"
    cidr_blocks = [var.cidr-block-open]
    from_port   = 80
    to_port     = 80
    description = "HTTP Access"
  }
  egress {
    protocol    = "-1"
    cidr_blocks = [var.cidr-block-open]
    from_port   = 0
    to_port     = 0
    description = "Outbound"
  }
  tags = {
    Name = "ec2-sg"
  }
}
