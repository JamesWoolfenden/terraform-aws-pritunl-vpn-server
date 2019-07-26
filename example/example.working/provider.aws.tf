provider "aws" {
  region  = "eu-west-2"
  version = "2.20.0"
}

provider "null" {
  version = "2.1"
}

provider "template" {
  version = "2.1"
}

provider "local" {
  version = "1.3"
}

provider "tls" {
  version = "2.0"
}

provider "http" {
  version = "1.1"
}
