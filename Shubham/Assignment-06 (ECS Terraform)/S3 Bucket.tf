resource "aws_s3_bucket" "artifacts_bucket_name" {
  bucket = "shubhamchouhantest"
  force_destroy = true  
  acl    = "private"

  tags = {
    Name        = "Myterraformbucket"
  }  
}
  