terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  cloud {
    organization = "runtimeterror-202"

    workspaces {
      name = "hotel-management"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

module "hm-web" {
  source = "./modules/hm-web"
}

module "hm-vpc" {
  source = "./modules/hm-vpc"
}

module "hm-service" {
  source          = "./modules/hm-service"
  enable_services = false
  vpc_id          = module.hm-vpc.vpc_id
  subnet_id_2a    = module.hm-vpc.subnet_id_2a
  subnet_id_2b    = module.hm-vpc.subnet_id_2b
}

output "bucket-name" {
  value = module.hm-web.hm-web-bucket
  description = "bucket name"
}

output "cf-distribution" {
  value = module.hm-web.hm-cf-distribution
  description = "distribution id"
}
