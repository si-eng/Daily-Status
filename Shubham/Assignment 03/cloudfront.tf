# resource "aws_cloudfront_origin_access_identity" "example" {
#   comment = "Some comment"
# }

resource "aws_cloudfront_distribution" "s3_distribution" {
  web_acl_id = aws_wafv2_web_acl.WAF.arn
  
  origin {
    domain_name = aws_s3_bucket.bucket.website_endpoint
    origin_id   = "s3"

    # s3_origin_config {
    #   origin_access_identity = aws_cloudfront_origin_access_identity.example.cloudfront_access_identity_path
    # }
    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  origin {
    domain_name = aws_lb.test.dns_name
    origin_id   = "Loadbalancer"

	custom_origin_config {
		http_port              = 80
		https_port             = 443
		origin_protocol_policy = "http-only"
		origin_ssl_protocols   = ["TLSv1.2"]
	
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Terraform"
#   default_root_object = "index.html"

# Cache behavior with precedence 0
  ordered_cache_behavior {
    path_pattern     = "index.html"
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3"

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "allow-all"
  }

# Cache behavior with precedence 1
  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "Loadbalancer"

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "allow-all"
  }


  price_class = "PriceClass_200"
  viewer_certificate {
    cloudfront_default_certificate = true 
    }
    restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

#   origin_group {
#     origin_id = "clfront"
    
#     failover_criteria {
#       status_codes = [200,201,202, 403, 404, 500, 502]
#     }
    
#     member {
#       origin_id = "Loadbalancer"
#     }

#     member {
#       origin_id = "S3"
#     }
#   }

#   origin {
#     domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name
#     origin_id   = "s3"

#     s3_origin_config {
#       origin_access_identity = aws_cloudfront_origin_access_identity.example.cloudfront_access_identity_path
#     }
#   }
  
#   origin {
#     domain_name = aws_lb.test.dns_name
#     origin_id   = "Loadbalancer"

#     s3_origin_config {
#       origin_access_identity = aws_cloudfront_origin_access_identity.example.cloudfront_access_identity_path
#     }
#   }

}
