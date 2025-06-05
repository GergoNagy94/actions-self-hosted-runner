### GitHub Actions Self Hosted Runner
#### Demo project by Gergo Nagy for Code Factory

#### Description:
- The goal of the practice is to create a Self Hosted Runner setup for GitHub Actions on AWS.
- The infrastructure is built on a separated VPC of an AWS account, the runners are placed on private subnets.
- Terragrunt is used with OpenTofu to build the infrastructure.

#### Modules:
- VPC:      tfr:///terraform-aws-modules/vpc/aws//.?version=5.14.0
- Runners:  github.com/github-aws-runners/terraform-aws-github-runner

##### source:
- https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/about-self-hosted-runners
- https://github-aws-runners.github.io/terraform-aws-github-runner/
- https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

#### GitHub App:
- name: https://github.com/apps/gergo-practice-app-for-runners
- org: gergo-practice-organization