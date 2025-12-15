module "network" {
  source = "./modules/network"

  name                 = local.name
  vpc_cidr             = local.vpc_cidr
  azs                  = local.azs
  public_subnet_cidrs  = local.public_subnet_cidrs
  private_subnet_cidrs = local.private_subnet_cidrs
}

module "alb" {
  source = "./modules/alb"

  name           = local.name
  vpc_id         = module.network.vpc_id
  public_subnets = module.network.public_subnet_ids
  app_port       = var.app_port

  enable_https    = true
  certificate_arn = module.acm.certificate_arn
}


module "ecs" {
  source = "./modules/ecs"

  name             = local.name
  vpc_id           = module.network.vpc_id
  private_subnets  = module.network.private_subnet_ids
  alb_sg_id        = module.alb.alb_sg_id
  target_group_arn = module.alb.target_group_arn

  app_port      = var.app_port
  desired_count = var.desired_count

  # hello-world container (public). You can swap later to your ECR image.
  container_image = "public.ecr.aws/nginx/nginx:latest"
}

module "route53" {
  source = "./modules/route53"

  zone_name    = var.route53_zone_name
  record_name  = var.route53_record_name
  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id
}

module "acm" {
  source = "./modules/acm"

  zone_name   = var.route53_zone_name
  domain_name = var.route53_record_name  # ecs.bekarys2003.com
}
