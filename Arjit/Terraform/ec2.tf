resource "aws_instance" "test-terraform" {
  ami           = "ami-0ee23bfc74a881de5" 
  key_name      = "NVaccess"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  security_groups = [ "security_terraform_grp"]

  user_data = <<-EOF
		      #! /bin/bash
          sudo apt-get update
		      sudo apt-get install -y apache2
		      sudo systemctl start apache2
		      sudo systemctl enable apache2
		      echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	EOF


  tags= {
    Name = "terraform_test"
  }
}

resource "aws_security_group" "security_terraform_grp" {
  name        = "security_terraform_grp"
  description = "security group for terraform"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
        from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

   tags= {
    Name = "security_terraform_grp"
  }
}

