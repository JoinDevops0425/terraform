resource "aws_instance" "roboshop" {
    for_each = toset(var.instances)
    ami = var.ami_id
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_all.id]

    tags = {
        Name = each.key
    }
}

resource "aws_security_group" "allow_all" {
    name = var.sg_name
    description = var.sg_description

    ingress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = "-1"
        cidr_blocks = var.cidr_block
    }

    egress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = "-1"
        cidr_blocks = var.cidr_block
    }

    tags = var.sg_tags

}

 #Using count based loop
/* resource "aws_route53_record" "route53_records" {
    count = 4
    zone_id = var.zone_id
    name = "${var.instances[count.index]}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = [aws_instance.roboshop[count.index].private_ip]
} */

resource "aws_route53_record" "route53_records" {
    for_each = aws_instance.roboshop
    zone_id = var.zone_id
    name = "${each.key}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = [each.value.private_ip]
}