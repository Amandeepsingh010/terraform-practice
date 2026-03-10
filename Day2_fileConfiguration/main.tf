resource "aws_instance" "name" {
    ami = var.ami_id 
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    tags = {
        Name = "dev-instance"
    }
}

provider "aws" {
  region = "us-east-1"
}