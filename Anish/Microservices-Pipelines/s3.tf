resource "aws_s3_bucket" "artifacts_bucket_name" {
  bucket = "bncdjhb689028"
  force_destroy = true  
  acl    = "private"

  tags = {
    Name        = "test-bucket"
  }  
}