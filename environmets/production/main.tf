# in environments/production/main.tf

module "swarm" {
  source           = "../../modules/cloud/aws/compute/swarm"
  private_key_path = "${path.module}/private_key.pem"
}

# commented out import blocks so that we don't try to re-import

# import {
#   to = module.swarm.aws_instance.my_swarm
#   id = "i-0040ff555d3c957f9"
# }

# import {
#   to = module.swarm.aws_security_group.swarm_sg
#   id = "sg-0844606df17c97bdd"
# }

# IP=$(aws ec2 describe-instances \
# --filters "Name=tag:Name,Values=docker-swarm-manager" \
#   "Name=instance-state-name,Values=running" \
#   --query "Reservations[0].Instances[0].PublicIpAddress"\
#   --region ca-central-1 --output text)

output "swarm_ssh_command" {
  value = module.swarm.ssh_command
}
