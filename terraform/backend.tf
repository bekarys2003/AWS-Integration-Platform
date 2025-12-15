terraform {
  backend "s3" {
    bucket         = "bekarys-ecs-tfstate-ca-central-1"
    key            = "dev/ecs-base.tfstate"
    region         = "ca-central-1"
    dynamodb_table = "bekarys-ecs-terraform-locks"
    encrypt        = true
  }
}
