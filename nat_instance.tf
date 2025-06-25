
resource "aws_instance" "nat" {
  ami                    = "ami-057da8106cf3d8af0" # fck-nat-al2023-hvm-1.3.0-20240125-arm64-ebs
  instance_type          = "t4g.micro"
  subnet_id              = aws_subnet.public_subnets[0].id
  source_dest_check      = false
  vpc_security_group_ids = [aws_security_group.public.id]

  tags = { Name = "nat-instance" }
}

resource "aws_eip" "nat" {
  instance = aws_instance.nat.id
  tags     = { Name = "nat-eip" }
}