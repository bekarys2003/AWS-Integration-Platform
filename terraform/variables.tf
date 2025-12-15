variable "aws_region" {
  type    = string
  default = "ca-central-1" # change to your preferred region
}

variable "project" {
  type    = string
  default = "acorn-base"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "app_port" {
  type    = number
  default = 80
}

variable "desired_count" {
  type    = number
  default = 1
}

variable "route53_zone_name" {
  type    = string
  default = "bekarys2003.com"
}

variable "route53_record_name" {
  type    = string
  default = "ecs.bekarys2003.com"
}
