resource "aws_s3_bucket" "artifacts_bucket_name" {
  bucket = "django98765testing"  
  acl    = "private"

  tags = {
    Name        = "Myterraformbucket"
  }  
}
  
