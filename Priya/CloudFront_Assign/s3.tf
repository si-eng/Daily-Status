

resource "aws_s3_bucket" "artifacts_bucket_name" {
  bucket = var.artifacts_bucket_name  
  policy = file("policy.json")
  
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

resource "aws_s3_bucket_website_configuration" "artifacts_bucket_name" {
  bucket = aws_s3_bucket.artifacts_bucket_name.bucket
  index_document {
    suffix = "index.html"
  }
}

