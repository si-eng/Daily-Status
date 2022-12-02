# get hosted zone details
# terraform aws data hosted zone
resource "aws_route53_zone""hosted_zone"{
  name = var.dns
}

# create a record set in route 53
# terraform aws route 53 record
resource "aws_route53_record" "site_domain" {
  zone_id = aws_route53_zone.hosted_zone.zone_id
  name    = "www.${var.dns}"
  type    = "A"

  alias {
    name                   =  aws_lb.app-lb.dns_name
    zone_id                =  aws_lb.app-lb.zone_id
    evaluate_target_health = true
  }
}



resource "aws_route53_record" "site_domain-1" {
  zone_id = aws_route53_zone.hosted_zone.zone_id
  name    = "service-1.${var.dns}"
  type    = "A"

  alias {
    name                   =  aws_lb.app-lb.dns_name
    zone_id                =  aws_lb.app-lb.zone_id
    evaluate_target_health = true
  }
}



resource "aws_route53_record" "site_domain-2" {
  zone_id = aws_route53_zone.hosted_zone.zone_id
  name    = "service-2.${var.dns}"
  type    = "A"

  alias {
    name                   =  aws_lb.app-lb.dns_name
    zone_id                =  aws_lb.app-lb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "site_domain-3" {
  zone_id = aws_route53_zone.hosted_zone.zone_id
  name    = "service-3.${var.dns}"
  type    = "A"

  alias {
    name                   =  aws_lb.app-lb.dns_name
    zone_id                =  aws_lb.app-lb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "site_domain-4" {
  zone_id = aws_route53_zone.hosted_zone.zone_id
  name    = "service-4.${var.dns}"
  type    = "A"

  alias {
    name                   =  aws_lb.app-lb.dns_name
    zone_id                =  aws_lb.app-lb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "site_domain-5" {
  zone_id = aws_route53_zone.hosted_zone.zone_id
  name    = "service-5.${var.dns}"
  type    = "A"

  alias {
    name                   =  aws_lb.app-lb.dns_name
    zone_id                =  aws_lb.app-lb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "site_domain-6" {
  zone_id = aws_route53_zone.hosted_zone.zone_id
  name    = "service-6.${var.dns}"
  type    = "A"

  alias {
    name                   =  aws_lb.app-lb.dns_name
    zone_id                =  aws_lb.app-lb.zone_id
    evaluate_target_health = true
  }
}



