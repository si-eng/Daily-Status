resource "aws_eip" "eip" {
  instance = aws_instance.test-terraform.id
  vpc      = true
}