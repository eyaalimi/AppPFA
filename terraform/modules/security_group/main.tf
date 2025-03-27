resource "aws_security_group" "sg_project" {
  name = var.security_groups_name

  dynamic "ingress" {
    for_each = var.security_groups_ports
    content {
      protocol    = var.protocol
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      cidr_blocks = var.cidr_blocks
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.security_groups_name
  }

}