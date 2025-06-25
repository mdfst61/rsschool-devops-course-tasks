resource "aws_instance" "bastion" {
  ami                         = "ami-05fcfb9614772f051"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnets[0].id
  vpc_security_group_ids      = [aws_security_group.public.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.bastion.key_name

  tags = { Name = "bastion-host" }
}