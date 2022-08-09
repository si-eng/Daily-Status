resource "aws_instance" "server1" {
  ami           = "ami-006d3995d3a6b963b"
  instance_type = "t2.micro"
  key_name   = "asuskey"
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
                sudo systemctl start apache2
                sudo bash -c 'server1 > /var/www/html/index.html'
              
                #!/bin/bash -xe
                sudo apt update
                sudo apt install ruby -y
                sudo apt install wget
                wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
                sudo chmod +x ./install
                sudo ./install auto
                sudo service codedeploy-agent status
                EOF
}                
resource "aws_instance" "server2" {
  ami           = "ami-006d3995d3a6b963b"
  instance_type = "t2.micro"
  key_name   = "asuskey"
  associate_public_ip_address = true
  subnet_id = aws_subnet.seasiasubnet2.id
  vpc_security_group_ids = [aws_security_group.seasiasecuritygroup.id]
  tags = {
    Name = "server2"
  }
  
  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo bash -c 'server2 > /var/www/html/index.html'

                #!/bin/bash -xe
                sudo apt update
                sudo apt install ruby -y
                sudo apt install wget
                wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
                sudo chmod +x ./install
                sudo ./install auto
                sudo service codedeploy-agent status
              EOF

}