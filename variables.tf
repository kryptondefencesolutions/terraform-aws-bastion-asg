variable "region" {
  type        = string
  description = "The AWS region to deploy into (e.g. us-east-1)"
  default     = "us-east-1"
}

variable "ingress_fromport" {
  default = "22"
}

variable "ingress_toport" {
  default = "22"
}

variable "ingress_protocol" {
  default = "tcp"
}

variable "sg_ingress_fromport" {
  default = "22"
}

variable "sg_ingress_toport" {
  default = "22"
}

variable "sg_ingress_protocol" {
  default = "tcp"
}

variable "allowed_security_groups" {
  type        = list(string)
  default     = []
  description = "A list of Security Group ID's to allow access to."
}

variable "allowed_cidr" {
  type    = list(string)
  default = []
}

variable "allowed_ipv6_cidr" {
  type    = list(string)
  default = []
}

variable "s3_bucket_prefix" {
  type    = string
  default = "bastion"
}

variable "s3_bucket_uri" {
  default = ""
}

# asg
variable "prefix" {
  type        = string
  description = "prefix name of asg and instance prefix"
}

variable "name" {
  type        = string
  description = "Name for tags"
}

variable "environment" {
  type        = string
  description = "Context these resources will be used in, e.g. production"
}

# aws_launch_configuration variables
variable "amis" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "instance_type" {
  type        = string
  description = "Instance type to make the Bastion host from"
}

variable "security_group_ids" {
  description = "Comma seperated list of security groups to apply to the bastion."
  default     = ""
}

variable "user_data_file" {
  default = "./user_data.sh"
}

variable "public_ssh_key" {
  type        = string
  description = "Public half of the SSH key to import into AWS"
}

# aws_autoscaling_group variables

variable "max_size" {
  type        = string
  description = "Maximum number of bastion instances that can be run simultaneously"
}

variable "min_size" {
  type        = string
  description = "Minimum number of bastion instances that can be run simultaneously"
}

variable "cooldown" {
  type        = string
  description = "The amount of time, in seconds, after a scaling activity completes before another scaling activity can start."
}

variable "health_check_grace_period" {
  type        = string
  description = "Time, in seconds, after instance comes into service before checking health."
  default     = "300"
}

variable "desired_capacity" {
  type        = string
  description = "The number of bastion instances that should be running in the group."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnets to create the instances in"
}

variable "enable_monitoring" {
  default = true
}

variable "ssh_user" {
  default = "ubuntu"
}

variable "enable_hourly_cron_updates" {
  default = "false"
}

variable "keys_update_frequency" {
  default = ""
}

variable "additional_user_data_script" {
  default = ""
}

variable "instance_volume_size_gb" {
  description = "The root volume size, in gigabytes"
  default     = "8"
}

variable "root_block_device_delete" {
  default = "true"
}

variable "root_block_device_size" {
  default = "8"
}

variable "root_block_device_type" {
  default = "gp2"
}

variable "associate_public_ip_address" {
  default = "true"
}

