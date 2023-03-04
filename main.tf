resource "aws_instance" "my-ec2"{
    ami="ami-065793e81b1869261"
    instance_type="t2.micro"
     tags = {
    Name = "HelloWorld"
  }
}
resource  "aws_eip" "my-eip"{
    vpc = true
}
resource "aws_eip_association" "associate"{
    instance_id=aws_instance.my-ec2.id
    allocation_id=aws_eip.my-eip.id

}
output "eip_value" {
    description = "VMs Public IP"
    value= aws_instance.my-ec2.public_ip

}
output "private_value" {
    description = "VMs private IP"
    value= aws_instance.my-ec2.private_ip

}
output "ec2_name" {
    description = "VMs Name"
    value= aws_instance.my-ec2.tags.Name

}

output "ec2_id" {
    description = "VMs Name"
    value= aws_instance.my-ec2.id

}






