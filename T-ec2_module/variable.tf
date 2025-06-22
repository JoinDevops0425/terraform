variable "security_group_ids" {
    default = ["sg-0b10269e9bd3fdbd8"]
}

variable "ec2_tags" {
    default = {
        Name = "roboshop-cart"
        Terraform = true
    }
}

variable "instance_type" {
    default = "t2.micro"
}