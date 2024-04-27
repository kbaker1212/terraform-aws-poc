# Create a Virtual Private Cloud with a CIDR block of 10.1.0.0/16
resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16"
}

# Create public subnets in two different availability zones
resource "aws_subnet" "sub1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.0.0/24"
  availability_zone       = "us-east-1a"  # Availability zone A
  map_public_ip_on_launch = true          # Make this subnet public
}

resource "aws_subnet" "sub2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.1.0/24"
  availability_zone       = "us-east-1b"  # Availability zone B
  map_public_ip_on_launch = true          # Make this subnet public
}

# Create an Internet Gateway and attach it to the VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# Create a route table for public subnets with a default route to the Internet Gateway
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"  # Default route to the internet
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate the public subnets with the public route table
resource "aws_route_table_association" "sub1_assoc" {
  subnet_id     = aws_subnet.sub1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "sub2_assoc" {
  subnet_id     = aws_subnet.sub2.id
  route_table_id = aws_route_table.public_rt.id
}

