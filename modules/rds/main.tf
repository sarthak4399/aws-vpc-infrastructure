# modules/rds/main.tf
resource "aws_db_instance" "main" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  db_name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name = var.db_subnet_group

  tags = {
    Name = "MyRDSInstance"
  }
}
