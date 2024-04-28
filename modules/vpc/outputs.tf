# Output the ID of the VPC
output "vpc_id" {
  value = aws_vpc.main.id
}

# Output the ID of the first public subnet
output "sub1_id" {
  value = aws_subnet.sub1.id
}

# Output the ID of the second public subnet
output "sub2_id" {
  value = aws_subnet.sub2.id
}

# Output the ID of the third subnet
output "sub3_id" {
  value = aws_subnet.sub3.id  # Ensure this points to the correct resource
}

# Output the ID of the fourth subnet (if needed)
output "sub4_id" {
  value = aws_subnet.sub4.id  # If referencing the fourth subnet
}

