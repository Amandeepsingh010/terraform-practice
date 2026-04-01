resource "aws_db_instance" "db" {
  identifier = "mydbinstance"
  engine = "mysql"
  instance_class = "db.t3.micro"
  allocated_storage = 20
  
  username = "admin"
  password = "Admin1234"

  db_subnet_group_name = aws_db_subnet_group.rds_subnet.name
  vpc_security_group_ids = [ aws_security_group.rds_sg.id]

  publicly_accessible = false 
  skip_final_snapshot = true

  backup_retention_period = 7

  tags = {
    Name = "Terraform-RDS"
  }
}

#read replica 
resource "aws_db_instance" "replica" {
  identifier = "mydb-replica"
  replicate_source_db = aws_db_instance.db.identifier

  instance_class = "db.t3.micro"
  skip_final_snapshot = true 
}