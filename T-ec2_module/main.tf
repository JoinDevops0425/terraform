module "ec2" {
    source = "../ec2-module"
    instance_type = var.instance_type
    sg_ids = var.security_group_ids
    ec2_tags = var.ec2_tags
}


