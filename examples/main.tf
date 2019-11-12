module "bastion" {
  source  = "anub1s187/bastion-asg/aws"
  version = "0.12.6"
  # insert the 12 required variables here

  prefix         = "bastion"
  name           = "Bastion-${module.shared_vars.environment}"
  amis           = data.aws_ami.ubuntu.id
  environment    = module.shared_vars.environment
  public_ssh_key = var.public_ssh_key
  min_size       = "1"
  max_size       = "2"
  subnet_ids     = module.vpc.public_subnets //to be used in conjunction with vpc module or specify as variable

  desired_capacity      = "1"
  cooldown              = "300"
  instance_type         = "t2.micro"
  region                = var.region
  vpc_id                = module.vpc.vpc_id
  allowed_cidr          = ["0.0.0.0/0"]
  keys_update_frequency = "5 * * * *"

  # eip = "${aws_eip.bastion.public_ip}"
  additional_user_data_script = <<EOF
REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F\" '{print $4}')
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
aws ec2 associate-address --region $REGION --instance-id $INSTANCE_ID --allocation-id ${module.bastion.eip_allocation_id}
EOF

}
output "eip_public_ip" {
  value = module.bastion.eip_public_ip
}
output "bastion_sg" {
  value = module.bastion.security_group_id
}
output "bastion_bucket" {
  value = module.bastion.s3_bucket_name
}