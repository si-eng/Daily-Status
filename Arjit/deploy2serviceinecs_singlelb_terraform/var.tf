variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "django98765testing"
}

variable "env" {
  description = "Depolyment environment"
  default     = "dev"
}