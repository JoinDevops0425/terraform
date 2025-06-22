variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "ami id of the instnace RHEAL9"
}


variable "common_tags" {
  default = {
    Project   = "robsoshop"
    Terraform = "true"
  }
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Component = "cart"
    Name      = "cart"
  }
}

variable "instances" {
  default = ["mongodb", "redis"]
}

variable "instance_type" {

}

/* variable "instances" {
    default = {
        mongodb = "t2.micro"
        redis = "t2.micro"
        mysql = "t2.micro"
        rabbitmq = "t2.micro"
    }
} */



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
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_name" {
  default = "allow-all"
}

variable "sg_tags" {
  default = {
    Name = "allow all"
  }
}


variable "zone_id" {
  default = "Z0446403K6X4G8UHZOUM"
}

variable "domain_name" {
  default = "persistent.sbs"
}

variable "ingress_ports" {
  default = [
    {
      from_port = 22
      to_port   = 22
    },
    {
      from_port = 80
      to_port   = 80
    },
    {
      from_port = 443
      to_port   = 443
    }
  ]
}

variable "project" {
  default = "roboshop"
}

variable "environment" {
  
}

variable "component" {
  default = "cart"
}


