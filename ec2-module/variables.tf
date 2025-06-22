variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "ami id of the Ec2 instance"
}


variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "Intsnace size"

    validation {
        condition = contains(["t2.micro", "t3.micro"], var.instance_type)
        error_message = "valid values for instance_type are t2.micro, t3.micro" 
    }
}

#mandatory to proovide
variable "sg_ids" {
    type = list
}

variable "ec2_tags" {
    type = map
}
