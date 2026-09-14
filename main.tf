terraform {
    required_providers {
        ...
    }
}

provider "aws" {
    ...
}

resource "aws_s3_bucket" "YOUR_MAIN_BUCKET_NAME" {
    ...
}

HTTPS BUCKET POLICY
↓
resource "aws_s3_bucket_policy" "..." {
    ...
}

LOGGING BUCKET
↓
resource "aws_s3_bucket" "log_bucket" {
    ...
}

LOGGING BUCKET POLICY
↓
resource "aws_s3_bucket_policy" "log_bucket_policy" {
    ...
}

S3 LOGGING
↓
resource "aws_s3_bucket_logging" "lab_bucket_logging" {
    ...
}
