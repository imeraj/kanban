# in environments/production/main.tf

module "swarm" {
  source = "../../modules/cloud/aws/compute/swarm"
}

import {
  to = module.swarm.aws_instance.my_swarm
  id = "i-0040ff555d3c957f9"
}

# import {
#   to = module.swarm.aws_security_group.swarm_sg
#   id = "sg-0844606df17c97bdd"
# }
