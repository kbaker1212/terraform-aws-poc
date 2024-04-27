# Output the name of the Auto Scaling Group
output "asg_name" {
  value = aws_autoscaling_group.asg.name
}

