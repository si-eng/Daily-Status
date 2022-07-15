resource "aws_instance" "cicdpipeline" {
  ami           = "ami-08df646e18b182346" 
  instance_type = "t2.micro"

}