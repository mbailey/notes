# virsh

```shell
virsh list --domain centos8
virsh start --domain centos8
virsh dominfo centos8
virsh edit /etc/libvirt/qemu/ubuntu20.04-2.xml
virsh create /etc/libvirt/qemu/ubuntu20.04-2.xml
```

## Commands

- **Autostart domain:**  virsh autostart git

### List guest domains

    $ virsh list
     Id   Name          State
    -----------------------------
     3    ubuntu22.04   running

## Clone

```shell
virt-clone                           \
  --original=server1.linuxconfig.org \
  --name=server2.linuxconfig.org     \
  --auto-clone
```

## Default to system instead of session

```text
#/etc/libvirt/libvirt.conf
#
# These can be used in cases when no URI is supplied by the application
# (@uri_default also prevents probing of the hypervisor driver).
#
uri_default = "qemu:///system"
```

Just for one user (~/.bashrc)

```shell
export LIBVIRT_DEFAULT_URI="qemu:///system"
```

## See also

- [kvm](../../../../personal/resources/tech/private/kvm.md)