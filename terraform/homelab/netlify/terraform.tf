terraform {
  required_version = "1.7.1"
  required_providers {
    netlify = {
      source  = "netlify/netlify"
      version = "0.1.1"
    }
  }
    backend "s3" {
    profile        = "personnel-aws"
    bucket         = "mehdij4-tinyhomelab-terraform-statefile"
    key            = "homelab/netlify/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks"
  }
}
