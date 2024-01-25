data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_security_group" "security_group" {
  name_prefix = "${var.name}-${var.environment}"
  description = "The security group assigned to the ${var.name}-${var.environment}"

  vpc_id = var.vpc_id

  # Allow SSH port
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow port 80
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.name
    region      = var.region
    Environment = var.environment
  }
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_pair_name
  public_key = var.key_pair_public_key
}


resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  root_block_device {
    delete_on_termination = true
    volume_size           = var.ebs_valume_size
    volume_type           = "gp3"
  }

  tags = {
    Name        = var.name
    region      = var.region
    Environment = var.environment
  }
}