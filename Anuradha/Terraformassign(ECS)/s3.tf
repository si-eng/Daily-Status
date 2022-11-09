resource "aws_s3_bucket" "artifacts_bucket_name_aacclll" {
  bucket = "ecsbucketerraformaclll"  
  #acl    = "private"

  tags = {
    Name        = "ecsterraformacll"
  }  
}
  