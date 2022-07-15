variable "github_token" {
  type        = string
  description = "Github OAuth token"
   default     = "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"
}

variable "github_repo" {
  type        = string
  description = "Github repo"
   default     = "Nandan-react-manual-terraform"
}


variable "github_owner" {
  type        = string
  description = "Github username"
  default     = "nandankalia"
}


variable "branch" { 
  type        = string
  description = "branch name"
  default="terraform"
}





variable "service_name" {
  default = "react"
}


variable "app_name" {
type    = string
  default = "new"
}

variable "env" {
    description = "cicdvone"
    default = "dev"
  
}