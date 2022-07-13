provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "bucket_backend" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "bucket_block_access" {
  bucket                  = aws_s3_bucket.bucket_backend.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket_backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.bucket_backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }

}

resource "aws_dynamodb_table" "backend_lock" {
  name           = var.dynamo_table_name
  write_capacity = 5
  read_capacity  = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}