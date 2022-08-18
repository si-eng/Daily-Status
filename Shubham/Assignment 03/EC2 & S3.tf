resource "aws_instance" "host" {
  ami           = "ami-08d4ac5b634553e16"
  instance_type = "t2.micro"

  associate_public_ip_address = true
  subnet_id = aws_subnet.mysubnet1.id
  vpc_security_group_ids = [aws_security_group.allow.id]

  tags = {
    Name = "Shubham"
  }

  user_data = <<-EOF
                #!/bin/bash

                sudo apt update  
                sudo apt install nginx -y
                sudo systemctl start nginx
                                
              EOF
}

resource "aws_s3_bucket" "bucket" {
  acl    = "public-read"
  bucket = "jhgffdcvbyhn876ghjbh"  
  tags = {
    Name        = "My s3 bucket"
  }  
}
resource "aws_s3_bucket_acl" "b_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_website_configuration" "staging" {
  bucket = aws_s3_bucket.bucket.bucket

   index_document {
    suffix = "index.html"
  }

  error_document {
    key = "/index.html"
  }
}
