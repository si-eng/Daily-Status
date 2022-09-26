resource "aws_instance" "test-terraform" {
  ami           = "ami-0ee23bfc74a881de5" 
  key_name      = "NVaccess"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.pub-a.id
  vpc_security_group_ids = [aws_security_group.accesstest.id]

  user_data = <<-EOF
		    #! /bin/bash
            sudo apt-get update
		    sudo apt-get install -y apache2
		    sudo systemctl start apache2
		    sudo systemctl enable apache2
		    echo "<h1>VPC via Terraform</h1>" | sudo tee /var/www/html/index.html
  EOF

  tags= {
    Name = "vpc_test"
  }
}  




resource "aws_instance" "privatevpc-terraform" {
  ami           = "ami-0ee23bfc74a881de5" 
  key_name      = "NVaccess"
  instance_type = "t2.micro"
  associate_public_ip_address = false
  subnet_id = aws_subnet.private-a.id
  vpc_security_group_ids = [aws_security_group.accessprivatetest.id]

  tags= {
    Name = "vpc_private_test"
  }
}  





