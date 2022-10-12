resource "aws_cognito_user_pool" "login_pool" {
  name = "login-pool"

  username_attributes = ["email", "phone_number"]
    

  
  auto_verified_attributes = ["email"]   #phone_number
  password_policy {
    minimum_length = 6
    require_lowercase = true
    require_numbers   = true
  }

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
    email_subject = "You've been invited to AWS Cognito"
    email_message = "your verification code is '{####}'."
    
    sms_message = "your verification code is '{####}'."
    
  }

  sms_configuration {
    sns_caller_arn = aws_iam_role.cognito_sms.arn
    external_id    = random_string.external_id.result
  }



  

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true

    string_attribute_constraints {
      min_length = 1
      max_length = 256
    }
  }

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "phone_number"
    required                 = true

    string_attribute_constraints {
      min_length = 0
      max_length = 15
    }
  }

  

}


