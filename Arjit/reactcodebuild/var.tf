variable "env" {
  description = "Depolyment environment"
  default     = "dev"
}

variable "github_branch" {
  description = "Repository branch to connect to"
  default     = "main"
}

variable "github_owner" {
  description = "GitHub repository owner"
  default     = "arjit547"
}

variable "github_repo" {
  description = "GitHub repository name"
  default     = "https://github.com/arjit547/reacttesthello.git"
}

variable "github_token" {
  description = "This is github authentication token"
  default = "***********"
  type = string
}

variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "react129837testing"
}