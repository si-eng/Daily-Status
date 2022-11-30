provider "aws" {
  region  = "us-east-1"
}

########################################## IAM Role #############################################

data "aws_iam_role" "ecs-task" {
  name = "taskexcution"
}

############################################ Varible #############################################

variable "env" {
  description = "Depolyment environment"
  default     = "dev"
}



variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "nhnbgvfdds6333"
}
