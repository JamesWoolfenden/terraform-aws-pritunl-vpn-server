account_name = "development"
cidr         = "10.0.0.0/21"
zone         = ["A", "B", "C"]
key_name     = "vpn"

whitelist = [
"8.8.8.8/32"]

whitelist_http = [
"8.8.8.8/32"]

common_tags = {
  role        = "vpn"
  AccountType = "Management"
  Application = "base"
  Environment = "Management"
}
