provider "aws" {
  region = "ap-northeast-1"
}
resource "aws_s3_bucket" "bucket-01" {
  tags = {
    Name= "s3-bucket-01"
  }
  bucket = "my-bucket-1"
}