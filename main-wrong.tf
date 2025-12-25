# main-wrong.tf - Contoh IaC Terraform yang salah (dengan kerentanan)
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example_bucket_wrong" {
  bucket = "my-insecure-bucket-12345"
}

resource "aws_s3_bucket_versioning" "example_versioning_wrong" {
  bucket = aws_s3_bucket.example_bucket_wrong.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Sengaja tidak ada encryption (akan dideteksi sebagai FAILED: CKV_AWS_19)
# Sengaja tidak ada logging (akan dideteksi sebagai FAILED: CKV_AWS_18)
