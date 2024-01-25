data "aws_availability_zones" "us_east_1_azs" {
  state    = "available"
  provider = aws.us-east-1
}

module "vpc_us_east_1" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr_block

  azs             = data.aws_availability_zones.us_east_1_azs.names
  public_subnets  = var.public_subnets_cidr_blocks
  private_subnets = var.private_subnets_cidr_blocks

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = true

  providers = {
    aws = aws.us-east-1
  }

  tags = {
    region      = "us-east-1"
    Environment = "Production"
  }
}

data "aws_availability_zones" "us_east_2_azs" {
  state    = "available"
  provider = aws.us-east-2
}

module "vpc_us_east_2" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr_block

  azs             = data.aws_availability_zones.us_east_2_azs.names
  public_subnets  = var.public_subnets_cidr_blocks
  private_subnets = var.private_subnets_cidr_blocks

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = true

  providers = {
    aws = aws.us-east-2
  }

  tags = {
    region      = "us-east-2"
    Environment = "Production"
  }
}

module "ec2_us-east-1" {
  source              = "./modules/ec2"
  name                = var.ec2_instace_name
  environment         = var.environment
  region              = "us-east-1"
  vpc_id              = module.vpc_us_east_1.vpc_id
  instance_type       = var.ec2_instance_type
  ebs_valume_size     = var.ec2_ebs_valume_size
  key_pair_name       = var.key_pair_name
  key_pair_public_key = var.key_pair_public_key

  providers = {
    aws = aws.us-east-1
  }
}

module "ec2_us-east-2" {
  source              = "./modules/ec2"
  name                = var.ec2_instace_name
  environment         = var.environment
  region              = "us-east-2"
  vpc_id              = module.vpc_us_east_2.vpc_id
  instance_type       = var.ec2_instance_type
  ebs_valume_size     = var.ec2_ebs_valume_size
  key_pair_name       = var.key_pair_name
  key_pair_public_key = var.key_pair_public_key

  providers = {
    aws = aws.us-east-2
  }
}