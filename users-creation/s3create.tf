resource "aws_s3_bucket" "example" {
  bucket = "my-tf--bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}