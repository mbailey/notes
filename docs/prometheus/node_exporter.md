# node_exporter

```shell
sudo dnf install -y golang-github-prometheus-node-exporter
systemctl enable --now node_exporter
```

/etc/default/prometheus-node-exporter
/etc/systemd/system/prometheus-node-exporter.service

podman exec -ti promcom_prometheus_1 wget -O- host.containers.internal:9100/metrics
