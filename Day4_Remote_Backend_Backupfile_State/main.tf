resource "aws_instance" "ec2" {
  ami = "ami-0f559c3642608c138"
  instance_type = "t3.small"
}