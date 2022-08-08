#creating EC2 instance
resource "aws_instance" "host" {
  ami           = "ami-08d4ac5b634553e16"
  instance_type = "t2.micro"
  #count = 1
  # key_name   = "endpoint"
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet-2.id
  vpc_security_group_ids = [aws_security_group.allow.id]
  iam_instance_profile =  "${aws_iam_instance_profile.ec2_profile.name}"

  tags = {
    Name = "Deployment"
  }
  volume_tags = {
    "Name" = "terraform"
  }
  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                
                sudo apt install ruby-full -y
                sudo apt install wget -y 
                sudo wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
                sudo chmod +x ./install
                sudo ./install auto  
                sudo service codedeploy-agent status 
                sudo service codedeploy-agent restart

              EOF
}