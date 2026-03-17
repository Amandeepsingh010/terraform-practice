resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.name.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.name.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-south-1b"
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.name.id 
  cidr_block = var.public_subnet_cidr
  availability_zone = "ap-south-1a"
}

resource "aws_db_subnet_group" "rds_subnet" {
  name = "rds-subnet-group"

  subnet_ids = [ aws_subnet.private_1.id, aws_subnet.private_2.id ]

  tags = {
    Name = "RDS Subnet Group"
  }
}