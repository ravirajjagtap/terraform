provider "aws"{
    region="ap-northeast-1"
}
resource "aws_instance" "my_instance" {
    tags ={
        Name="inst01"
        }
    ami="ami-0204c9bcdc2f0250d"
    instance_type="t2.micro"
    key_name="tokyo-key"
    vpc_security_group_ids=["sg-0c9d82f928d058f7d"]   
}
