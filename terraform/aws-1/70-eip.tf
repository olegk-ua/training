
# https://www.terraform.io/docs/providers/aws/r/eip.html
resource "aws_eip" "eip_1" {
  instance = aws_instance.terraform_1.id
  vpc      = true
  tags = {
    Name = "lab_7"
  }
}
