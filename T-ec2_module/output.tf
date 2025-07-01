output "public_ip" {
    value = module.ec2.public_ip
}

output "private_ip" {
    value = module.ec2.private_ip
}

#if the information is not exposed by Module developer, you cannot access the data, hence, no output for the module.ec2
output "module_info" {
    value = module.ec2
}