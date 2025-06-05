terraform {
  source = "github.com/github-aws-runners/terraform-aws-github-runner"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "vpc" {
  path = find_in_parent_folders("vpc/terragrunt.hcl")
}

dependencies {
  paths = ["../vpc"]
}

include "env" {
  path           = find_in_parent_folders("env.hcl")
  expose         = true
  merge_strategy = "no_merge"
}

inputs = {
  enable_ephemeral_runners = enable_ephemeral_runners

  github_app = {
    key_base64 = include.env.locals.github_app.key_base64
    id         = include.env.locals.github_app.id
  }

  subnet_ids          = [dependencies.vpc.outputs.private_subnets[0].id, dependencies.vpc.outputs.private_subnets[1].id]
  vpc_id              = dependencies.vpc.outputs.vpc_id
  ami_filter          = include.env.locals.runner_ami_filter
  instance_types      = include.env.locals.runner_instance_types
  runner_os           = include.env.locals.runner_os
  runner_architecture = include.env.locals.runner_architecture

  enable_jit_config               = include.env.locals.enable_jit_config
  instance_target_capacity_type   = include.env.locals.instance_target_capacity_type
  minimum_running_time_in_minutes = include.env.locals.minimum_running_time_in_minutes

  tags = include.env.locals.tags
}

skip = include.env.locals.skip_module.runners