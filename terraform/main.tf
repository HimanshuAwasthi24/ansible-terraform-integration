resource "aws_security_group" "nginx" {
  name   = "nginx_access"
  vpc_id = var.vpc_id_value

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "demo" {
  ami                         = var.ami_value
  instance_type               = var.instance_type_value
  subnet_id                   = var.subnet_id_value
  associate_public_ip_address = true
  security_groups             = [aws_security_group.nginx.id]
  key_name                    = var.key_name_value

  provisioner "remote-exec" {
    inline = [
      "echo 'Waiting for SSH to become available...'"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = aws_instance.demo.public_ip
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.demo.public_ip}, -u ubuntu --private-key=${var.private_key_path} /ansible-terraform-integration/ansible/nginx.yaml"
  }
}
