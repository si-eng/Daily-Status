resource "aws_s3_bucket" "b" {
  bucket = "nandankalia"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}