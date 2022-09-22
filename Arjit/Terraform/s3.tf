resource "aws_s3_bucket" "terraform-s3-new" {
  bucket = "terra1239820testing"  
  policy = file("policy.json")
  website {
  index_document = "index.html"
  
}
  tags = {
    Name        = "Myterraformbucket"
  }  
}
  

resource "aws_s3_bucket_versioning" "versioning_demo" {
  bucket = aws_s3_bucket.terraform-s3-new.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.terraform-s3-new.bucket
  acl    = "private"
}



resource "aws_s3_bucket_object" "index" {
bucket = aws_s3_bucket.terraform-s3-new.bucket
acl = "public-read" 
key = "index.html"
source = "./index.html"
etag = filemd5("./index.html")
}
