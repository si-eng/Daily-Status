variable "env" {
  description = "Depolyment environment"
  default     = "dev"
}




variable "repo_name" {
  type    = string
  default = "6_ECS_Microservices"
}

variable "branch_name" {
  type    = string
  default = "master"
}

variable "build_project" {
  type    = string
  default = "dev-build-repo"
}


variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "ecspipartificat"
}

variable  "service1"{
  default = "html_service1"
}

variable  "service2"{
  default = "html_service2"
}


variable  "service3"{
  default = "html_service3"
}

variable  "service4"{
  default = "html_service4"
}

variable  "service5"{
  default = "html_service5"
}

variable  "service6"{
  default = "html_service6"
}
