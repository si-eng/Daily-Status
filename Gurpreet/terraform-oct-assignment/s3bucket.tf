resource "aws_s3_bucket" "s3test" {
  bucket = "test-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.s3test.id
  acl    = "public-read-write"
}