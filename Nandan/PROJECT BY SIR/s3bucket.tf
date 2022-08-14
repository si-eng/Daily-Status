resource "aws_s3_bucket" "seasiabucket" {
  bucket = "seasiaxcghjkbucket"

  tags = {
    Name = "seasiabucket"
  }
}

resource "aws_s3_bucket_acl" "seasia_acl" {
  bucket = aws_s3_bucket.seasiabucket.id
  acl    = "private"
}