locals {
  callback_url = "https://${var.app_fqdn}${var.callback_path}"
  logout_url   = "https://${var.app_fqdn}/"
}

resource "aws_cognito_user_pool" "this" {
  name = "${var.name}-user-pool"

  # Simple email sign-in
  username_attributes      = ["email"]
  auto_verified_attributes = ["email"]

  password_policy {
    minimum_length    = 10
    require_lowercase = true
    require_uppercase = true
    require_numbers   = true
    require_symbols   = false
  }

  admin_create_user_config {
    allow_admin_create_user_only = false
  }
}

resource "aws_cognito_user_pool_client" "alb" {
  name         = "${var.name}-alb-client"
  user_pool_id = aws_cognito_user_pool.this.id

  generate_secret = true

  # OIDC flows ALB uses
  allowed_oauth_flows                  = ["code"]
  allowed_oauth_scopes                 = ["openid", "email", "profile"]
  allowed_oauth_flows_user_pool_client = true
  supported_identity_providers         = ["COGNITO"]

  callback_urls = [local.callback_url]
  logout_urls   = [local.logout_url]

  explicit_auth_flows = [
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_PASSWORD_AUTH",
  ]
}

# Cognito Hosted UI domain (AWS-managed). Must be globally unique.
# If it collides, change the prefix.
resource "aws_cognito_user_pool_domain" "this" {
  domain       = replace("${var.name}-auth", "_", "-")
  user_pool_id = aws_cognito_user_pool.this.id
}
