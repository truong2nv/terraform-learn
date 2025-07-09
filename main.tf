terraform {
  backend "s3" {
    bucket         = "nvtruong-int"
    key            = "terraform/dev/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-dev" # optional: state locking
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket        = "my-bucket-${var.environment}-nvtruong"
  force_destroy = true

  tags = {
    Environment = var.environment
  }
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0fa377108253bf620"
  instance_type = var.instance_type

  tags = {
    Name        = "test-server-${var.environment}"
    Environment = var.environment
  }
}
