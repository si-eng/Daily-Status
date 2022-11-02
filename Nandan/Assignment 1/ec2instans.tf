resource "aws_instance" "server1" {
  ami           = "ami-08d4ac5b634553e16"
  instance_type = "t2.micro"
  # key_name   = "asuskey"
  associate_public_ip_address = true
  subnet_id = aws_subnet.seasiasubnet1.id
  vpc_security_group_ids = [aws_security_group.seasiasecuritygroup.id]

  tags = {
    Name = "server1"
  }
  
  user_data = <<-EOF
                #!/bin/bash

                sudo apt update -y 
                sudo apt install apache2 -y
                sudo systemctl start apche2
                                
              EOF
}             


resource "aws_instance" "server2" {
  ami           = "ami-08d4ac5b634553e16"
  instance_type = "t2.micro"
  # key_name   = "asuskey"
  associate_public_ip_address = true
  subnet_id = aws_subnet.seasiasubnet2.id
  vpc_security_group_ids = [aws_security_group.seasiasecuritygroup.id]
  tags = {
    Name = "server2"
  }
  
  user_data = <<-EOF
                #!/bin/bash

                sudo apt update -y 
                sudo apt install nginx -y
                sudo systemctl start nginx
                                
              EOF
}