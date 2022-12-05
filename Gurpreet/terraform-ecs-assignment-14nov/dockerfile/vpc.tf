# Creating VPC


resource "aws_vpc" "vpcmain" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "vpcmain"
  }
}

# Creating Public subnet

resource "aws_subnet" "publicsubnet" {
  vpc_id     = aws_vpc.vpcmain.id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "publicsubnet"
  }
}

# Creating Private subnet
resource "aws_subnet" "privatesubnet" {
  vpc_id     = aws_vpc.vpcmain.id
  availability_zone = "us-east-1b"
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "privatesubnet"
  }
}

# Creating internet gateway 

resource "aws_internet_gateway" "internetgw" {
  vpc_id = aws_vpc.vpcmain.id

  tags = {
    Name = "internetgw"
  }
}

# Creating route table

resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.vpcmain.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetgw.id
  }


  tags = {
    Name = "routetable"
  }
}

# Assocating route table with subnet 

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.routetable.id
}