terraform {
  required_providers {
    aws = {
      version = "3.35.0"
      source  = "hashicorp/aws"
    }

    null = {
      version = "3.0.0"
      source  = "hashicorp/null"
    }

    template = {
      version = "2.2.0"
      source  = "hashicorp/template"
    }
  }
  required_version = ">=0.14.8"
}
