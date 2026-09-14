terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "lab_bucket" {
  bucket = "t-aws-lab-divyanshi-2026"
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "t-aws-logs-divyanshi-2026"
}

resource "aws_s3_bucket_logging" "lab_bucket_logging" {
  bucket        = aws_s3_bucket.lab_bucket.id
  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_policy" "lab_bucket_policy" {
  bucket = aws_s3_bucket.lab_bucket.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyInsecureTransport",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": [
        "${aws_s3_bucket.lab_bucket.arn}",
        "${aws_s3_bucket.lab_bucket.arn}/*"
      ],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      }
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_policy" "log_bucket_policy" {
  bucket = aws_s3_bucket.log_bucket.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "S3ServerAccessLogsPolicy",
      "Effect": "Allow",
      "Principal": {
        "Service": "logging.s3.amazonaws.com"
      },
      "Action": "s3:PutObject",
      "Resource": "${aws_s3_bucket.log_bucket.arn}/*"
    }
  ]
}
POLICY
}
