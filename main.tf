# Define the key pair for SSH access
resource "aws_key_pair" "my_new_key_pair" {
  key_name   = "my-new-key"  # Unique name for the key pair
  public_key = file("~/.ssh/my-new-key.pub")  # Path to your public key
}

# Import the VPC module
module "vpc" {
  source     = "./modules/vpc"  # Path to the VPC module
  cidr_block = "10.1.0.0/16"    # CIDR block for the VPC
}

# Import the security groups module
module "security" {
  source = "./modules/security"  # Path to the security groups module
  vpc_id = module.vpc.vpc_id     # Pass the VPC ID from the VPC module
}

# Import the compute module (EC2 and Auto Scaling Group)
module "compute" {
  source        = "./modules/compute"  # Path to the compute module
  redhat_ami    = "ami-0fe630eb857a6ec83"       # Replace with the Red Hat AMI ID
  sub2_id       = module.vpc.sub2_id   # Public subnet ID for the EC2 instance
  sub3_id       = module.vpc.sub3_id   # Private subnet IDs for ASG
  sub4_id       = module.vpc.sub4_id   # Private subnet IDs for ASG
  public_sg_id  = module.security.public_sg_id  # Security group ID for public instances
  key_name      = aws_key_pair.my_new_key_pair.key_name  # Reference the key pair

}

# Import the Application Load Balancer module
module "alb" {
  source           = "./modules/alb"  # Path to the ALB module
  vpc_id           = module.vpc.vpc_id  # Pass the VPC ID
  sub3_id          = module.vpc.sub3_id  # Private subnet IDs for ALB
  sub4_id          = module.vpc.sub4_id  # Reference to Subnet 4
  target_group_arn = module.compute.asg_name  # Target group for ALB
}

# Import the S3 storage module
module "s3" {
  source      = "./modules/s3"  # Path to the S3 storage module
  bucket_name = "121314kb"  # Set your S3 bucket name
}
