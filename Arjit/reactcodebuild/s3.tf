resource "aws_s3_bucket" "artifacts_bucket_name" {
  bucket = "react129837testing"  
  policy = file("policy.json")
  website {
  index_document = "index.html"
  
}
  tags = {
    Name        = "Myterraformbucket"
  }  
}
  

resource "aws_s3_bucket_versioning" "versioning_demo" {
  bucket = aws_s3_bucket.artifacts_bucket_name.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.artifacts_bucket_name.bucket
  acl    = "private"
}



resource "aws_s3_bucket_object" "index" {
bucket = aws_s3_bucket.artifacts_bucket_name.bucket
acl = "public-read" 
key = "index.html"
source = "./index.html"
etag = filemd5("./index.html")
}