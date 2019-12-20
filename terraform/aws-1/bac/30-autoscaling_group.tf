
resource "aws_autoscaling_group" "example-tf" {
  launch_configuration = aws_launch_configuration.example-1.id
  availability_zones   = data.aws_availability_zones.all.names

  min_size = 0
  max_size = 2
  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}
