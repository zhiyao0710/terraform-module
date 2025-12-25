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
    use_lockfile   = true
  }

}

provider "aws" {
  region = var.region
  #xiaoming access_key
  #access_key = "AKIARIOSKIPLIKBOGTLJ"
  #secret_key = "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"
}
