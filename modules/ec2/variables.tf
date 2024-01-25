variable "name" {
  type        = string
  description = "EC2 instace name"
}

variable environment {
  type        = string
  description = "The name of the environment to be deployed"
}

variable region {
  type        = string
}

variable vpc_id {
  type        = string
}

variable "instance_type" {
  type        = string
  description = "Required ec2 instace type"
}


variable "ebs_valume_size" {
  type        = string
  description = "Required EBS volume size"
}

variable "key_pair_name" {
  type        = string
  description = "AWS key pair name"
}

variable "key_pair_public_key" {
  type        = string
  description = "aws key pair public key"
}
