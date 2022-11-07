

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.deploy_aws.zone_id
  name    = "www.arjitdevops.tk"
  type    = "A"

  alias {
    name                   = aws_lb.app-lb.dns_name
    zone_id                = aws_lb.app-lb.zone_id
    evaluate_target_health = true
  }
}


resource "aws_route53_zone" "deploy_aws" {
  name = "arjitdevops.tk"

  tags = {
    Environment = "dev"
  }
}

