resource "aws_s3_bucket" "artifacts_bucket_name" {
  bucket = "121asfa"
  force_destroy = true  
  acl    = "private"

  tags = {
    Name        = "jaybucket121"
  }  
}
  