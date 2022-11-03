resource "aws_s3_bucket" "shubham" {
  acl    = "public-read"
  bucket = "laksmdnbf"  
  tags = {
    Name        = "s3 bucket"
  }  
}

resource "aws_s3_bucket_website_configuration" "staging" {
  bucket = aws_s3_bucket.shubham.bucket

   index_document {
    suffix = "index.html"
  }

  error_document {
    key = "/index.html"
  }
}