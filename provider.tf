terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Providers
provider "aws" {
  region  = "us-east-1"
  alias   = "us-east-1"
  profile = var.profile
}

provider "aws" {
  region  = "us-east-2"
  alias   = "us-east-2"
  profile = var.profile
}
