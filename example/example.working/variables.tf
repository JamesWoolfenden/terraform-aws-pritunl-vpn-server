variable "common_tags" {
  type = map
}

variable "account_name" {
  type = string
}

variable "cidr" {
  type = string
}

variable "zone" {
  type = list(string)
}

variable "key_name" {
  type = string
}

variable "whitelist" {
  type = list(string)
}


variable "whitelist_http" {
  type = list(string)
}
