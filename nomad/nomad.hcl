bind_addr = "0.0.0.0"
data_dir  = "/var/lib/nomad"

server {
  enabled          = true
  bootstrap_expect = 1
}

client {
  options = {
    "driver.raw_exec.enable" = "1"

    # Credentials to use when fetching from private docker registry. Created when running docker login, but the path is OS specific.
    docker.auth.config = "/home/circleci/.docker/config.json"
  }
}
