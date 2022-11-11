variable "resource_tag_name" {
  description = "Resource tag name for cost tracking"
  type = string
  default = "Source"
}

variable "category" {
  description = "AWS resource category"
  type = string
  default = "Source"
}

variable "owner" {
  description = "ThirdParty"
  type = string
  default = "ThirdParty"
}

variable "github_token" {
  type        = string
  description = "Github OAuth token"
   default     = "<TOKEN NUMBER>"
}

variable "github_repo" {
  type        = string
  description = "Github repo"
   default     = "<REPO NAME>"
}


variable "github_owner" {
  type        = string
  description = "Github username"
  default     = "<USER NAME>"
}


variable "branch" { 
  type        = string
  description = "branch name"
  default="<BRANCH>"
}

variable "service_name" {
  default = "myservice"
}


variable "app_name" {
type    = string
  default = "new"
}
