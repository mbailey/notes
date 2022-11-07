# Grafana

- [grafana-aws](grafana-aws.md)
- [grafana-azure](grafana-azure.md)

## Install

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

## Plugins

```shell
grafana-cli plugins install snuids-trafficlights-panel
```