resource "aws_cognito_user_pool_domain" "cognito-domain" {
  domain       = "navy"
  user_pool_id = "${aws_cognito_user_pool.login_pool.id}"
}