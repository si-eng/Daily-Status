
module "vpc" {
  source = "/vpc"
  
}
module "common" {
  source = "/common"
  depends_on = [
    module.vpc
  ]
}
module "ecr" {
  source = "ecr"
  depends_on = [
    module.vpc
  ]
}
module "policies" {
  source = "/policies"
}
module "fetch" {
  source = "/fetch"
  depends_on = [
    module.vpc
  ]
}
module "bucket" {
  source = "/bucket"
}
module "service1" {
  source = "/service1"
}
module "service2" {
  source = "/service2"
}
module "service3" {
  source = "/service3"
}
module "service4" {
  source = "/service4"
}
module "service5" {
  source = "/service5"
}
module "service6" {
  source = "/service6"
}
