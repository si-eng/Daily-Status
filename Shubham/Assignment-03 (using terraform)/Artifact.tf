variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "artifacts-bucket-devops-rectnative1"
}
resource "aws_s3_bucket" "bucket" {
  acl    = "public-read"
  bucket = "jhgffdcvbyhn876ghjbh"  
  tags = {
    Name        = "My s3 bucket"
  }  

}

