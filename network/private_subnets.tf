# private subnet in az 1
resource "aws_subnet" "ITI_private_subnet1" {
  vpc_id     = aws_vpc.ITI_vpc.id
  cidr_block = var.private_subnet1_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = var.private_subnet1_name
  }
}
# private subnet in az 2
resource "aws_subnet" "ITI_private_subnet2" {
  vpc_id     = aws_vpc.ITI_vpc.id
  cidr_block = var.private_subnet2_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = var.private_subnet2_name
  }
}

#route table for both the private subnets in Az1 and Az2
resource "aws_route_table" "ITI_private_rt" {
  vpc_id = aws_vpc.ITI_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ITI_NAT1.id
  }

  tags = {
    Name = "ITI_private_rt"
  }
}

# attach the private route table to the private subnet in Az1
resource "aws_route_table_association" "ITI_private1_rt_association" {
  subnet_id      = aws_subnet.ITI_private_subnet1.id
  route_table_id = aws_route_table.ITI_private_rt.id
}

# attach the private route table to the private subnet in Az2
resource "aws_route_table_association" "ITI_private2_rt_association" {
  subnet_id      = aws_subnet.ITI_private_subnet2.id
  route_table_id = aws_route_table.ITI_private_rt.id
}