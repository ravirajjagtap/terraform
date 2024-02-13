provider "aws" 
{
    region="ap-northeast-1"
}
resource "aws_instance" "my_instance-1"
{
    tags={
        Name ="rule-var-inst-1"    }
    ami="ami-07c589821f2b353aa"
    instance_type="t2.micro"
    key_name="tokyo-key"
    vpc_security_group_ids=["sg-09b565401492535fc"]
}
resource "aws_instance" "my_instance-2"
{
    tags={
        Name ="rule-var-inst-2"    }
    ami="ami-07c589821f2b353aa"
    instance_type="t2.micro"
    key_name="tokyo-key"
    vpc_security_group_ids=["sg-09b565401492535fc"]
}