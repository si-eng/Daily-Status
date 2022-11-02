output "alb_dns_name" {
  value = aws_lb.applications_load_balancer.dns_name
}
output "cloudfront_dns_name" {
  value = aws_cloudfront_distribution.cf_dist.domain_name
}