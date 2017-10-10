job "license-service-nomad" {
  datacenters = ["dc1"]
  region = "global"
  type = "service"

  group "license-service-group" {
    count = 1

    task "license-service" {

      driver = "docker"

      config {
        image = "qlikea/license-service:0.0.1-361"
        port_map {
          http = 9200
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
        name = "license-service"
        port = "http"
        check {
          type = "http"
          path = "/v1/health"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
