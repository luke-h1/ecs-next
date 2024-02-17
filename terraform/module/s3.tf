resource "aws_s3_bucket" "ecs-next-tf-state" {
  bucket = "${var.project_name}-tf-state"
  tags = {
    Name = "${var.project_name}-tf-state"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "ecs-next-tf-state" {
  bucket = aws_s3_bucket.ecs-next-tf-state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# encrypt state files
resource "aws_s3_bucket_server_side_encryption_configuration" "ecs-next-tf-state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "ecs-next-tf-state" {
  bucket                  = aws_s3_bucket.ecs-next-tf-state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
