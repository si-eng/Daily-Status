


resource "aws_s3_bucket" "buck3" {
  bucket = testingbucket2098 
  
  
  tags = {
    Name        = "Myterraformbucket"
  }  
}
  



resource "aws_s3_bucket_versioning" "versioning_demo" {
  bucket = aws_s3_bucket.buck3.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.buck3.id
  acl    = "public-read-write"
}
