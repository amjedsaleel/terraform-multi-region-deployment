variable "profile" {
  type        = string
  default     = "personal"
  description = "Configuration profile name for the AWS CLI."
}

variable "environment" {
  type        = string
  default     = "Production"
  description = "The name of the environment to be deployed"
}


## VPC variables
variable "vpc_name" {
  type        = string
  default     = "myvpc"
  description = "VPC name"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr block"
}

variable "public_subnets_cidr_blocks" {
  type        = list(any)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "public subnet cidr blocks"
}

variable "private_subnets_cidr_blocks" {
  type        = list(any)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
  description = "private subnet cidr blocks"
}


## EC2 Instace
variable "ec2_instace_name" {
  type        = string
  default     = "my-ec2"
  description = "EC2 instace name"
}

variable "ec2_instance_type" {
  type        = string
  default     = "t2.small"
  description = "Required ec2 instace type"
}


variable "ec2_ebs_valume_size" {
  type        = number
  default     = 30
  description = "Required EBS volume size"
}

variable "key_pair_name" {
  type        = string
  default     = "my-ec2"
  description = "AWS key pair name"
}

variable "key_pair_public_key" {
  type        = string
  description = "aws key pair public key"
}
