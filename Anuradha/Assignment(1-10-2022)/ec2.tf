resource "aws_instance" "anuuuuuuuuuu-inst1" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  #key_name = "anuuuuuuuuuu1"
  subnet_id = aws_subnet.terrapublicpublic.id
  security_groups = [aws_security_group.public.id]
  associate_public_ip_address = true
  tags                         = {
        "Name" = "instanceterra1"
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
resource "aws_instance" "anuuuuuuuuuu-inst2" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  #key_name = "anuuuuuuuuuu1"
  subnet_id = aws_subnet.terraprivate.id
  security_groups = [aws_security_group.public.id]
  associate_public_ip_address = true
  tags                         = {
        "Name" = "instanceterra2"
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