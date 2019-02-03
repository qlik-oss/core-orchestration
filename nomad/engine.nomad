job "engine-nomad" {
  datacenters = ["dc1"]
  region = "global"
  type = "service"

  group "qix-engine" {
    count = 2

    task "qix-engine" {

      driver = "docker"

      config {
        image = "qlikcore/engine:12.311.0"
        # change to 'yes' to accept the Qlik Core EULA:
        args = ["-S", "AcceptEULA=no", "-S", "LicenseServiceUrl=http://license-service:9200"]

        port_map {
          http = 9076
          metrics = 9090
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
        address_mode = "driver"
        port = "http"
        check {
          type = "http"
          path = "/healthcheck"
          interval = "30s"
          timeout  = "2s"
        }
      }
    }
  }
}
