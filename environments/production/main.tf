# in environments/production/main.tf

module "swarm" {
  source                = "../../modules/cloud/aws/compute/swarm"
  private_key_path      = "${path.module}/private_key.pem"
  account_id            = var.account_id
  age_key_path          = "${path.module}/key.txt"
  purge_file            = "../../tasks/purge.yaml"
  compose_file          = "../../compose.yaml"
  aws_access_key_id     = var.aws_access_key_id
  aws_secret_access_key = var.aws_secret_access_key
  gh_pat                = var.gh_pat
  gh_owner              = "imeraj"
  image_to_deploy       = "ghcr.io/imeraj/kanban:latest"
}

module "repository_secrets" {
  source = "../../modules/integrations/github/secrets"
  secrets = {
    "PRIVATE_KEY"           = module.swarm.private_key,
    "AWS_ACCESS_KEY_ID"     = var.aws_access_key_id,
    "AWS_SECRET_ACCESS_KEY" = var.aws_secret_access_key,
    "AGE_KEY"               = var.age_key,
    "GH_PAT"                = var.gh_pat
  }
  repository   = "kanban"
  github_owner = "imeraj"
}

# module "contributing_workflow" {
#   source       = "../../modules/integrations/github/contributing_workflow"
#   repository   = "kanban"
#   github_owner = "imeraj"
#   status_checks = [
#     "Compile with mix test, format, dialyzer & unused deps check"
#   ]
# }

# commented out import blocks so that we don't try to re-import

# import {
#   to = module.swarm.aws_instance.swarm_node
#   id = "i-0040ff555d3c957f9"
# }

# import {
#   to = module.swarm.aws_security_group.swarm_sg
#   id = "sg-0844606df17c97bdd"
# }

# import {
#   to = module.swarm.aws_ssm_parameter.swarm_token
#   id = "/docker/swarm_manager_token"
# }

# IP=$(aws ec2 describe-instances \
# --filters "Name=tag:Name,Values=docker-swarm-manager" \
#   "Name=instance-state-name,Values=running" \
#   --query "Reservations[0].Instances[0].PublicIpAddress"\
#   --region ca-central-1 --output text)

output "swarm_ssh_commands" {
  value = module.swarm.ssh_commands
}

output "load_balancer_dns" {
  value = module.swarm.load_balancer_dns
}
