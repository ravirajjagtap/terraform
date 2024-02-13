provider "aws" {
    region="ap-northeast-1"
}
resource "aws_instance" "ins-01-var"{
    tags={
        Name = "my-inst-var-1"
    }
    ami=var.image_id
    instance_type="t2.micro"
    key_name="tokyo-key"
    vpc_security_group_ids=["sg-09b565401492535fc"]
}
resource "aws_instance" "ins-02-var"{
    tags={
        Name = "my-inst-var-2"
    }
    ami=var.image_id
    instance_type="t2.micro"
    key_name="tokyo-key"
    vpc_security_group_ids=["sg-09b565401492535fc"]
}
resource "aws_instance" "ins-03-var"{
    tags={
        Name = "my-inst-var-3"
    }
    ami=var.image_id
    instance_type="t2.micro"
    key_name="tokyo-key"
    vpc_security_group_ids=["sg-09b565401492535fc"]
}
resource "aws_instance" "ins-04-var"{
    tags={
        Name = "my-inst-var-4"
    }
    ami=var.image_id
    instance_type="t2.micro"
    key_name="tokyo-key"
    vpc_security_group_ids=["sg-09b565401492535fc"]
}
variable "image_id"{
    default="ami-07c589821f2b353aa"
}