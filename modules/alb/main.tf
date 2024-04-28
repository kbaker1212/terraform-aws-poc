# Create the Application Load Balancer (ALB) in the private subnets
resource "aws_lb" "alb" {
  name               = "alb"
  load_balancer_type = "application"  # ALB type
  subnets            = [var.sub3_id, var.sub4_id]  # Use private subnets
}

# Create an HTTP listener for the ALB
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn  # Link to the ALB
  port              = 80              # HTTP port
  protocol          = "HTTP"          # HTTP protocol

  default_action {
    type             = "forward"  # Forward to target group
    target_group_arn = var.target_group_arn
  }
}

# Create a target group for the Auto Scaling Group (ASG)
resource "aws_lb_target_group" "asg_target_group" {
  name        = "asg-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"  # Forward to instances
}

