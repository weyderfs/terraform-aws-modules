resource "aws_efs_file_system" "this" {
  encrypted = true

  tags = var.tags
}
