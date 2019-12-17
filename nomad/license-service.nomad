job "license-service-nomad" {
  datacenters = ["dc1"]
  region = "global"
  type = "service"

  group "license-service-group" {
    count = 1

    task "license-service" {

      driver = "docker"

      config {
        image = "qlikcore/licenses:3.5.0"
        port_map {
          http = 9200
        }
      }

      env {
        LICENSE_KEY = ""
      }

      resources {
        # Default resource limits
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
        network {
          mbits = 10
          port "http" {}
        }
      }

      service {
        name = "license-service"
        address_mode = "driver"
        port = "http"
        check {
          type = "http"
          path = "/v1/health"
          interval = "30s"
          timeout  = "2s"
        }
      }
    }
  }
}
