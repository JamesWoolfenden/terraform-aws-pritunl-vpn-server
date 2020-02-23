provider "aws" {
  version = "~>2.50.0"
  region  = "eu-west-1"
}

provider "null" {
  version = "2.1"
}

provider "template" {
  version = "2.1"
}
