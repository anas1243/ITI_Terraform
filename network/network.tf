resource "aws_vpc" "ITI_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "ITI_igw" {
  tags = {
    Name = "ITI_igw"
  }
}

resource "aws_internet_gateway_attachment" "ITI_igw_attachment" {
  internet_gateway_id = aws_internet_gateway.ITI_igw.id
  vpc_id              = aws_vpc.ITI_vpc.id
}

#EIP for NAT1
resource "aws_eip" "ITI_NAT1_EIP" {
depends_on = [aws_internet_gateway.ITI_igw]
}

#Nat1 in public subnet 1 serves private subnet 1
resource "aws_nat_gateway" "ITI_NAT1" {
  allocation_id = aws_eip.ITI_NAT1_EIP.id
  subnet_id     = aws_subnet.ITI_public_subnet1.id

  tags = {
    Name = "ITI_NAT1"
  }


  depends_on = [aws_internet_gateway.ITI_igw]
}