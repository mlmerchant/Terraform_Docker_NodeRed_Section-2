# NodeRed Docker Container Deployed using Terraform
This was a Terraform project following section 2 of Derek Morgan's "More than Certified in Terraform".

This project depends on the ext_port variable either being defined in terraform.tfvars or passed in as an argument when performing terraform deploy.  Below is an example configuration:

ext_port = {
  dev  = [1980, 1981]
  prod = [1880, 1881]


The number of ports passed in for the selected environment dictates the number of containers that will be started.

To deploy, "terraform deploy" from either a "prod" or "dev" workspace.
