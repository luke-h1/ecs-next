provider "aws" {
  region = "eu-west-2"
}

module "app_infra" {
  source           = "../module"
  project_name     = "ecs-next-tf"
  node_env         = "production"
  env              = "live"
  desired_count    = 2
  docker_image_tag = var.docker_image_tag
}
