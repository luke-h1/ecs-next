terraform {
  backend "s3" {
    bucket = "ecs-next-tf-state"
    key    = "live/terraform.tfstate"
    region = "eu-west-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
