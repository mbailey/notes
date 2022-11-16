# kvm-guest-create

Create various flavours of linux VMs in no time.

- Takes ~35 seconds from running script till SSH being available
- Amazon Linux 2, Fedora, Rocky Linux
- Guests findable by name from host and each other with zero config

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

## Configure

### Configure SSH key / password in `config/user-data`.

Optionally update the default username / password / SSH public key.

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

## Create your kvm guest

```shell
bin/kvm-guest-create GUEST_NAME [GUEST_TYPE] # amzn2, fedora, rocky, etc
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

## TODO

- bash completion on distros available
- fix ssh between guests
