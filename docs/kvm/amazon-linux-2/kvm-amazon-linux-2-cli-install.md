# Install Amazon Linux 2 on kvm via CLI

- [Run Amazon Linux 2 as a virtual machine on premises (docs.aws.amazon.com)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/amazon-linux-2-virtual-machine.html#amazon-linux-2-virtual-machine-download)
- [QEMU  KVM Using the Copy-On-Write mode (www.unixmen.com)](https://www.unixmen.com/qemu-kvm-using-copy-write-mode/)
- [Creating a VM using Libvirt, Cloud Image and Cloud-Init  Sumit’s Dreams of Electric Sheeps (sumit-ghosh.com)](https://sumit-ghosh.com/articles/create-vm-using-libvirt-cloud-images-cloud-init/)

## TODO

- [x] mount and edit qcow2 (unset root password)
- [x] script to quickly create new throwaway vm
    - [ ] hostnames for ssh and web access
- [ ] make a second layer that gets regular `yum update` that others built from
- [ ] disk performance
    - [ ] test using passthrough
- [ ] check whether seed.iso is being used (first/always/never)
- [ ] create a thin layer with updated auth and sshd_config
    - [ ] automate creation of this over new amazon kvm images

See script in [bin/kvm-amazon-linux-2-cli-install](bin/kvm-amazon-linux-2-cli-install)

## Mount and edit a qcow2 volume

Install guestfs-tools:

```shell
sudo dnf install -y guestfs-tools
```

debian/ubuntu:
```shell
sudo apt install -y guestfs-tools
```

List the partitions:

```shell
# sudo guestfish -a amazon-linux-2-template.qcow2

Welcome to guestfish, the guest filesystem shell for
editing virtual machine filesystems and disk images.

Type: ‘help’ for help on commands
      ‘man’ to read the manual
      ‘quit’ to quit the shell

><fs> run
 100% ⟦▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒⟧ 00:00
><fs> list-filesystems 
/dev/sda1: xfs
/dev/sda128: unknown

```

Mount it:

```shell
$ sudo guestmount -a amazon-linux-2-template.qcow2 -m /dev/sda1 /mnt
$ sudo ls /mnt/
bin  boot  dev  etc  home  lib  lib64  local  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```

Edit files on qcow2 image (optional):

- `/mnt/etc/password`
- `/mnt/etc/resolv.conf`
- `/mnt/etc/ssh/sshd_config `

Unmount it:

```shell
guestunmount /tmp
```


