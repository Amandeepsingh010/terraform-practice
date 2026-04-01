resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = "t3.micro"

  subnet_id = var.subnet_id

  vpc_security_group_ids = [var.sg_id]

  user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "Hello from ${var.name}" > /var/www/html/index.html
EOF
  tags = {
    Name = var.name
  }
}
