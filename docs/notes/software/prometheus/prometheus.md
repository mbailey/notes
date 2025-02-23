# Prometheus

Prometheus monitoring


## Install


```shell
sudo dnf -y install golang-github-prometheus
systemctl enable --now prometheus
```


Update to latest

```shell
wget https://github.com/prometheus/prometheus/releases/download/v2.46.0/prometheus-2.46.0.linux-amd64.tar.gz
tar zxfv prometheus-2.46.0.linux-amd64.tar.gz
cd 
```


## Port Forwarding

```
LocalForward 59090 localhost:9090 # prometheus
LocalForward 59091 localhost:9091 # pushgateway
LocalForward 59093 localhost:9093 # alertmanager
LocalForward 59100 localhost:9100 # node_exporter
LocalForward 53000 localhost:3000 # grafana
LocalForward 59115 localhost:9115 # blackbox_exporter
```

