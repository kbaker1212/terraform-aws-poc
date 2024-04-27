# Output the ID of the public security group
output "public_sg_id" {
  value = aws_security_group.public_sg.id
}

# Output the ID of the private security group
output "private_sg_id" {
  value = aws_security_group.private_sg.id
}

