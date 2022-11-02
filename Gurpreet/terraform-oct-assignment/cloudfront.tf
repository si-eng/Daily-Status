resource "aws_cloudfront_distribution" "distribution" {
  origin {
    domain_name              = aws_lb.abclb.dns_name
    
    origin_id                = "lb"
    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }
  
  
  enabled             = true
  is_ipv6_enabled     = true
  



 
  default_cache_behavior {
    allowed_methods  = ["HEAD", "DELETE", "POST", "GET", "OPTIONS", "PUT", "PATCH"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "lb"
    



   forwarded_values {
      query_string = false
      headers      = ["Origin"]



     cookies {
        forward = "none"
      }
    }



   viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }



 


 price_class = "PriceClass_200"



 restrictions {
    geo_restriction {
      restriction_type = "none"
      
    }
  }



 



 tags = {
    Environment = "production"
  }



 viewer_certificate {
    cloudfront_default_certificate = true
  }
}