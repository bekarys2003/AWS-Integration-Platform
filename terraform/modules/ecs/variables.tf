variable "name" { type = string }
variable "vpc_id" { type = string }
variable "private_subnets" { type = list(string) }

variable "alb_sg_id" { type = string }
variable "target_group_arn" { type = string }

variable "app_port" { type = number }
variable "desired_count" { type = number }

variable "container_image" { type = string }
