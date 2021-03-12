terraform {
  required_providers {
    aws = {
      version = "3.32.0"
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
}
