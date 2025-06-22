data "aws_ami" "joindevops" {
  /*  owners = ["043443519397"]
    name_regex       = "^myami-[0-9]{3}" */
  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
}

output "ami_id" {
  value = data.aws_ami.joindevops.id
}