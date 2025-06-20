output "bastion_private_key" {
  value     = tls_private_key.bastion.private_key_pem
  sensitive = true
}

output "bastion_public_key" {
  value = tls_private_key.bastion.public_key_openssh
}

output "bastion_public_ip" {
  value       = aws_instance.bastion.public_ip
  description = "Public IPv4 address of the bastion."
}
