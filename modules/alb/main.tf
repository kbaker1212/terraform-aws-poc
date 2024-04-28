# Define the target group for the Auto Scaling Group (ASG)
resource "aws_lb_target_group" "asg_target_group" {
  name        = "asg-target-group"
  port        = 80  # HTTP traffic port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
}

# Define the Application Load Balancer (ALB) in private subnets
resource "aws_lb" "alb" {
  name               = "alb"
  load_balancer_type = "application"
  subnets            = [var.sub3_id, var.sub4_id]
}

# Define the ALB Listener, referencing the target group
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80  # HTTP traffic
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg_target_group.arn  # Reference to target group
  }
}

