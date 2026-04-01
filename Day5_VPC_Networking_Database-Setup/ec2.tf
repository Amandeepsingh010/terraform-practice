resource "aws_instance" "ec2" {
  ami = "ami-0f559c3642608c138"
  instance_type = "t3.micro"

  subnet_id = aws_subnet.public.id 

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "Terraform-web-server"
  }
}