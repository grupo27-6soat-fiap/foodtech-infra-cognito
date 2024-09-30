provider "aws" {
  region = "us-east-1" # Substitua pela sua região AWS
}

resource "aws_cognito_user_pool" "user_pool" {
  name = "foodtech-user-pool"

  password_policy {
    minimum_length    = 8
    require_uppercase = true
    require_numbers   = true
  }

  auto_verified_attributes = ["email"]
}

resource "aws_cognito_user_pool_client" "app_client" {
  name = "foodtech-app-client"
  
  user_pool_id = aws_cognito_user_pool.user_pool.id
  
  explicit_auth_flows = [
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_CUSTOM_AUTH",
    "ALLOW_USER_PASSWORD_AUTH"

  ]
  
  generate_secret = false
}
