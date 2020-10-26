
#VPC

resource "aws_vpc" "terraform_vpc" {
  cidr_block           = var.vpc-cidr-block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "terraform-vpc"
  }
}

#Route Table

resource "aws_route_table" "vpc_public_route" {

  depends_on = [aws_vpc.terraform_vpc, aws_internet_gateway.terraform_vpc_igw]
  vpc_id     = aws_vpc.terraform_vpc.id

  route {
    cidr_block = var.cidr-block-open
    gateway_id = aws_internet_gateway.terraform_vpc_igw.id
  }

  tags = {
    Name = "internet-gateway-route-table"
  }
}

#Route Table Association

resource "aws_route_table_association" "vpc_public_route" {

  depends_on = [aws_subnet.terraform_subnet_1, aws_route_table.vpc_public_route, ]

  subnet_id      = aws_subnet.terraform_subnet_1.id
  route_table_id = aws_route_table.vpc_public_route.id
}

#Subnet

resource "aws_subnet" "terraform_subnet_1" {
  depends_on        = [aws_vpc.terraform_vpc, ]
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.subnet-cidr-block
  availability_zone = "eu-west-2a"

  tags = {
    Name = "public-subnet"
  }

  map_public_ip_on_launch = true
}

#Internet Gateway

resource "aws_internet_gateway" "terraform_vpc_igw" {
  depends_on = [aws_vpc.terraform_vpc, ]

  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "internet-gateway"
  }
}



