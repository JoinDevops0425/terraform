# AWS EC2 instance

you can create EC2 intance in Joindevops uding this module

## Inputs

- ami_id (Optional) - default is DevOps Practice 
- instance_type (Optional) - Valid values are t2.micro, t3.micro, default values are t2.micro
- sg_ids (Required) - list
- ec2_tags (Reqguried) - map

## outputs

- instance_id
- public_ip
- private_ip
