provider "aws" {
    region     = "us-west-2"
    access_key = "AKIAV4RXYT3ZHMZZINNA"
    secret_key = "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"
}

variable "instance_type" {
    type = map
    default = {
        default = "t2.micro"
        dev = "t2.nano"
        prod = "t2.small"

    }
  
}

resource "aws_instance" "my_ec2" {
    ami =   "ami-0d6621c01e8c2de2c"
    instance_type = lookup(var.instance_type, terraform.workspace)

    tags = {
        Name = "web_serer_1"
    }
}

