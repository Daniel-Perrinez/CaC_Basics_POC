# Configure the AWS Provider
provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    template = {
      version = "~> 5.73.0"
    }
  }
}