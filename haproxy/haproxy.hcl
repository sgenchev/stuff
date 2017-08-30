consul {
  address = "192.168.101.50:8500"
  ssl {
    enabled = false
  }
}
template {
  source = "/etc/consul-template/template/haproxy.ctmpl"
  destination = "/data/etc/haproxy/haproxy.cfg"
  command = "/usr/sbin/haproxy -c -f /data/etc/haproxy/haproxy.cfg && systemctl reload docker-haproxy"
}
syslog {
  enabled = true
  facility = "LOCAL5"
}

