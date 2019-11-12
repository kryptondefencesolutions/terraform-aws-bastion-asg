resource "aws_security_group" "bastion" {
  name        = var.name
  vpc_id      = var.vpc_id
  description = "Bastion security group (only SSH inbound access is allowed)"

  tags = {
    Name = var.name
  }
}

resource "aws_security_group_rule" "ingress" {
  type              = "ingress"
  from_port         = var.ingress_fromport
  to_port           = var.ingress_toport
  protocol          = var.ingress_protocol
  cidr_blocks       = var.allowed_cidr
  ipv6_cidr_blocks  = var.allowed_ipv6_cidr
  security_group_id = aws_security_group.bastion.id
}

resource "aws_security_group_rule" "sg_ingress" {
  count                    = length(var.allowed_security_groups)
  type                     = "ingress"
  from_port                = var.sg_ingress_fromport
  to_port                  = var.sg_ingress_toport
  protocol                 = var.sg_ingress_protocol
  source_security_group_id = element(var.allowed_security_groups, count.index)
  security_group_id        = aws_security_group.bastion.id
}

resource "aws_security_group_rule" "bastion_all_egress" {
  type      = "egress"
  from_port = "0"
  to_port   = "65535"
  protocol  = "all"

  cidr_blocks = [
    "0.0.0.0/0",
  ]

  ipv6_cidr_blocks = [
    "::/0",
  ]

  security_group_id = aws_security_group.bastion.id
}

