#ec2 security group 
resource "aws_security_group" "ec2_sg" {
  name = "ec2-sg"
  description = "secruity group for ec2"
  vpc_id = aws_vpc.name.id 
  
  ingress {
    description = "Allow ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "allow all outbound rule"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#rds SG
resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  vpc_id = aws_vpc.name.id 

  ingress{
    description = "Mysql from ec2"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }


    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}
