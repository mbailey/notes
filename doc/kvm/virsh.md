# virsh

```shell
virsh list --domain centos8
virsh start --domain centos8
virsh dominfo centos8
virsh edit /etc/libvirt/qemu/ubuntu20.04-2.xml
virsh create /etc/libvirt/qemu/ubuntu20.04-2.xml
```

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


