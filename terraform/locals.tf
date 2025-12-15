data "aws_availability_zones" "available" {}

locals {
  name = "${var.project}-${var.env}"

  # pick 2 AZs
  azs = slice(data.aws_availability_zones.available.names, 0, 2)

  # simple CIDR plan
  vpc_cidr = "10.20.0.0/16"

  public_subnet_cidrs  = ["10.20.0.0/24", "10.20.1.0/24"]
  private_subnet_cidrs = ["10.20.10.0/24", "10.20.11.0/24"]
}

