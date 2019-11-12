resource "aws_eip" "bastion" {
  vpc = true
}

output "eip_allocation_id" {
  value = aws_eip.bastion.id
}

output "eip_public_ip" {
  value = aws_eip.bastion.public_ip
}

