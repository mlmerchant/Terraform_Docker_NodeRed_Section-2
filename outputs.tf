# Splat Expression
output "Container_Name" {
  value       = docker_container.nodered_container[*].name
  description = "Name of the docker container."
}

# For Expression + Join
output "IP_Address" {
  value       = [for i in docker_container.nodered_container[*] : join(":", [i.network_data[0].ip_address], [i.ports[0]["external"]])]
  description = "Name of the docker ports."
  # sensitive   = true
}
