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

resource "aws_instance" "Demo" {
  ami           = "ami-04b4f1a9cf54c11d0"  
  instance_type = "t2.micro" 
                 
  tags = {
    Name = "project"
  }
}


