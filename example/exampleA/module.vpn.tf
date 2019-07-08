module "vpn" {
    source="../../"
    aws_key_name    = ""
    whitelist       = ["0.0.0.0/0"]
    public_subnet_id= ""
    vpc_id          = ""
    ami_id          = ""
}