
output "public_dns" {
  value       = aws_instance.terraform_1.public_dns
  # value       = aws_instance.terraform_1.*.public_dns
  description = "The public IP of the web server"
}

output "elastic_ip" {
  value = aws_eip.eip_1
  description = "Public IP - elastic"
}
