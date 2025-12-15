variable "name" { type = string }
variable "vpc_id" { type = string }
variable "public_subnets" { type = list(string) }
variable "app_port" { type = number }

variable "enable_https" {
  type    = bool
  default = true
}

variable "certificate_arn" {
  type        = string
  description = "ACM certificate ARN for HTTPS"
  default     = null
}

variable "enable_cognito_auth" {
  type    = bool
  default = false
}

variable "cognito_user_pool_arn" {
  type    = string
  default = null
}

variable "cognito_user_pool_client_id" {
  type    = string
  default = null
}

variable "cognito_user_pool_domain" {
  type    = string
  default = null
}

variable "app_fqdn" {
  type        = string
  description = "e.g. ecs.bekarys2003.com"
  default     = null
}

variable "cognito_hosted_domain" {
  type        = string
  description = "Full Cognito hosted UI domain, e.g. xxx.auth.ca-central-1.amazoncognito.com"
  default     = null
}