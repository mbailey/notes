# ubuntu

- [ubuntu-unattended-updates](../../../../public/docs/ubuntu-unattended-updates.md)

## Update

```bash
apt update && apt upgrade -y
```

## Install

### Create install USB

    sudo dd if=/path-to-the-iso/ubuntu-18.04.1-desktop-amd64.iso of=/dev/sdb bs=8M

    sudo apt update

### Packages

    sudo apt install -y \
      net-tools \
      etckeeper 

    sudo update-alternatives --config editor


