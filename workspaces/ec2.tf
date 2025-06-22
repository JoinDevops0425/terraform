resource "aws_instance" "roboshop" {
  count         = length(var.instances)
  ami           = var.ami_id
  instance_type = lookup(var.instance_type, terraform.workspace)
  #vpc_security_group_ids = [aws_security_group.allow_all.id]
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = merge(
    var.common_tags,
    {
      Name        = "${var.project}-${var.instances[count.index]}-${terraform.workspace}",
      component   = var.instances[count.index],
      Environment = terraform.workspace
    }
  )
}

#Using count based loop
resource "aws_route53_record" "route53_records" {
  count   = length(var.instances)
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}-T-${terraform.workspace}.${var.domain_name}"
  type    = "A"
  ttl     = 3
  records = [aws_instance.roboshop[count.index].private_ip]
  allow_overwrite = true
}

resource "aws_security_group" "allow_all" {
  name        = "${var.sg_name}-${terraform.workspace}"
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
      Name = "${var.project}-${var.sg_name}-${terraform.workspace}"
    }
  )

}