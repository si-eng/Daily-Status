#creating s3 bucket to store artifacts
resource "aws_s3_bucket" "mybucket-ecs1087" {
  bucket = "mybucket-ecs1087"
  acl    = "private"
}