output "security_group_ec2_id" {
  value       = [aws_security_group.ec2_sg.id]
}