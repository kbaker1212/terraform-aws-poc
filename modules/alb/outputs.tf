# Output the ARN for the ALB
output "alb_arn" {
  value = aws_lb.alb.arn
}


# Output the ARN for the target group
output "target_group_arn" {
	value = aws_lb_target_group.asg_target_group.arn
}
