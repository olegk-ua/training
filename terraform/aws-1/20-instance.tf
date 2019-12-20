
resource "aws_instance" "terraform_1" {
  ami                    = "ami-0cc0a36f626a4fdf5" # Ubuntu 18.04
  instance_type          = "t2.micro"
  # count                  = 1
  vpc_security_group_ids = [aws_security_group.tf-instance.id]
  key_name               = "olegk_ssh_keys_1"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  tags = {
    Name = "lab_7"
    env0 = "dev"
    env1 = "qa"
    env2 = "stg"
  }
}

# ------------------------------------------
resource "aws_volume_attachment" "ebs_att_ssd" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.tf_1.id
  instance_id = aws_instance.terraform_1.id
}

resource "aws_volume_attachment" "ebs_att_hdd" {
  device_name = "/dev/sdk"
  volume_id   = aws_ebs_volume.tf_2.id
  instance_id = aws_instance.terraform_1.id
}
# ------------------------------------------

# General Purpose ssd
resource "aws_ebs_volume" "tf_1" {
  availability_zone = "eu-central-1b"
  size              = 8
  type = "gp2"

  tags = {
    Name = "lab_7"
    env0 = "dev"
    env1 = "qa"
    env2 = "stg"
  }
}

# Cold hdd
resource "aws_ebs_volume" "tf_2" {
  availability_zone = "eu-central-1b"
  size              = 500
  type = "sc1"

  tags = {
    Name = "lab_7"
    env0 = "dev"
    env1 = "qa"
    env2 = "stg"
  }
}
