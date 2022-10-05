resource "aws_s3_bucket" "artifacts_bucket_name" {
  bucket = "djangoreacttesting"  
  acl    = "private"

  tags = {
    Name        = "Myterraformbucket"
  }  
}
  