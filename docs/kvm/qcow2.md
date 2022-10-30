# qcow2

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
- `/mnt/etc/ssh/sshd_config`

Unmount it:

```shell
guestunmount /tmp
```
