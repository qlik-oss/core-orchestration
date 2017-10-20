client {
  options = {
    "driver.raw_exec.enable" = "1"

    # Required to be able to reach docker.sock
    docker.privileged.enabled = "true"

    # Credentials to use when fetching from private docker registry. Created when running docker login, but the path is OS specific.
    docker.auth.config = "/home/circleci/.docker/config.json"
  }
}
