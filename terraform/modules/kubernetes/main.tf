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

  # Utilisation du provisioner file pour envoyer le script
  provisioner "file" {
    source      = "C:/Users/Lenovo/ic-webapp/terraform/scripts/kubernetes.sh" # Local path
    destination = "/tmp/kubernetes.sh"                                        # Remote path (where the script will be stored on the instance)

    connection {
      type        = "ssh"
      user        = var.username
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  # Provisioner remote-exec pour rendre exécutable et exécuter le script
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = var.username
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }

    inline = [
      "chmod +x /tmp/kubernetes.sh", # Rendre le script exécutable
      "sudo /tmp/kubernetes.sh"      # Exécuter le script
    ]
  }
  provisioner "local-exec" {
    command = " echo your   public ip adresse : ${self.public_ip} >> ./ip/kubernetes_ip.txt"
  }

  tags = {
    Name = var.instance_name
  }
}
