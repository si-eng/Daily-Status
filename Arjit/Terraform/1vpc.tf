resource "aws_vpc" "createVPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames    = true

  tags = {
    Name = "myterraformvpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.createVPC.id
  tags = {
    "Name" = "myigw"
  }
}


resource "aws_route_table" "routeigm" {
  vpc_id = aws_vpc.createVPC.id

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
  vpc_id = aws_vpc.createVPC.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "public -a1"
  }
}

resource "aws_subnet" "pub-b" {
  vpc_id = aws_vpc.createVPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "public -b1"
  }
}

resource "aws_route_table_association" "table-a" {
  subnet_id      = aws_subnet.pub-a.id
  route_table_id = aws_route_table.routeigm.id
}

resource "aws_route_table_association" "table-b" {
  subnet_id      = aws_subnet.pub-b.id
  route_table_id = aws_route_table.routeigm.id
}


resource "aws_subnet" "private-a" {
  vpc_id                   = aws_vpc.createVPC.id
  cidr_block               = "10.0.2.0/24"
  availability_zone        = "us-east-1a"

  tags      = {
    Name    = "Private Subnet 1 "
  }
}

resource "aws_subnet" "private-b" {
  vpc_id                   = aws_vpc.createVPC.id
  cidr_block               = "10.0.3.0/24"
  availability_zone        = "us-east-1b"

  tags      = {
    Name    = "Private Subnet 2 "
  }
}


resource "aws_security_group" "accesstest" {
  name        = "accesstest"
  vpc_id      = aws_vpc.createVPC.id

  ingress {
    
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  ingress {
    
    from_port        = 443
    to_port          = 443
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
    Name = "accesstestvpc"
  }
}



resource "aws_eip" "nat_gateway" {
  vpc = true
}
#nat and private
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.pub-a.id

  tags = {
    Name = "nat_test"
  }
}

resource "aws_route_table" "private-table" {
  vpc_id = aws_vpc.createVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private-a.id
  route_table_id = aws_route_table.private-table.id
}


resource "aws_security_group" "accessprivatetest" {
  name        = "accessprivatetest"
  vpc_id      = aws_vpc.createVPC.id

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
    Name = "accessprivatetestvpc"
  }
}

