# node_exporter

- [prometheus/node_exporter Exporter for machine metrics (github.com)](https://github.com/prometheus/node_exporter)

## Questions

- How to list all enabled collectors?

## Install

**fedora-38**
```shell
sudo dnf install -y golang-github-prometheus-node-exporter
systemctl enable --now node_exporter
```

**ubuntu**

```
sudo apt install -y prometheus-node-exporter prometheus-node-exporter-collectors
```

## Config

**systemd unit file**:
```
EnvironmentFile=/etc/default/prometheus-node-exporter
```

```shell
/etc/default/prometheus-node-exporter
/etc/systemd/system/prometheus-node-exporter.service
```


### textfile

- [prometheus/node_exporter Exporter for machine metrics (github.com)](https://github.com/prometheus/node_exporter#textfile-collector)

`--collector.textfile.directory="/var/lib/prometheus/node-exporter`





## Notes

podman exec -ti promcom_prometheus_1 wget -O- host.containers.internal:9100/metrics





