resource "aws_instance" "this" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.sg_ids
    tags = var.ec2_tags
}

/* resource "aws_security_group" "allow-all" {
    name = ""

    ingress {
        from_port = ""
        to_port = ""
        protocol = ""
        cidr_blocks = []
    }
    egress {
        from_port = ""
        to_port = ""
        protocol = ""
        cidr_blocks = []
    }
 
    tags = {
        Name = ""
    }
}
 */
/* resource "aws_route53_record" "route53" {
   zone_id = ""
    name = ""
    ttl = 
    type = ""
    records = ""
    } */