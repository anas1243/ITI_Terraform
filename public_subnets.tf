# public subnet in az 1
resource "aws_subnet" "ITI_public_subnet1" {
  vpc_id     = aws_vpc.ITI_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "ITI_public_subnet1"
  }
}
# public subnet in az 2
resource "aws_subnet" "ITI_public_subnet2" {
  vpc_id     = aws_vpc.ITI_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true


  tags = {
    Name = "ITI_public_subnet2"
  }
}

#route table for both the public subnets in Az1 and Az2
resource "aws_route_table" "ITI_public_rt" {
  vpc_id = aws_vpc.ITI_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ITI_igw.id
  }

  tags = {
    Name = "ITI_public_rt"
  }
}

# attach the public route table to the public subnet in Az1
resource "aws_route_table_association" "ITI_public1_rt_association" {
  subnet_id      = aws_subnet.ITI_public_subnet1.id
  route_table_id = aws_route_table.ITI_public_rt.id
}

# attach the public route table to the public subnet in Az2
resource "aws_route_table_association" "ITI_public2_rt_association" {
  subnet_id      = aws_subnet.ITI_public_subnet2.id
  route_table_id = aws_route_table.ITI_public_rt.id
}