module "vpc" {
  source = "/vpc-module"
}
module "rds" {
  source = "/rds-module"
  depends_on = [
  module.vpc]
}
module "alb" {
  source     = "/alb-module"
  subnet_ids = [module.vpc.public_subnet_1, module.vpc.public_subnet_2]
  depends_on = [
    module.vpc
  ]
}
module "waf" {
  source     = "/waf"
   name  = "cloudfront-web-acl"
  scope = "CLOUDFRONT"
}
