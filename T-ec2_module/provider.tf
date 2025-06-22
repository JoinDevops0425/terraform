terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.98.0"
        }
    }

    backend "s3" {
        bucket = "04-remote-state-dev"
        key = "module-demo/ec2"
        region = "us-east-1"
        encrypt = true
        use_lockfile = true
    }
}

provider "aws" {
    #configureaton Options, access ID, secret key, region etc. already configured locally for remote have to provide these
}