output "user_pool_arn" {
  value = aws_cognito_user_pool.this.arn
}

output "user_pool_id" {
  value = aws_cognito_user_pool.this.id
}

output "client_id" {
  value = aws_cognito_user_pool_client.alb.id
}

output "client_secret" {
  value     = aws_cognito_user_pool_client.alb.client_secret
  sensitive = true
}

output "domain" {
  value = aws_cognito_user_pool_domain.this.domain
}
