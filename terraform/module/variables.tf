variable "docker_image_tag" {
  type        = string
  description = "The tag of the Docker image to deploy"
}

variable "project_name" {
  type        = string
  description = "The name of the project"
}

variable "env" {
  type        = string
  description = "The environment to deploy to"
}

variable "desired_count" {
  type        = number
  description = "The number of tasks to run"
  default     = 1
}

variable "node_env" {
  type        = string
  description = "The node environment"
  default     = "production"
}
