variable "name" { type = string }

variable "app_fqdn" {
  type        = string
  description = "Your app public FQDN, e.g. ecs.bekarys2003.com"
}

variable "callback_path" {
  type        = string
  default     = "/oauth2/idpresponse"
  description = "ALB Cognito callback path"
}
