# Install Amazon Linux 2 on kvm via CLI

- [Run Amazon Linux 2 as a virtual machine on premises (docs.aws.amazon.com)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/amazon-linux-2-virtual-machine.html#amazon-linux-2-virtual-machine-download)
- [QEMU  KVM Using the Copy-On-Write mode (www.unixmen.com)](https://www.unixmen.com/qemu-kvm-using-copy-write-mode/)
- [Creating a VM using Libvirt, Cloud Image and Cloud-Init  Sumit’s Dreams of Electric Sheeps (sumit-ghosh.com)](https://sumit-ghosh.com/articles/create-vm-using-libvirt-cloud-images-cloud-init/)

## TODO

- [x] mount and edit qcow2 (unset root password)
- [ ] script to quickly create new throwaway vm
    - [ ] hostnames for ssh and web access
- [ ] disk performance
    - [ ] test using passthrough
- [ ] check whether seed.iso is being used (first/always/never)
- [ ] create a thin layer with updated auth and sshd_config
    - [ ] automate creation of this over new amazon kvm images

## Create seed.iso boot image

Create `seedconfig/meta-data`:

```yaml
local-hostname: amazonlinux2.onprem
# eth0 is the default network interface enabled in the image. You can configure static network settings with an entry like the following.
network-interfaces: |
  auto eth0
  iface eth0 inet static
  address 192.168.122.68
  network 192.168.122.0
  netmask 255.255.255.0
  broadcast 192.168.122.255
  gateway 192.168.122.1
```

Create `seedconfig/user-data`:

```yaml
#cloud-config
#vim:syntax=yaml
users:
# A user by the name `ec2-user` is created in the image by default.
  - default
chpasswd:
  list: |
    ec2-user:CHANGEME
# In the above line, do not add any spaces after 'ec2-user:'.

# NOTE: Cloud-init applies network settings on every boot by default. To retain network settings 
# from first boot, add the following ‘write_files’ section:
write_files:
  - path: /etc/cloud/cloud.cfg.d/80_disable_network_after_firstboot.cfg
    content: |
      # Disable network configuration after first boot
      network:
        config: disabled
```

Generate `seed.iso` boot image:

```shell
genisoimage -output seed.iso -volid cidata -joliet -rock user-data meta-data
```

## Download amazon-linux-2 image

Download [amazon-linux-2 image](https://cdn.amazonlinux.com/os-images/latest/) and files to verify it:

```shell
wget https://cdn.amazonlinux.com/os-images/2.0.20221004.0/kvm/amzn2-kvm-2.0.20221004.0-x86_64.xfs.gpt.qcow2
wget https://cdn.amazonlinux.com/os-images/2.0.20190612/kvm/SHA256SUMS
wget https://cdn.amazonlinux.com/os-images/2.0.20190612/kvm/SHA256SUMS.gpg
```

Check the sha256sum:

```shell
$ sha256sum --check SHA256SUMS
amzn2-kvm-2.0.20221004.0-x86_64.xfs.gpt.qcow2: OK
```

Verify the digital signature:

```shell
$ gpg --verify SHA256SUMS.gpg SHA256SUMS
gpg: Signature made Sat 15 Oct 2022 06:09:35 AEDT
gpg:                using RSA key 99E617FE5DB527C0D8BD5F8E11CF1F95C87F5B1A
gpg: Good signature from "Amazon Linux <amazon-linux@amazon.com>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 99E6 17FE 5DB5 27C0 D8BD  5F8E 11CF 1F95 C87F 5B1A
```

Make downloaded image readonly:

```shell
sudo chmod a-w amzn2-kvm-2.0.20221004.0-x86_64.xfs.gpt.qcow2
```

## Create amazon-linux-2 kvm guest boot image

Create a small Copy on Write (COW) image based on the downloaded amazon-linux-2.
```shell
qemu-img create                                      \
    -f qcow2                                         \
    -b amzn2-kvm-2.0.20221004.0-x86_64.xfs.gpt.qcow2 \
    -F qcow2                                         \
    amazon-linux-2-template.qcow2
```

Inspect new COW image:

```shell
$ qemu-img info --backing-chain amazon-linux-2-template.qcow2 
image: amazon-linux-2-template.qcow2
file format: qcow2
virtual size: 25 GiB (26843545600 bytes)
disk size: 36.8 MiB
cluster_size: 65536
backing file: amzn2-kvm-2.0.20221004.0-x86_64.xfs.gpt.qcow2
backing file format: qcow2
Format specific information:
    compat: 1.1
    compression type: zlib
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
    extended l2: false

image: amzn2-kvm-2.0.20221004.0-x86_64.xfs.gpt.qcow2
file format: qcow2
virtual size: 25 GiB (26843545600 bytes)
disk size: 1.32 GiB
cluster_size: 65536
Format specific information:
    compat: 1.1
    compression type: zlib
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
    extended l2: false
```

## Mount and edit the qcow2 volume

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

## Create KVM guest

Remove existing guest template:

```
sudo virsh undefine amazon-linux-2
```

Create new guest template:

#TODO  Check whether CDROM is being used ever/first time/always (cloud-init, user-data)

```
virt-install \
  --console pty,target_type=serial \
  --description "Amazon Linux 2 Template Copy on Write (COW)" \
  --disk path=/var/lib/libvirt/images/amazon-linux-2-template.qcow2,bus=virtio,size=10 \
  --disk path=$HOME/amazon-linux-2/seedconfig/seed.iso,device=cdrom \
  --graphics spice \
  --import \
  --name amazon-linux-2-template \
  --network bridge:virbr0,model=virtio \
  --os-variant=rhel7.0 \
  --ram=2048 \
  --vcpus=2
```

## Start it

```shell
$ virsh start amazon-linux-2-template
```

## Connect

```
$ virsh console amazon-linux-2-template 
Connected to domain 'amazon-linux-2-template'
Escape character is ^] (Ctrl + ])
root
Last login: Mon Oct 24 23:51:13 on tty1

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
11 package(s) needed for security, out of 13 available
Run "sudo yum update" to apply all updates.
```
---

function virt-install-shortcut() {
    local name="${1:-deleteme}"
    virt-install \
      --console pty,target_type=serial \
      --description "Amazon Linux 2 COW" \
      --disk "path=/var/lib/libvirt/images/${name}.qcow2,bus=virtio,size=10" \
      --graphics spice \
      --import \
      --name "${name}" \
      --network bridge:virbr0,model=virtio \
      --os-variant=rhel7.0 \
      --ram=2048 \
      --vcpus=2
}
