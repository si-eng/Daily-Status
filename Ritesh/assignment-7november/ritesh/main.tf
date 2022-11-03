module "vpc" {
  source = "../vpc-ritesh"
}
module "alb" {
  source     = "../alb-ritesh"
  subnet_ids = [module.vpc.public_subnet_1, module.vpc.public_subnet_2]
  depends_on = [
    module.vpc
  ]
}
module "waf" {
  source     = "../waf"
   name  = "cloudfront-web-acl"
  scope = "CLOUDFRONT"
}
