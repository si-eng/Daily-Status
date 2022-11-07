resource "aws_vpc" "routeVPC" {
  cidr_block       = "14.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames    = true

  tags = {
    Name = "myterraformvpc"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.routeVPC.id
  tags = {
    "Name" = "myigw"
  }
}

resource "aws_route_table" "routeigm" {
  vpc_id = aws_vpc.routeVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_subnet" "pub-a" {
  vpc_id = aws_vpc.routeVPC.id
  cidr_block = "14.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "public -a1"
  }
}

resource "aws_route_table_association" "table-a" {
  subnet_id      = aws_subnet.pub-a.id
  route_table_id = aws_route_table.routeigm.id
}
