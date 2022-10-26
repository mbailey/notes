# Install Amazon Linux 2 on kvm via CLI

- [Run Amazon Linux 2 as a virtual machine on premises (docs.aws.amazon.com)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/amazon-linux-2-virtual-machine.html#amazon-linux-2-virtual-machine-download)
- [QEMU  KVM Using the Copy-On-Write mode (www.unixmen.com)](https://www.unixmen.com/qemu-kvm-using-copy-write-mode/)
- [Creating a VM using Libvirt, Cloud Image and Cloud-Init  Sumit’s Dreams of Electric Sheeps (sumit-ghosh.com)](https://sumit-ghosh.com/articles/create-vm-using-libvirt-cloud-images-cloud-init/)

## TODO

- [x] mount and edit qcow2 (unset root password)
- [x] script to quickly create new throwaway vm
- [ ] set hostname
- [ ] mdns
- [ ] make a second layer that gets regular `yum update` that others built from
- [ ] disk performance
    - [ ] test using passthrough
- [ ] check whether seed.iso is being used (first/always/never)
- [ ] create a thin layer with updated auth and sshd_config
    - [ ] automate creation of this over new amazon kvm images

See script in [bin/kvm-amazon-linux-2-cli-install](bin/kvm-amazon-linux-2-cli-install)

[Download kvm Amazon Linux 2022 - before it's released (news.ycombinator.com)](https://news.ycombinator.com/item?id=29344927)

Get Amazon Linux 2022 kvm

```
aws ec2 describe-images --region eu-west-1 --owners amazon --filters 'Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2' 'Name=state,Values=available' 'Name=architecture,Values=x86_64' --output json | jq -r '.Images | sort_by(.CreationDate)'
```

<https://cdn.amazonlinux.com/os-images/2.0.20221004.0/kvm/amzn2-kvm-2.0.20221004.0-x86_64.xfs.gpt.qcow2>

## firewalld (?)

yum install -y firewalld
systemctl start firewalld
firewall-cmd --permanent --add-service mdns
firewall-cmd reload

## mdns

- <https://simonmicro.de/dear-templates/libvirtd-linux-virtualisation/#vm---allow-multicast-packages>

```shell
 sudo virsh edit grafana
 sudo systemctl restart libvirtd # required
```

host:

```shell
sudo vi /etc/avahi/avahi-daemon.conf
# Set --> allow-interfaces=eth0,virbr0
sudo systemctl reload avahi-daemon.service
```

guests:

```shell
sudo yum install polkit
sudo yum -y install avahi-tools avahi-compat-libdns_sd
```

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
