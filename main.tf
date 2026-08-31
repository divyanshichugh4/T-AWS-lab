terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "lab_bucket" {
  bucket = "t-aws-lab-divyanshi-2026-unique"

  tags = {
    Name        = "T-AWS-Lab-Bucket"
    Environment = "Lab"
  }
}
