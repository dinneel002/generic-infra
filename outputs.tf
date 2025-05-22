output "instance_public_ip" {
  value = aws_instance.webApi.public_ip
}