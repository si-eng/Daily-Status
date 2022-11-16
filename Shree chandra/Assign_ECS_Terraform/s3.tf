variable "artifacts_bucket_name22" {
  description = "S3 Bucket for storing artifacts"
  default     = "artifacts-bucket-devops-reactnative"
}
resource "aws_s3_bucket" "bucketdemoo1" {
  bucket = "artifacts-bucket-devops-reactnative"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}