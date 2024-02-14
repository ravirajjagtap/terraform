provider "aws" {
  region = "ap-northeast-1"
}
resource "aws_iam_user" "ravi-user-1" {
  name = "ravi-user-02"
}