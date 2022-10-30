# kvm-guest-create - simple and fast linux guest creation

1. [Optional] Configure SSH key / password in `config/user-data`.
1. Create your kvm guest:

    ```shell
    bin/kvm-guest-create GUEST_NAME [GUEST_TYPE] # amzn2, fedora, rocky, etc
    ```

## Install Deps (fedora-36)

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

### Make guests addressable by name from host by name

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

## Working with your guests

Connect to guest console:

```shell
virsh console $GUEST_NAME
```

SSH to it's IP address (accessible by name from host or other guests):

```shell
ssh admin@$GUEST_NAME
```
