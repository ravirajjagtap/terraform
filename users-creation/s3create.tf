provider "aws" {
  region = "ap-northeast-1"
}
resource "aws_s3_bucket" "bucket-01" {
  tags = {
    name= "s3-bucket-01"
  }
}