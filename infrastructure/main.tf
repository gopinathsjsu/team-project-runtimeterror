terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
			version = "~> 3.27"
        }
    }

    backend "remote" {
        hostname = "app.terraform.io"
        organization = "runtimeterror-202"

        workspaces {
            name = "hotel-management"
        }
    }

    required_version = ">= 0.14.9"
}

provider "aws" {
    profile = "default"
    region = "us-west-2"
}
