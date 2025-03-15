terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Generate a random string for the S3 bucket name
resource "random_id" "bucket_suffix" {
  byte_length = 8


}

# Create EC2 instance
resource "aws_instance" "mydemo" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  
  tags = {
    Name = "hostname"
  }
}

# Create an S3 bucket with a random name
resource "aws_s3_bucket" "my_random_bucket" {
  bucket = "-uniquemy-bucket-${random_id.bucket_suffix.hex}"
  acl    = "private"

  tags = {
    Name = "My Random S3 Bucket"
  }
}
