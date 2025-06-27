data "cloudinit_config" "cp_userdata" {
  gzip          = false
  base64_encode = true

  part {
    filename     = "control-plane.yaml"
    content_type = "text/cloud-config"
    content = templatefile(
      "./_CLOUD_INIT/control-plane.yaml",
      {
        hostname  = "control-plane"
        k3s_token = random_password.k3s_token.result
      }
    )
  }
}

data "cloudinit_config" "worker_userdata" {
  gzip          = false
  base64_encode = true

  part {
    filename     = "worker.yaml"
    content_type = "text/cloud-config"
    content = templatefile(
      "./_CLOUD_INIT/worker.yaml",
      {
        hostname  = "worker-node"
        k3s_token = random_password.k3s_token.result
        server_ip = aws_instance.control_plane.private_ip
      }
    )
  }
}


resource "aws_instance" "control_plane" {
  ami                         = "ami-05fcfb9614772f051"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private_subnets[0].id
  vpc_security_group_ids      = [aws_security_group.private.id]
  associate_public_ip_address = false
  key_name                    = aws_key_pair.bastion.key_name
  user_data_base64            = data.cloudinit_config.cp_userdata.rendered

  tags = { Name = "control-plane" }
}

resource "aws_instance" "worker_node" {
  ami                         = "ami-05fcfb9614772f051"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private_subnets[1].id
  vpc_security_group_ids      = [aws_security_group.private.id]
  associate_public_ip_address = false
  key_name                    = aws_key_pair.bastion.key_name
  depends_on                  = [aws_instance.control_plane]
  user_data_base64            = data.cloudinit_config.worker_userdata.rendered

  tags = { Name = "worker-node" }
}