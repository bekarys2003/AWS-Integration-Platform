variable "zone_name" {
  type        = string
  description = "Public hosted zone name, e.g. bekarys2003.com"
}

variable "record_name" {
  type        = string
  description = "Full record name, e.g. ecs.bekarys2003.com"
}

variable "alb_dns_name" {
  type        = string
  description = "ALB DNS name"
}

variable "alb_zone_id" {
  type        = string
  description = "ALB hosted zone ID (for Route53 alias)"
}
