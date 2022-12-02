variable "cidr" {
  type    = string
  default = "145.0.0.0/16"
}

variable "azs" {
  type = list(string)
  default = [
    "us-east-1a",
    "us-east-1b"
  ]
}

variable "subnets-ip" {
  type = list(string)
  default = [
    "145.0.1.0/24",
    "145.0.2.0/24"
  ]

}

variable "dns" {
  type    = string
  default = "realtimeanime.tk"
}



####################################################### Repositary Veriable 

variable "repo_name" {
  type    = string
  default = "ecr-repo"
}

variable "branch_name" {
  type    = string
  default = "master"
}

variable "build_project" {
  type    = string
  default = "build_project"
}




variable "ecs_cluster" {
  type    = string
  default = "ecs-cluster-main"
}
