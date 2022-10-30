# kvm

## Create KVM guests running amazon-linux-2, ubuntu

1. [Optional] Configure SSH key / password in `config/user-data`.
1. Create your kvm guest:

    ```shell
    bin/kvm-amazon-linux-2-cli-install $GUEST_NAME
    ```

## Install (fedora-36)

```shell
sudo yum install -y                \
      genisoimage                  \
      guestfs-tools                \
      libvirt                      \
      libvirt-client               \
      libvirt-dbus                 \
      policycoreutils-python-utils \
      qemu-kvm                     \
      virt-install                 \
      virt-manager                 \
      virt-viewer                  \

sudo systemctl enable --now libvirtd.service # required?
```

## Configure

### Make guests addressable by name from host

- [Libvirt NSS module (libvirt.org)](https://libvirt.org/nss.html)

Make guests addressable from host by name:

```shell
sudo yum install libvirt-nss ## RHEL/CentOS/Fedora ##
sudo apt install libnss-libvirt ## Debian/Ubuntu ##
```

Add `libvirt libvirt_guest` to hosts entry of nsswitch:

```shell
$ grep hosts /etc/nsswitch.conf
hosts:       files libvirt libvirt_guest dns
```


## Working with your guest

Connect to guest console:

```shell
virsh console $GUEST_NAME
```

Print networking info:

```shell
# virsh net-dhcp-leases default
#  Expiry Time           MAC address         Protocol   IP address           Hostname   Client ID or DUID
# ------------------------------------------------------------------------------------------------------------------------------------------------
# 2020-09-12 14:50:17   52:54:00:e5:0e:65   ipv4       192.168.122.103/24   hal9000
```

SSH to guest:

```shell
ssh ec2-user@192.168.122.103
```
