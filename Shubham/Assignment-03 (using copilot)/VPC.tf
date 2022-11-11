resource "aws_vpc" "shubvpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  enable_classiclink_dns_support = true

  enable_classiclink = true
  tags ={
    Name = "teraform"
  }
}

resource "aws_subnet" "mysubnet1" {
  vpc_id = aws_vpc.shubvpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1f"
  tags = {
    "Name" = "mysubnet"
  }
}
resource "aws_subnet" "mysubnet2" {
  vpc_id = aws_vpc.shubvpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-1d"
  tags = {
    "Name" = "mysubnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.shubvpc.id
  tags = {
    "Name" = "mygateway"
  }
}

resource "aws_security_group" "allow" {
  name        = "allow"
  vpc_id      = aws_vpc.shubvpc.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  ingress {
    from_port        = 5050
    to_port          = 5050
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow"
  }
}


resource "aws_route_table" "shubham" {
  vpc_id = aws_vpc.shubvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "shubham"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.mysubnet1.id
  route_table_id = aws_route_table.shubham.id
}