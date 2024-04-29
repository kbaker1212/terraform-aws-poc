# terraform-aws-poc

Diagram of folder structure used to create infra 

terraform/
  ├── main.tf        # Main Terraform configuration file
  ├── variables.tf   # Variable definitions for main configuration
  ├── outputs.tf     # Outputs from the main configuration
  ├── backend.tf     #  Terraform backend configuration (S3)
  ├── providers.tf   #  Configure Terraform providers (AWS)
  ├── README.md      # Project overview 
  ├── modules/
  │   ├── vpc/
  │   │   ├── main.tf        # Define VPC, subnets, internet gateway, route tables, etc.
  │   │   ├── variables.tf   # Variables for the VPC module (e.g., CIDR blocks, availability zones)
  │   │   ├── outputs.tf     # Outputs from the VPC module (e.g., VPC ID, subnet IDs)
  │   ├── security/
  │   │   ├── main.tf        # Security groups for public and private subnets
  │   │   ├── variables.tf   # Variables for security groups (e.g., VPC ID)
  │   │   ├── outputs.tf     # Outputs for security groups (e.g., security group IDs)
  │   ├── compute/
  │   │   ├── main.tf        # EC2 instances, Auto Scaling Group, etc.
  │   │   ├── variables.tf   # Variables for compute (e.g., instance types, AMI ID)
  │   │   ├── outputs.tf     # Outputs from compute module (e.g., ASG name)
  │   ├── alb/
  │   │   ├── main.tf        # Application Load Balancer configuration
  │   │   ├── variables.tf   # Variables for ALB (e.g., VPC ID, subnets)
  │   │   ├── outputs.tf     # Outputs for ALB (e.g., ALB ARN, target group ARN)
  │   ├── s3/
  │   │   ├── main.tf        # S3 bucket and lifecycle policies
  │   │   ├── variables.tf   # Variables for S3 (e.g., bucket name)
  │   │   ├── outputs.tf     # Outputs for S3 (e.g., bucket name)
 
