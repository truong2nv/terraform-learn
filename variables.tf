variable "aws_region" {
  type        = string
  description = "AWS region to deploy"
}

variable "environment" {
  type        = string
  description = "Environment name (dev/staging/prod)"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}
