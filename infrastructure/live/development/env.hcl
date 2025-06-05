locals {
  global_vars = read_terragrunt_config(find_in_parent_folders("globals.hcl"))

  project    = local.global_vars.locals.project
  account_id = local.global_vars.locals.development_account_id
  env        = "development"

  github_app = {
    key_base64     = local.global_vars.locals.github_app.key_base64
    id             = local.global_vars.locals.github_app.id
  }

  skip_module = {
    runners = false
    vpc = false
  }

  #VPC
  vpc_cidr                   = "10.0.0.0/16"
  vpc_nat_gateway            = true
  vpc_single_nat_gateway     = true
  vpc_create_egress_only_igw = true
  vpc_enable_dns_hostnames   = true
  vpc_enable_dns_support     = true
  region                     = "eu-central-1"
  availability_zone          = ["eu-central-1a", "eu-central-1b"]

  #Runners
  enable_ephemeral_runners = true
  runner_instance_types    = ["t3.medium"]
  runner_ami_filter = {
    name   = "runs-on-v2.2-ubuntu22-full-x64-*"
    owners = ["135269210855"]
  }
  runner_os           = "linux"
  runner_architecture = "x64"

  enable_jit_config               = true
  instance_target_capacity_type   = "spot"
  minimum_running_time_in_minutes = 5

  tags = {
    Name        = "${local.env}-${local.project}"
    Environment = "${local.env}"
    Project     = "${local.project}"
    ManagedBy   = "Terragrunt"
  }
}