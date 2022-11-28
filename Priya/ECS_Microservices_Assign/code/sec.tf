resource "aws_security_group" "sg1" {
  name        = "django-server"
  description = "Port"
  vpc_id      = aws_vpc.createVPC.id

  ingress {
    description      = "Allow Port 8000"
    from_port        = 80
    to_port          = 88
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description = "Allow all ip and ports outboun"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg2" {      #securitygroup for load balaner
  name        = "django-server-alb"
  description = "Port tcp"
  vpc_id      = aws_vpc.createVPC.id

  ingress {
    description      = "Allow Port 80"
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description = "Allow all ip and ports outboun"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
