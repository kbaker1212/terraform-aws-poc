# Create an EC2 instance in the second public subnet
resource "aws_instance" "ec2_instance" {
  ami                  = var.redhat_ami
  instance_type        = "t2.micro"
  key_name             = var.key_name
  subnet_id            = var.sub2_id
  vpc_security_group_ids = [var.public_sg_id]

  root_block_device {
    volume_size = 20
  }
}

# Create a launch configuration for the Auto Scaling Group (ASG)
resource "aws_launch_configuration" "asg_lc" {
  name          = "asg-launch-config"
  image_id      = var.redhat_ami
  instance_type = "t2.micro"

  user_data = base64encode(<<EOF
#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd

echo "<html><body><h1>Hello World</h1></body></html>" | sudo tee /var/www/html/index.html
EOF
  )

  root_block_device {
    volume_size = 20
  }
}

# Create the Auto Scaling Group with a minimum and maximum size
resource "aws_autoscaling_group" "asg" {
  vpc_zone_identifier = [var.sub3_id, var.sub4_id]
  min_size            = 2
  max_size            = 6
  desired_capacity    = 2
  launch_configuration = aws_launch_configuration.asg_lc.name
}