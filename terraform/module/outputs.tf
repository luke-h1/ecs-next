output "module_ecr_repo_name" {
  value       = aws_ecr_repository.application_ecr_repo.name
  description = "The name of the ECR repository"
}

data "terraform_remote_state" "outputs" {
  backend = "s3"
  config = {
    bucket  = "ecs-next-tf-state"
    key     = "live/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}
