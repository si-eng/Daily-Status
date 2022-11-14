######################################################
## Data to fetch VPC details
######################################################

data "aws_vpc" "vpc_selected" {
  filter {
    name   = "tag:Name"
    values = ["tcw_vpc"]
  }
}

###################################################################
## Data to be fetched for subnets
##################################################################
data "aws_security_groups" "sg" {
  tags = {
    Name = "tcw_security_group"
  }
}