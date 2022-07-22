#creating EC2 instance
resource "aws_instance" "nandancicd" {
  ami           = "ami-006d3995d3a6b963b"
  instance_type = "t2.micro"
  #count = 1
  key_name   = "officecicd"
  associate_public_ip_address = true
  #subnet_id = aws_subnet.subnet-2.id
  #vpc_security_group_ids = [aws_security_group.allow.id]
}

user_data = <<-EOF
            #!/bin/bash
            sudo apt update
            sudo apt install ruby -y
            sudo apt install wget
            sudo apt install apache2
            wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
            sudo chmod +x ./install
            sudo ./install auto
            sudo service codedeploy-agent status
        EOF
