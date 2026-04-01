module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "rds-instance"

  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  db_name  = "dbname"
  username = "user"
  port     = "3306"

  # DB parameter group
  family = "mysql8.0"

  # DB option group
  major_engine_version = "8.0"

  # Database Deletion Protection
  deletion_protection = false

}