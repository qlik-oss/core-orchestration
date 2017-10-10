job "engine-nomad" {
  datacenters = ["dc1"]
  region = "global"
  type = "service"

  group "qix-engine" {
    count = 2

    task "qix-engine" {

      driver = "docker"

      config {
        image = "qlikea/engine:12.67.0"
        port_map {
          http = 9076
          metrics = 9090
        }

        labels {
          "qix-engine" = ""
        }
      }

      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
        network {
          mbits = 10
          port "http" {}
        }
      }

      service {
        name = "qix-engine"
        port = "http"
        check {
          type = "http"
          path = "/healthcheck"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
