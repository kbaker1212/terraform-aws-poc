# Create an EC2 instance in the second public subnet
resource "aws_instance" "ec2_instance" {
  ami           = var.redhat_ami  # AMI for Red Hat Linux
  instance_type = "t2.micro"      # Instance type
  key_name      = var.key_name  # Key name passed from the module
  subnet_id     = var.sub2_id     # Public subnet
  security_groups = [var.public_sg_id]  # Use the public security group

  root_block_device {
    volume_size = 20  # 20 GB storage
  }
}

# Create a launch configuration for the Auto Scaling Group (ASG)
resource "aws_launch_configuration" "asg_lc" {
  name          = "asg-launch-config"
  image_id      = var.redhat_ami  # Red Hat Linux AMI
  instance_type = "t2.micro"      # Instance type

  user_data = <<EOF
    #!/bin/bash
    sudo yum install -y httpd  # Install Apache
    sudo systemctl start httpd
    sudo systemctl enable httpd
  EOF

  root_block_device {
    volume_size = 20  # 20 GB storage
  }
}

# Create the Auto Scaling Group with a minimum and maximum size
resource "aws_autoscaling_group" "asg" {
  vpc_zone_identifier = [var.sub3_id, var.sub4_id]  # Private subnets
  min_size            = 2  # Minimum 2 instances
  max_size            = 6  # Maximum 6 instances
  desired_capacity    = 2  # Desired starting capacity
  launch_configuration = aws_launch_configuration.asg_lc.name
}

