
variable "env" {
  description = "Depolyment environment"
  default     = "dev"
}

variable "github_branch" {
  description = "Repository branch to connect to"
  default     = "master"
}

variable "github_owner" {
  description = "GitHub repository owner"
  default     = "shreechandra"
}
variable "github_repo" {
  description = "GitHub repository name"
  default     = "https://github.com/shreechandra/react-native-repo"
}

variable "github_token" {
  description = "This is github authentication token"
  default = "*********"
  type = string
}
