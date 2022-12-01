variable "env" {
  description = "Depolyment environment"
  default     = "dev"
}

variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "shubhamchouhantest"
}


data "aws_iam_role" "ecs-task-execution" {

  name = "ecs-task-execution"

}
