output "repo_url" {
  value = aws_codecommit_repository.commitrepotest.clone_url_http
}

output "alb_dns" {
  value = aws_lb.abdloadbalancer.dns_name
}