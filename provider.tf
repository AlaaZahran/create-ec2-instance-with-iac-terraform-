resource "aws_instance" "my-ec2"{
    ami="ami-065793e81b1869261"
    instance_type="t2.micro"
    security_groups =[aws_security_group.allow_ssh.name]
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
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow Shh inbound traffic"
#   vpc_id      = aws_vpc.main.id

  ingress {
    description      = "Shh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}