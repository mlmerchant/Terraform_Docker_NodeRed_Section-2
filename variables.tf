variable "image" {
  type        = map(any)
  description = "Image for the container"
  default = {
    dev  = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
  }
}

variable "int_port" {
  type    = number
  default = 1880
  validation {
    condition     = var.int_port == 1880
    error_message = "Internal port must equal 1880."
  }
}

# defined in terraform.tfvars
variable "ext_port" {
  type = map(any)
  # sensitive = true
  validation {
    condition = (
      max(var.ext_port["dev"]...) <= 65535 &&
      min(var.ext_port["dev"]...) >= 1980 &&
      max(var.ext_port["prod"]...) <= 1900 &&
      min(var.ext_port["prod"]...) >= 1880
    )

    error_message = "External port must be in valid port range of 1880-1889 for Prod and 1990 - 65535 for Dev."
  }
}

locals {
  container_count = length(var.ext_port[terraform.workspace])
}
