terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.98.0"
        }
    }

    backend "s3" {
        bucket = "04-remote-state-dev"
        key = "VPC Module test"
        region = "us-east-1"
        encrypt = true
        use_lockfile = true
    }
}

provider "aws" {
}