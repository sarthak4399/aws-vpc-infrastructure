# modules/rds/main.tf


resource "aws_db_subnet_group" "mydb_subnet_group" {
  name       = "mydb_subnet_group"
  subnet_ids = var.private_subnet_ids  # Use the private subnet IDs from the root module

  tags = {
    Name = "My RDS DB Subnet Group"
  }
}

resource "aws_db_instance" "main" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  db_name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.mydb_subnet_group.name
}