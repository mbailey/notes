# Grafana

- [grafana-aws](../../../../../personal/inbox/grafana-aws.md)
- [grafana-azure](../../../../../personal/inbox/grafana-azure.md)

- [CVE-2022-21703 cross-origin request forgery against Grafana  jub0bs.com (jub0bs.com)](https://jub0bs.com/posts/2022-02-08-cve-2022-21703-writeup/)
- [dashboards](dashboards.md)

## Install

```shell
sudo yum install -y https://dl.grafana.com/enterprise/release/grafana-enterprise-9.4.7-1.x86_64.rpm
systemctl enable --now grafana-server
```
>
>- [Download Grafana  (grafana.com)](https://grafana.com/grafana/download)


**fedora-36**

```shell
Red Hat, CentOS, RHEL, and Fedora(64 Bit)SHA256: f956ba5ab8227dd3d1f30b019aeb933a242479a2cf2d675fd1f3dc86f099599c
wget https://dl.grafana.com/enterprise/release/grafana-enterprise-9.2.2-1.x86_64.rpm
sudo yum install grafana-enterprise-9.2.2-1.x86_64.rpm
sudo systemctl enable -now grafana-server.service
xdg-open http://admin:admin@localhost/
```

```shell
cat <<EOF | sudo tee /etc/yum.repos.d/grafana.repo
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF
```

```shell
sudo dnf -y install grafana
sudo systemctl enable --now grafana-server.service
sudo firewall-cmd --add-port=3000/tcp --permanent
sudo firewall-cmd --reload
```

## Dashboards

- [Node Exporter Full  Grafana Labs (grafana.com)](https://grafana.com/grafana/dashboards/1860-node-exporter-full/)
- 
## Plugins

```shell
grafana-cli plugins install snuids-trafficlights-panel
```
