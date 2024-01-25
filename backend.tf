terraform {
  backend "s3" {
    bucket = "my-multi-region"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
