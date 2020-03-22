job "mira-nomad" {
  datacenters = ["dc1"]
  region = "global"
  type = "service"

  group "mira-group" {
    count = 1

    task "mira" {

      driver = "docker"

      config {
        image = "qlikcore/mira:3.0.0"
        dns_search_domains = ["service.dc1.consul"]
        # Use docker bridge as dns server
        dns_servers = ["172.17.0.1", "8.8.8.8"]
        port_map {
          http = 9100
        }
      }

      env {
        MIRA_MODE = "dns"
        MIRA_DISCOVERY_HOSTNAME = "qix-engine.service.consul"
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
        name = "mira"
        address_mode = "driver"
        port = "http"
        check {
          type = "http"
          path = "/health"
          interval = "30s"
          timeout  = "2s"
        }
      }
    }
  }
}
