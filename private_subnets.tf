# private subnet in az 1
resource "aws_subnet" "ITI_private_subnet1" {
  vpc_id     = aws_vpc.ITI_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "ITI_private_subnet1"
  }
}
# private subnet in az 2
resource "aws_subnet" "ITI_private_subnet2" {
  vpc_id     = aws_vpc.ITI_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "ITI_private_subnet2"
  }
}

#route table1 for the private subnet in Az1
resource "aws_route_table" "ITI_private1_rt" {
  vpc_id = aws_vpc.ITI_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ITI_NAT1.id
  }

  tags = {
    Name = "ITI_private1_rt"
  }
}

#route table2 for the private subnet in Az2
resource "aws_route_table" "ITI_private2_rt" {
  vpc_id = aws_vpc.ITI_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ITI_NAT2.id
  }

  tags = {
    Name = "ITI_private2_rt"
  }
}

# attach the private route table to the private subnet in Az1
resource "aws_route_table_association" "ITI_private1_rt_association" {
  subnet_id      = aws_subnet.ITI_private_subnet1.id
  route_table_id = aws_route_table.ITI_private1_rt.id
}

# attach the private route table to the private subnet in Az2
resource "aws_route_table_association" "ITI_private2_rt_association" {
  subnet_id      = aws_subnet.ITI_private_subnet2.id
  route_table_id = aws_route_table.ITI_private2_rt.id
}