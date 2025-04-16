resource "aws_instance" "ec2_project" {
  ami                         = var.ami
  key_name                    = var.key_name
  instance_type               = var.instance_type
  security_groups             = ["${var.security_groups_name}"]
  associate_public_ip_address = true
  root_block_device {
    volume_size           = 20
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = var.username
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }

    inline = [
      "chmod +x ./scripts/docker.sh", # Rendre le script exécutable
      "sudo ./scripts/docker.sh"      # Exécuter le script
    ]
  }
  provisioner "local-exec" {
    command = "echo Your Public ip Adress: ${self.public_ip} >> ./ip/docker_ip.txt"

  }

  tags = {
    Name = var.instance_name
  }
}
