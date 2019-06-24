// -----------------------------------------
// Backend
// -----------------------------------------
terraform {
  backend "s3" {
    bucket = "terraform-backend-xxx"
    region = "ap-northeast-1"
    key    = "pocket-cards/automation.tfstate"
  }

  required_version = ">= 0.12"
}

// -----------------------------------------
// Provider
// -----------------------------------------
provider "aws" {
  shared_credentials_file = "${var.shared_credentials_file}"
  profile                 = "${var.aws_profile}"
  region                  = "${local.region}"
}

// -----------------------------------------
// Project Information
// -----------------------------------------
data "terraform_remote_state" "init" {
  backend = "s3"

  config = {
    bucket = "terraform-backend-xxx"
    region = "ap-northeast-1"
    key    = "pocket-cards/init.tfstate"
  }
}

data "terraform_remote_state" "layers" {
  backend = "s3"

  config = {
    bucket = "terraform-backend-xxx"
    region = "ap-northeast-1"
    key    = "pocket-cards/layers.tfstate"
  }
}