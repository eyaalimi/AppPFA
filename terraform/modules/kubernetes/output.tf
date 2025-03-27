output "private_key_path" {
  value = var.private_key_path
}
output "instance_public_ip" {
  value = aws_instance.ec2_project.public_ip
}
