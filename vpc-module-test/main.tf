module "vpc" {
    source = "../terraform-aws-vpc"
    project = var.project
    environment = var.environment
    public_subnet_cidr = var.public_subnet_cidrs
    private_subnet_cidr = var.private_subnet_cidrs
    database_subnet_cidr = var.database_subnet_cidrs

    is_peering_required = true
}
