resource "aws_s3_bucket" "nandancicdbucket" {
  bucket = "sthreecicd"
  acl    = "public-read"
  policy = file("policy.json")

  
  }
