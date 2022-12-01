variable "env" {
  description = "Depolyment environment"
  default     = "dev"
}



variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "nhnbgvfdds6333"
}

variable "gitlink" {

    default = "https://github.com/nandankalia/SERVICES.git"
  
}

variable "gittoken" {

    default = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  
}