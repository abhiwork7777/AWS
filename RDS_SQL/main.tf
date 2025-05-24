resource "aws_security_group" "rds_sg" {
  name        = "${var.instance_name}-sg"
  description = "Allow MySQL inbound traffic"
  vpc_id      = aws_vpc.rds_vpc.id

  ingress {
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust for security in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.instance_name}-sg"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "${var.instance_name}-subnet-group"
  subnet_ids = [
    aws_subnet.rds_subnet_1.id,
    aws_subnet.rds_subnet_2.id
  ]

  tags = {
    Name = "${var.instance_name}-subnet-group"
  }
}

resource "aws_db_instance" "default" {
  identifier             = var.instance_name
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = var.db_name
  username               = var.db_user
  password               = var.db_password
  publicly_accessible    = true
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name

  tags = {
    Name = var.instance_name
  }
}
