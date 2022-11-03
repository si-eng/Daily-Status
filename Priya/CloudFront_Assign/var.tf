############################################  variable  #################################

variable "create_igw" {
  description = "created internet_gatway"
  type        = bool
  default     = null
}
variable "igw_tag" {
  type        = string
  default     = "service_igw"
}
variable "public_route_table_tag" {
  description = "created  public route table"
  type        = string
  default     = "service_public_route_table"
}

variable "cidr" {
  description = "Enter the CIDR range required for VPC"
  type        = string
  default     = "192.168.0.0/16"
}
variable "enable_dns_hostnames" {
  description = "Enable DNS Hostname"
  type        = bool
  default     = null
}

variable "enable_dns_support" {
  description = "Enable DNS Support"
  type        = bool
  default     = null
}
variable "enable_ipv6" {
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block."
  type        = bool
  default     = null
}

variable "vpc_name" {
  description = "created VPC"
  type        = string
  default     = "service_vpc"
}

variable "default_security_group_name" {
  description = "Enter the name for security group"
  type        = string
  default     = null
}

variable "enable_dhcp_options" {
  description = "Enable DHCP options.. True or False"
  type        = bool
  default     = null
}

variable "manage_default_route_table" {
  description = "Are we managing default route table"
  type        = bool
  default     = null
}
variable "public_subnet_tag_1" {
  description = "Tag for public subnet"
  type        = string
  default     = "service_public_subnet_az_1a"
}
variable "public_subnet_tag_2" {
  description = "Tag for public subnet"
  type        = string
  default     = "service_public_subnet_az_1b"
}

variable "public_subnet" {
  description = "enter the number of public subnets "
  type        = number
  default     = null
}

variable "public_subnets_cidr_1" {
  description = "Cidr Blocks"
  type        = string
  default     = "192.168.1.0/24"
}
variable "public_subnets_cidr_2" {
  description = "Cidr Blocks"
  type        = string
  default     = "192.168.2.0/24"
}

variable "map_public_ip_on_launch" {
  description = " public ip while launching resources"
  type        = bool
  default     = null
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "sg" {
  type    = list(any)
  default = ["sg-0858149edde4ae5ae"]
}
variable "subnet_id" {
  type    = string
  default = "subnet-03a2ea8c56ec8a1f2"
}

variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "myuniquebucket123456789"
}
