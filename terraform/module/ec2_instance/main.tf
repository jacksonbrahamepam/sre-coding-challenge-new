resource "aws_instance" "webserver" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.snet
  security_groups = [var.security_group]

  user_data = <<-EOF
    #!/bin/bash
    echo "*** Installing apache2"
    sudo apt-get update -y
    sudo apt install apache2 -y
    echo "*** Completed Installing apache2"
  EOF

  tags = {
    Name = "web_instance_test"
  }

  volume_tags = {
    Name = "web_instance_test"
  }
}
