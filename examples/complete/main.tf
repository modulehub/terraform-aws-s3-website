terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.48.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 1.2"
    }
  }
}

provider "aws" {
  region = var.region
}

module "s3_website" {
  source             = "../../"
  hostname           = var.hostname
  parent_zone_name   = var.parent_zone_name
  force_destroy      = var.force_destroy
  encryption_enabled = var.encryption_enabled

  context = module.this.context
}
