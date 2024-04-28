# Variable for the VPC CIDR block
variable "vpc_cidr" {
  type    = string
  default = "10.1.0.0/16"
}

# Variable for the desired AWS region
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

# Variable for the AMI ID for Red Hat Linux
variable "redhat_ami" {
  type = string
}

# Variable for the S3 bucket name
variable "s3_bucket_name" {
  type    = string
  default = "my-terraform-s3-bucket"
}

