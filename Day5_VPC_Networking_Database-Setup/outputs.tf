output "vpc_id" {
  value = aws_vpc.name.id 
}

output "public_subnet_id" {
    value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = [aws_subnet.private_1.id , aws_subnet.private_2.id] 
}

output "ec2_public_ip" {
  value = aws_instance.ec2.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.db.endpoint
}