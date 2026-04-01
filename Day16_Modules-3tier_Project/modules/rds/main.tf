resource "aws_db_instance" "db" {
  allocated_storage = 20
  engine = "mysql"
  instance_class = "db.t3.micro"
  username = "admin"
  password = "admin12345"
  db_name = "mydb"
  skip_final_snapshot = true
  publicly_accessible = true 
  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "main-db-subnet"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "DB subnet group"
  }
}