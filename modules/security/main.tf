# Security group for public subnets, allowing HTTP traffic
resource "aws_security_group" "public_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80   # HTTP traffic
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow from any source
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security group for private subnets, allowing SSH traffic
resource "aws_security_group" "private_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22  # SSH traffic
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

