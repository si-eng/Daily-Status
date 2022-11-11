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
  default     = "ShubhamChouhan9001"
}
variable "github_repo" {
  description = "GitHub repository name"
  default     = "https://github.com/ShubhamChouhan9001/React-Native.git"
}

variable "github_token" {
  description = "This is github authentication token"
  default = "<Token>"
  type = string
}
