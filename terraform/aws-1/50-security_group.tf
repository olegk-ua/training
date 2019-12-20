
resource "aws_security_group" "tf-instance" {
  name = "tf-example-instance"
  description = "Permit ssh and http from my IP"
  ingress {
    description = "http from my ip"
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "ssh from my ip"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "lab_7"
  }
}
