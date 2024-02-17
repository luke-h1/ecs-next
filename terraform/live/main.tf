provider "aws" {
  region = "eu-west-2"
}

module "app_infra" {
  source           = "../module"
  project_name     = "ecs-next"
  node_env         = "production"
  env              = "live"
  desired_count    = 1
  docker_image_tag = var.docker_image_tag
  domain           = "lhowsam.site"
}
terraform {
  backend "s3" {
    bucket  = "ecs-next-tf-state"
    key     = "${var.env}/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
