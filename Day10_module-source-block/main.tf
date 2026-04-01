module "ec2_instance" {
    source = "../Day10_module-source-block"
    ami_id = "ami-02dfbd4ff395f2a1b"
    instance_type = "t3.micro"
}
provider "aws" {
  region = "us-east-1"
}