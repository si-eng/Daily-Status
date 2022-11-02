resource "aws_wafv2_ip_set" "test" {
  name               = "test"
  description        = "Example IP set"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
  addresses          = ["157.39.11.113/32"]

}

resource "aws_wafv2_web_acl" "example" {
  name        = "managed-rule-example"
  description = "Example of a managed rule."
  scope       = "REGIONAL"
  default_action {
    allow {}
  }

  rule {
    name     = "rule-1"
    priority = 0
    action {
      block {}
    }

    statement {

          ip_set_reference_statement {
            arn = aws_wafv2_ip_set.test.arn
          }
        }
        visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "rule-1"
      sampled_requests_enabled   = false
    }
  }
  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "friendly-metric-name"
    sampled_requests_enabled   = false
  }
}

resource "aws_wafv2_web_acl_association" "example" {
  resource_arn = aws_lb.app-lb.arn
  web_acl_arn  = aws_wafv2_web_acl.example.arn
}



