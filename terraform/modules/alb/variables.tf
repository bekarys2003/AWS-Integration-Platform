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
