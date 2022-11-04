############################# instance 

resource "aws_instance" "service-instance" {
  ami             = "ami-09d3b3274b6c5d4aa"
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.sg.id]
  associate_public_ip_address = true
  user_data = <<-EOF
                    #! /bin/bash
                    sudo apt-get update
                    sudo apt-get install -y apache2
                    sudo systemctl start apache2
                    sudo systemctl enable apache2
                    echo "The page was created by the user data" | sudo tee /var/www/html/index.html
                    EOF

  tags = {
    Name = "service-instance"
  }
  
  
  resource "aws_instance" "ins2" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet_2.id
  security_groups = [aws_security_group.sg.id]
  associate_public_ip_address = true
  tags                         = {
        "Name" = "service-instaance2"
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
