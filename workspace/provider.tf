terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0" # It is best practice to pin your provider version
    }
  }
  backend "s3" {
    bucket       = "terraform-workspace-aws-cloudkarna"
    key          = "remote-state-terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true # otherwise if u r creating infra someone tried makes the changes during that time state file will corrupt
  }
}

# Configure the AWS provider with a specific region
provider "aws" {
  region = "us-east-1"
}
