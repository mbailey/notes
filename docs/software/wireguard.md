# wireguard

*Not Great Notes - old and messy*

[How to easily configure WireGuard](https://www.stavros.io/posts/how-to-configure-wireguard/)

    wg genkey | tee privatekey | wg pubkey > publickey

## Install

    dnf install wireguard-tools

    apt install wireguard wireguard-tools

## Allow wireguard traffic

    sudo firewall-cmd --permanent --add-service=wireguard
    sudo firewall-cmd --reload

## Configure

    systemctl enable --now wg-quick@wg-example
    Created symlink /etc/systemd/system/multi-user.target.wants/wg-quick@wg-example.service → /lib/systemd/system/wg-quick@.service.

## Debugging ?

    https://www.the-digital-life.com/wiki/wireguard-troubleshooting/

## phone

    dnf install qrencode

    qrencode -t ansiutf8 < /etc/wireguard/clients/mobile.conf

### Server

```shell
echo 1 > /proc/sys/net/ipv4/ip_forward
```

## sysctl -a |  grep ip_forward

```txt
net.ipv4.ip_forward = 1
net.ipv4.ip_forward_update_priority = 1
net.ipv4.ip_forward_use_pmtu = 0
```

## Put it into

/etc/sysctl.d/XX-ip_forward.conf file

```txt
#/etc/sysctl.d/99-sysctl.conf
# Uncomment the next line to enable packet forwarding for IPv4
net.ipv4.ip_forward=1
```

```shell
root@failgate:~# cat /etc/wireguard/
privatekey  publickey   wg0.conf
root@failgate:~# cat /etc/wireguard/wg0.conf
[Interface]
Address = 192.168.2.1
PrivateKey = XXX
ListenPort = 51820

PostUp   = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]
PublicKey = wMCxro9UjwkPwExdskjhdfjijdf;jwcJ5T0EchM=
AllowedIPs = 192.168.2.2/32
```

```
sudo chown -R root:root /etc/wireguard/
sudo chmod -R og-rwx /etc/wireguard/*
```

### Client

```
$ sudo cat /etc/wireguard/wg0.conf
[Interface]
Address = 192.168.2.2
PrivateKey = XXX
ListenPort = 21841

[Peer]
PublicKey = QS123456789123456789123456789000i=
Endpoint = 128.100.100.22:51820
# AllowedIPs = 192.168.2.0/24
AllowedIPs = 0.0.0.0/0, ::/0

# This is for if you're behind a NAT and
# want the connection to be kept alive.
PersistentKeepalive = 25
```

```
sudo chown -R root:root /etc/wireguard/
sudo chmod -R og-rwx /etc/wireguard/*
```

## Control

wg-quick up wg0
wg-quick down wg0

$ sudo systemctl enable wg-quick@wg0.service

$ sudo systemctl start wg-quick@wg0.service
$ sudo systemctl stop wg-quick@wg0.service
