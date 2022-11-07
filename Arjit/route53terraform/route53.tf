resource "aws_route53_zone" "deploy_aws" {
  name = "sdfcwfsdfff.tk"

  tags = {
    Environment = "dev"
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.deploy_aws.zone_id
  name    = "www.sdfcwfsdfff.tk"
  type    = "A"
  ttl     = "3600"
  records = [aws_eip.eip.public_ip]
}

output "name_server"{
  value=aws_route53_zone.deploy_aws.name_servers
}