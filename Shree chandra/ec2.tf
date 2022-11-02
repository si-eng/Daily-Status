resource "aws_instance" "ins1" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  key_name = "terra"
  subnet_id = aws_subnet.public.id
  security_groups = [aws_security_group.public.id]
  associate_public_ip_address = true
  tags                         = {
        "Name" = "terraform1"
    }
    user_data = <<-EOF
                  #!/bin/bash
                  sudo apt update -y
                  sudo apt-get install -y apache2
                  sudo systemctl start apache2
                  sudo systemctl enable apache2
                  sudo apt update
                EOF
}
resource "aws_instance" "ins2" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  key_name = "terra"
  subnet_id = aws_subnet.private.id
  security_groups = [aws_security_group.public.id]
  associate_public_ip_address = true
  tags                         = {
        "Name" = "terraform2"
    }
    user_data = <<-EOF
                  #!/bin/bash
                  sudo apt update -y
                  sudo apt-get install -y apache2
                  sudo systemctl start apache2
                  sudo systemctl enable apache2
                  sudo apt update
                EOF
}
