/* resource "aws_instance" "roboshop" {
  for_each               = toset(var.instances)
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = merge(
    var.common_tags, 
    {
        Name = var.instances[count.index],
        component = var.instances[count.index]
    }
    )
  }
 */

resource "aws_instance" "roboshop" {
  count                  = length(var.instances)
  ami                    = data.aws_ami.joindevops.id
  instance_type          = "t2.micro"
  #vpc_security_group_ids = [aws_security_group.allow_all.id]
    vpc_security_group_ids = local.sg_id

  tags = merge(
    var.common_tags,
    {
      Name      = var.instances[count.index],
      component = var.instances[count.index]
    }
  )
}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = "-1"
      cidr_blocks = var.cidr_block
    }
  }

  egress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "-1"
    cidr_blocks = var.cidr_block
  }

  tags = merge(
    var.common_tags,
    {
      Name = var.sg_name
    }
  )

}

#Using count based loop
resource "aws_route53_record" "route53_records" {
    count = length(var.instances)
    zone_id = var.zone_id
    name = "${var.instances[count.index]}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = [aws_instance.roboshop[count.index].private_ip]
}

/* resource "aws_route53_record" "route53_records" {
  for_each = aws_instance.roboshop
  zone_id  = var.zone_id
  name     = "${each.key}.${var.domain_name}"
  type     = "A"
  ttl      = 1
  records  = [each.value.private_ip]
} */