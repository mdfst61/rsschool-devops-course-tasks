resource "aws_instance" "private_test" {
  ami                         = "ami-05fcfb9614772f051"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private_subnets[0].id
  vpc_security_group_ids      = [aws_security_group.private.id]
  associate_public_ip_address = false
  key_name                    = aws_key_pair.bastion.key_name

  tags = { Name = "nat-test" }
}