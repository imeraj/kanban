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

output "swarm_ssh_command" {
  value = module.swarm.ssh_command
}
