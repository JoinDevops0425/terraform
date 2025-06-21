variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "ami id of the instnace RHEAL9"
}

variable "instance_type" {
     default = "t2.micro"
}

variable "ec2_tags" {
    type = map(string)
    default = {
        Name = "Roboshop from Tag"
        Purpose = "for bettter identifiication"

    }
}

variable "instances" {
    default = ["mongodb", "redis", "mysql", "rabbitmq"]
}

/* variable "instances" {
    default = {
        mongodb = "t2.micro"
        redis = "t2.micro"
        mysql = "t2.micro"
        rabbitmq = "t2.micro"
    }
} */

variable "sg_name" {
    default = "allow-all"
}

variable "sg_description" {
    default = "allowing all ports from internet"
}

variable "from_port" {
    default = 0
}
 
variable "to_port" {
    default = 0
}

variable "cidr_block" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    default = {
        Name = "allow all"
    }
}

variable "env" {
    default = "dev"
}

variable "zone_id" {
    default = "Z0446403K6X4G8UHZOUM"
}

variable "domain_name" {
    default = "persistent.sbs"
}