provider "aws" {
    region="ap-northeast-1"
}
resource "aws_instance" "my_instance-1"{
    tags={
        Name ="rule-var-inst-1"   
    }
    ami=var.ami
    instance_type="t2.micro"
    key_name="tokyo-key"
    vpc_security_group_ids=var.vpc-sg , aws_security_group.my_sg.id
}
resource "aws_instance" "my_instance-2"{
    tags={
        Name ="rule-var-inst-2"    
    }
    ami=var.ami
    instance_type="t2.micro"
    key_name="tokyo-key"
    vpc_security_group_ids=var.vpc-sg
}

resource "aws_security_group" "my_sg" {
    name="sg_grp"
    description="allow-ssh and http"
    vpc_id="vpc-0d4f640bc61acb3bb"
    ingress{
        protocol="TCP"
        from_port=53
        to_port=53
        cidr_blocks=["0.0.0.0/0"]
    }
    egress{
        protocol="-1"
        from_port=0
        to_port=0
        cidr_blocks=["0.0.0.0/0"]
    }
}


variable "ami"{
    default ="ami-07c589821f2b353aa"
}
variable "vpc-sg"{
    default =["sg-09b565401492535fc"]
}