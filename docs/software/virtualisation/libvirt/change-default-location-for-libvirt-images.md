# Change Default location for libvirt images

List pools:

```shell
virsh pool-list 
```

Create pool in homedir:

```shell
POOL=${HOME}/.local/share/libvirt/images/
mkdir -p "$POOL"
virsh pool-destroy default
virsh pool-undefine default
virsh pool-define-as --name default --type dir --target "$POOL"
virsh pool-start default
virsh pool-autostart default
virsh pool-list 
sudo systemctl restart libvirtd
```

## Give QEMU access to images

Grant access:

fedora:
```
[m@x2 bash-my-kvm]$ sudo setfacl -m u:qemu:rx /home/m /home/m/.local /home/m/.local/share
```

ubuntu:


```shell
$ sudo setfacl -m u:libvirt-qemu:rx /home/m /home/m/.local /home/m/.local/share
$ sudo systemctl restart libvirtd
```


Restart libvirtfd

Check settings:

```shell
[m@x2 bash-my-kvm]$ sudo getfacl -e /home/m/.local /home/m/.local/share
getfacl: Removing leading '/' from absolute path names
# file: home/m
# owner: m
# group: m
user::rwx
user:qemu:r-x			#effective:r-x
group::---			#effective:---
mask::r-x
other::---
```

## See also

- [How To Change KVM Libvirt Default Storage Pool Location - OSTechNix (ostechnix.com)](https://ostechnix.com/how-to-change-kvm-libvirt-default-storage-pool-location/)
- [use-libvirt-as-non-root-user](use-libvirt-as-non-root-user.md)
