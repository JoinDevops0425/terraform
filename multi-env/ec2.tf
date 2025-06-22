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
  instance_type          = var.instance_type
  #vpc_security_group_ids = [aws_security_group.allow_all.id]
    vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = merge(
    var.common_tags,
    {
      Name      = "${var.project}-${var.instances[count.index]}-${var.environment}",
      component = var.instances[count.index],
      Environment = var.environment
    }
  )
}

/* resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description

  ingress {
  
      from_port   = var.from_port
      to_port     = var.to_port
      protocol    = "-1"
      cidr_blocks = var.cidr_block
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
} */

/* resource "aws_route53_record" "route53_records" {
  for_each = aws_instance.roboshop
  zone_id  = var.zone_id
  name     = "${each.key}.${var.domain_name}"
  type     = "A"
  ttl      = 1
  records  = [each.value.private_ip]
} */

/* resource "aws_instance" "roboshop" {
  ami                    = data.aws_ami.joindevops.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = local.sg_id

  tags = merge(
    var.common_tags,
    {
      Name      = var.instances[0],
      component = var.instances[0]
    }
  ) */
#Remote exec
 /*    connection {
        type = "ssh"
        user = "ec2-user"
        password = "DevOps321"
        host = self.public_ip 
    }
    provisioner "remote-exec" {
        inline = [
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
    }

    provisioner "remote-exec" {
        when = destroy
        inline = [
            "sudo systemctl stop nginx"
        ]
    } */
# local exec
  /* provisioner "local-exec" {
    command = " ${self.private_ip} > inventory "
    on_failure = continue
  }
  provisioner "local-exec" {
    when = destroy
    command = " echo 'instance is destroyed' "
    on_failure = continue
  } 
}*/

resource "aws_security_group" "allow_all" {
  name        = "${var.sg_name}-${var.environment}"
  description = var.sg_description

  ingress {

    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "-1"
    cidr_blocks = var.cidr_block
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
      Name = "${var.project}-${var.sg_name}-${var.environment}"
    }
  )

}