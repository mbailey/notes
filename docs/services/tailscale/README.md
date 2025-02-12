---
alias: Tailscale
---
# Tailscale

- [Tailscale (tailscale.com)](https://tailscale.com/)
- [How Tailscale works (tailscale.com)](https://tailscale.com/blog/how-tailscale-works/)
- [CLI (tailscale.com)](https://tailscale.com/kb/1080/cli/)

![](../../assets/tailscale.png)

## Installation

- [Setting up Tailscale on Fedora · Tailscale Docs (tailscale.com)](https://tailscale.com/kb/1050/install-fedora)

### Fedora

```
sudo dnf config-manager --add-repo https://pkgs.tailscale.com/stable/fedora/tailscale.repo
sudo dnf install tailscale
sudo systemctl enable --now tailscaled
sudo tailscale up
sudo tailscale set --auto-update
```

## macOS

- [Setting up Tailscale on macOS · Tailscale Docs (tailscale.com)](https://tailscale.com/kb/1016/install-mac)

- Tailscale recommend using the version downloaded from their site.
- It appears only the open source version supports starting tailscale before user login.

### Steps

1. Download and install:  https://tailscale.com/download

2. **Start on boot (before user login):**

This does not seem to work.

```shell
sudo launchctl bootstrap system /Library/LaunchDaemons/com.tailscale.tailscaled.plist
```


## firewalld allows all traffic from tailscale

Don't do this unless you understand the implications.

Services on my host already have:

- authentication
- encryption

My Tailscale network provides an extra layer of protection
against compromise by requiring access to it before you
can even try to guess (or use stolen) credentials or observe
traffic that is already encrypted at application layer.

`/etc/firewalld/zones/trusted.xml`

```txt
<?xml version="1.0" encoding="utf-8"?>
<zone target="ACCEPT">
  <short>Trusted</short>
  <description>All network connections are accepted.</description>
  <interface name="tailscale0"/>
  <forward/>
</zone>
```

## Bash completion

- [tailscale-bash-completion.sh](tailscale-bash-completion.sh)

## Tailscale PING

- [How do I know if my traffic is being routed through DERP? (tailscale.com)](https://tailscale.com/kb/1023/troubleshooting/#how-do-i-know-if-my-traffic-is-being-routed-through-derp)
- [Encrypted TCP relays (DERP)](https://tailscale.com/blog/how-tailscale-works/#encrypted-tcp-relays-derp)

This traffic is going via tailscale server in Sydney:

```shell
$ tailscale ping phone
pong from phone (100.80.90.100) via DERP(syd) in 77ms
pong from phone (100.80.90.100) via DERP(syd) in 106ms
pong from phone (100.80.90.100) via DERP(syd) in 197ms
```

This traffic is going direct between my two hosts:

```shell
$ tailscale ping kida
pong from kida (100.40.32.19) via 192.168.50.12:41641 in 74ms
```

## Check status of other hosts

```shell
$ tailscale status
100.40.32.19    kida       user@        linux   -
100.97.100.78   phonea     user@        iOS     active; relay "syd"
100.99.217.31   kidb       user@        linux   active; direct 192.168.50.12:41641, tx 104132 rx 104396
```

## [Not working] Exclude Tailscale traffic from Mullvad VPN 

- [Can I use Tailscale alongside other VPNs · Tailscale (tailscale.com)](https://tailscale.com/kb/1105/other-vpns/)
- [Split tunneling with Linux (advanced) - Guides  Mullvad VPN (mullvad.net)](https://mullvad.net/en/help/split-tunneling-with-linux-advanced/#excluding)
- Tailscaler are partnering with mullvad to allow them to be used together

## Check network config and latency

```shell
$ tailscale netcheck

Report:
 * UDP: true
 * IPv4: yes, 131.132.88.122:53237
 * IPv6: no, but OS has support
 * MappingVariesByDestIP: false
 * HairPinning: false
 * PortMapping:
 * Nearest DERP: Sydney
 * DERP latency:
  - syd: 40.5ms  (Sydney)
  - sin: 99.9ms  (Singapore)
  - hkg: 140.2ms (Hong Kong)
  - tok: 145.2ms (Tokyo)
  - lax: 163.5ms (Los Angeles)
  - sfo: 176.1ms (San Francisco)
  - sea: 191ms   (Seattle)
  - den: 199.6ms (Denver)
  - hnl: 209.9ms (Honolulu)
  - dfw: 213.6ms (Dallas)
  - ord: 215.6ms (Chicago)
  - tor: 234.9ms (Toronto)
  - nyc: 241.2ms (New York City)
  - mia: 242.8ms (Miami)
  - fra: 245.1ms (Frankfurt)
  - ams: 254.2ms (Amsterdam)
  - mad: 257ms   (Madrid)
  - par: 264.2ms (Paris)
  - lhr: 273.9ms (London)
  - jnb: 302.2ms (Johannesburg)
  - blr: 308.9ms (Bangalore)
  - sao: 356.9ms (São Paulo)
  - waw: 358.1ms (Warsaw)
  - dbi: 408.4ms (Dubai)
```
