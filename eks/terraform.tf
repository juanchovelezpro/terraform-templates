terraform {
  backend "s3" {
    bucket         = "aws-devops-training-test-iac"
    key            = "terraform-states/aws_backend_state"
    region         = "us-east-2"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}