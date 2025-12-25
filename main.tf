# main.tf - Contoh IaC Terraform yang benar (aman)
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-secure-bucket-12345"
}

resource "aws_s3_bucket_versioning" "example_versioning" {
  bucket = aws_s3_bucket.example_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example_encryption" {
  bucket = aws_s3_bucket.example_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_logging" "example_logging" {
  bucket = aws_s3_bucket.example_bucket.id
  target_bucket = aws_s3_bucket.example_bucket.id
  target_prefix = "log/"
}
