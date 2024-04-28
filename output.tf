# Output the VPC ID for reference
output "vpc_id" {
  value = module.vpc.vpc_id  # Retrieve from the VPC module
}

# Output the Auto Scaling Group (ASG) name
output "asg_name" {
  value = module.compute.asg_name  # Retrieve from the Compute module
}

# Output the Application Load Balancer (ALB) ARN
output "alb_arn" {
  value = module.alb.alb_arn  # Retrieve from the ALB module
}

# Output the S3 bucket name
output "s3_bucket_name" {
  value = module.s3.bucket_name  # Retrieve from the S3 module
}

