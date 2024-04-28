# Variable for the Red Hat Linux AMI
variable "redhat_ami" {
  type = string
}

# Variable for the ID of the second public subnet
variable "sub2_id" {
  type = string
}

# Variable for the private subnets for the Auto Scaling Group
variable "sub3_id" {
  type = string
}

variable "sub4_id" {
  type = string
}
variable "public_sg_id" {
  type = string
}
variable "key_name" {
  type = string
}

