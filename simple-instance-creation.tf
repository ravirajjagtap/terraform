provider "aws"
{
    region="ap-northeast-1"
}
resource "aws_instance" "my_instance"
{
    tags{Name="inst01"}
    ami="ami-0b5c74e235ed808b9"
    instance_type="t2.micro"
    key_name="tokyo-key"
    vpc_security_group_ids=["sg-0c9d82f928d058f7d"]
    
}