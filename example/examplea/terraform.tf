terraform {
  required_providers {
    aws = {
      version = "3.2.0"
      source  = "hashicorp/aws"
    }

    null = {
      version = "2.1"
    }

    template = {
      version = "2.1"
    }
  }
}
