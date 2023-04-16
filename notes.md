# Terraform Commands Used



#### terraform fmt -diff

This command formats the Terraform configuration files and shows the differences.<br><br>

#### terraform validate

Check the syntax and validity of Terraform configuration files in the current directory.<br><br> 

#### terraform init

Initializes a Terraform working directory, sets up backend and provider plugins.<br><br>

#### terraform plan

Generates an execution plan, showing the changes to be made to your infrastructure.<br><br>

#### terraform plan --output=file1

Same as terraform plan, but the output will be saved to a file named 'file1'<br><br>

#### terraform apply

Applies the proposed changes to the infrastructure.<br><br>

#### terraform apply --auto-approve

Applies the proposed changes to the infrastructure without prompting for<br><br> approval.<br><br>

#### terraform show

Displays the current state of the infrastructure.<br><br>

#### terraform show --json | jq

Displays the current state of the infrastructure in JSON format and pipes the output to 'jq' for pretty printing.<br><br>

#### terraform refresh

Updates the state file with the current state of the infrastructure.<br><br>

#### terraform state list

Lists all the resources in the current state.<br><br>

#### terraform output

Displays the output values from the current state.<br><br>

#### terraform destroy -target [item]

Destroys the specified resource.<br><br>

#### terraform state rm [item]

Removes the specified resource from the state.<br><br>

#### terraform import docker_container.name {ID}

Imports an existing resource into Terraform management.<br><br>

#### terraform console

Opens an interactive console for evaluating expressions.<br><br>

#### terraform apply -var foo=bar

Applies changes with a custom variable 'foo' set to 'bar'.<br><br>

##### export TF_VAR_foo=bar

Sets an environment variable for Terraform.<br><br>

#### unset TF_VAR_foo

Unsets the environment variable for Terraform.<br><br>

#### terraform plan -var-file=aaa.tfvars

Generates an execution plan using the variable values defined in the file 'aaa.tfvars'.<br><br>

#### terraform plan -var ext_port=1880

Generates an execution plan with a custom variable 'ext_port' set to 1880.<br><br>

#####  Note: Variable Precedence based on the CLI is that the variable further left in the CLI wins.<br><br>

#### terraform plan -var="env=dev" | grep name

Generates an execution plan with a custom variable 'env' set to 'dev', and filters the output to show lines containing 'name'.<br><br>

#### terraform workspace new dev

Creates a new workspace called 'dev'.<br><br>

#### terraform workspace show

Displays the current active workspace.<br><br>

#### terraform workspace list

Lists all available workspaces.<br><br>

#### terraform workspace select dev

Selects the 'dev' workspace.<br><br>
