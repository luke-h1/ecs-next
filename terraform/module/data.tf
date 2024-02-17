data "terraform_remote_state" "infrastructure" {
  backend = "s3"
  config = {
    bucket  = "ecs-next-tf-state"
    key     = "${var.env}/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}
