output "ec2_public_ip" {
  value = aws_instance.main_ec2.public_ip
}

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_id" {
  value = aws_subnet.main_subnet.id
}
