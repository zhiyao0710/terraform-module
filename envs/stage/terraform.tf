terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.26.0"
    }
  }
  backend "s3" {
    bucket         = "my-test-bucket-jd-01"
    key            = "stage/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }

}

provider "aws" {
  region = var.region
}
