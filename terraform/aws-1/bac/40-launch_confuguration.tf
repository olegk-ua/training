
resource "aws_launch_configuration" "example-1" {
  image_id        = "ami-0cc0a36f626a4fdf5"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.tf-instance.id]
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF
  lifecycle {
    create_before_destroy = true
  }
}
