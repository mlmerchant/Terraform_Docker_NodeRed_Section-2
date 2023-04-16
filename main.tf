terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "null_resource" "dockervol" {
  provisioner "local-exec" {
    command = "mkdir noderedvol/ || true && sudo chown 1000:1000 noderedvol/"

  }

}

resource "random_string" "random" {
  count   = local.container_count
  length  = 4
  special = false
  upper   = false

  lifecycle {
    ignore_changes = [result]
  }

}

/*
#terraform import docker_container.nodered_container_to_delete $(docker inspect -f {{.ID}} nodered-ar85)
resource "docker_container" "nodered_container_to_delete" {
  name = "nodered-ar85"
  image = "nodered/node-red:2.1.3"
}
*/

resource "docker_image" "nodered_image" {
  name         = var.image[terraform.workspace]
  keep_locally = true
}

resource "docker_container" "nodered_container" {
  count = local.container_count
  name  = join("-", ["nodered", terraform.workspace, random_string.random[count.index].result])
  image = docker_image.nodered_image.name
  ports {
    internal = 1880
    external = var.ext_port[terraform.workspace][count.index]
  }
  lifecycle {
    ignore_changes = [ports[0].external, image]
  }
  volumes {
    container_path = "/data"
    host_path      = "${path.cwd}/noderedvol"
  }
}

