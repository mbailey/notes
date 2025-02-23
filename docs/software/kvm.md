# kvm notes

- [12.4.3. Creating an LVM-based Storage Pool with virsh Red Hat Enterprise Linux 6  Red Hat Customer Portal (access.redhat.com)](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/virtualization_administration_guide/create-lvm-storage-pool-virsh)


## Install (fedora-36)

```shell
sudo yum install -y                \
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

investigate #todo
- [] bridge-utils
- [] dnsmasq
- [] openbsd-netcat
- [] vde2

## Manage guest domains as a non-root user

Membership of `libvirt` group allows you to use `virsh` (CLI) and `virt-manager` (GUI) as your normal user.

    sudo getent group | grep libvirt
    sudo usermod -a -G libvirt $(whoami)
    newgrp libvirt
    id $(whoami)

    # uncomment the following two lines
    # /etc/libvirt/libvirtd.conf
    unix_sock_group = "libvirt"
    unix_sock_rw_perms = "0770"

    sudo systemctl restart libvirtd.service

## Fix ip address via DHCP

- [dhcp - KVMlibvirt How to configure static guest IP addresses on the virtualisation host - Server Fault (serverfault.com)](https://serverfault.com/questions/627238/kvm-libvirt-how-to-configure-static-guest-ip-addresses-on-the-virtualisation-ho)

    virsh  dumpxml  $VM | grep 'mac address'
    virsh  net-list
    virsh  net-edit  $NETWORK_NAME    # Probably "default"
        <dhcp>
          <range start='192.168.122.100' end='192.168.122.254'/>
          <host mac='52:54:00:6c:3c:01' name='vm1' ip='192.168.122.11'/>
          <host mac='52:54:00:6c:3c:02' name='vm2' ip='192.168.122.12'/>
          <host mac='52:54:00:6c:3c:03' name='vm3' ip='192.168.122.12'/>
        </dhcp>
    virsh  net-destroy  $NETWORK_NAME
    virsh  net-start    $NETWORK_NAME
    systemctl stop libvirtd
    killall dnsmasq
    systemctl start libvirtd
    virsh reboot $VM

## convert qcow to raw (not sparse)

    virsh shutdown <vmname>

    qemu-img convert -S 0 -f qcow2 -O raw image.qcow2 image.raw

    virsh edit <vmname>

## Create live snapshot

    virsh snapshot-create-as \
        --live                 \
        --domain centos7.0     \
        --name "20220222"      \
        --description "Snapshot before restarting with updates"

## Make virsh default to system instead of session

    #/etc/libvirt/libvirt.conf
    #
    # These can be used in cases when no URI is supplied by the application
    # (@uri_default also prevents probing of the hypervisor driver).
    #
    uri_default = "qemu:///system"

## just for one user (~/.bashrc)

    export LIBVIRT_DEFAULT_URI="qemu:///system"

## Remote admin

  virsh -c qemu+ssh://root@server01/system

## Edit VM config

    virsh edit server01

## remote support

<https://libvirt.org/remote.html>

## define storage pools

<https://linuxconfig.org/configure-default-kvm-virtual-storage-on-redhat-linux>

    mkdir -p /data/libvirt/images
    yum install -y policycoreutils-python-utils
    semanage fcontext -t virt_image_t -a '/data/libvirt/images(/.*)?'
    restorecon /data/libvirt/images/
    rmdir /var/lib/libvirt/images/
    ln -sf /data/libvirt/images/ /var/lib/libvirt/images

<https://serverfault.com/questions/840519/how-to-change-the-default-storage-pool-from-libvirt>

virsh pool-destroy images
virsh pool-undefine images
virsh pool-destroy libvirt
virsh pool-undefine libvirt
virsh pool-destroy volumes
virsh pool-undefine libvirt

replace default
virsh pool-destroy default
virsh pool-undefine default
sudo mkdir /home/libvirt/images

virsh pool-define-as --name default --type dir --target /home/libvirt/images

virsh pool-autostart default

virsh pool-start default


```
# $ virsh pool-list

# Name                 State      Autostart

# -------------------------------------------

# default              active     yes

## networks

    tree /etc/libvirt/qemu/networks
    /etc/libvirt/qemu/networks
    ├── autostart
    │   └── default.xml -> ../default.xml
    └── default.xml

## recreate default network
```

<https://wiki.libvirt.org/page/Networking#NAT_forwarding_.28aka_.22virtual_networks.22.29>

    # virsh net-define /usr/share/libvirt/networks/default.xml
    Network default defined from /usr/share/libvirt/networks/default.xml
    # virsh net-autostart default
    Network default marked as autostarted
    # virsh net-start default
    Network default started

## Fix for issue 'machines list is empty'

# <https://github.com/cockpit-project/cockpit/issues/13343>

sudo usermod -a -G libvirt libvirtdbus

## list pci things for passthrough

- <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/5/html/virtualization/sect-virtualization-adding_a_pci_device_to_a_host_with_virt_install>)
- <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/virtualization_administration_guide/chap-guest_virtual_machine_device_configuration>

virsh nodedev-list --tree

## [Assign static guest IP](https://www.cyberciti.biz/faq/linux-kvm-libvirt-dnsmasq-dhcp-static-ip-address-configuration-for-guest-os/)

    virsh net-list
    virsh net-dumpxml default
    virsh dumpxml centos7 | grep -i '<mac'
    # <mac address='52:54:00:4c:40:1c'/>
    virsh net-edit default
    # <dhcp>
    #   <range start='192.168.122.100' end='192.168.122.254'/>
    #   <host mac='52:54:00:a0:cc:19' name='centos7' ip='192.168.122.2'/>
    virsh net-destroy default
    virsh net-start default
    virsh shutdown example-vm
    # /etc/init.d/libvirt-bin restart # or
    systemctl restart libvirtd
    virsh start example-vm

# cloud-config
package_upgrade: true
groups:

- wheel
users:
- name: m
    groups: wheel
    lock_passwd: false
    passwd: $1$SaltSalt$YhgRYajLPrYevs14poKBQ0
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh-authorized-keys:
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC60l4p184x1gziIYk0Mb2QA4zCFdyia/bJ+VwuISB8446+CayEa7DxBHxKayvyqy4hIwhkTML39C99+cnrfiOtYeh2lsunbVp/JRunF/94w4UubQSbdb9Kd8DXCiEVlh2JmwOEs2rZFyiMlztOnGPZPDDaLwpQJ+HuktbdnAEX83EZcE+ZbcJlg+OMo4G1EYo/s8bOWHdq0l0j/onbsZtbQ6+U4jdmiTBR8CXRsXH/WFIknIeKgDScr+CoSubFijHFqmvF8ORhK0mgsRpcvTCirDw7ht3EiuqegH55oqNfbKEJ4WbCyU2YN6bkjNKJHZWW5NNtOC8w2rRnGPU2TdXUZfG6j7zeOCvgWNmrajYYAB404jfaBN4pMhrR+W/zbyyGJ7aOpVJocZxK1FojeiBiXRlujR5UiWY90YSiH9e7aXm0Hd9ENfbgFQodksG9Z64ReoUFG502QAGAhq7iM9u/KxsCf6WIb4VROMZt06xc6XDdy/4Bf8gCjkizFXD+Dv8= mikebailey@localhost.localdomain

## Install

sudo dnf  groupinstall Virtualization

## Configure

$ ifconfig virbr0
virbr0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.122.1  netmask 255.255.255.0  broadcast 192.168.122.255
        ether 52:54:00:85:8f:56  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 9  bytes 793 (793.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

## Control VMs

virsh list --domain centos8
virsh start --domain centos8
virsh dominfo centos8

virsh edit /etc/libvirt/qemu/ubuntu20.04-2.xml
virsh create /etc/libvirt/qemu/ubuntu20.04-2.xml

## Clone

virt-clone                           \
  --original=server1.linuxconfig.org \
  --name=server2.linuxconfig.org     \
  --auto-clone

## virsh

## connect to a remote host - you'll need access for your user setup

    virsh -c qemu+ssh://baileym@mtngh1/system

## Turn autostart on/off

    virsh autostart VMNameHere

    virsh autostart VMNameHere --disable

## libvirt

# ## remote virt-viewer

virt-viewer --connect qemu+ssh://mtnug1/system mtnug-rvsgw1

## Unattended install using kickstart file

virt-install \
  --connect qemu:///system \
  --name deleteme \
  --memory 4096 \
  --vcpus 2 \
  --disk size=100 \
  --location /var/lib/libvirt/iso/CentOS-7-x86_64-Minimal-2009.iso \
  --os-variant rhel7.0 \
  --initrd-inject ks.cfg \
  --extra-args="ks=file:/ks.cfg console=tty0 console=ttyS0,115200n8"

# --connect qemu+ssh://mtnug1/system \

    # cleanup
    # virsh shutdown mtnug-rvsgw1
    # virsh undefine mtnug-rvsgw1

## Use virt-manager as a non-root user

    sudo getent group | grep libvirt
    sudo usermod -a -G libvirt $(whoami)
    newgrp libvirt
    id $(whoami)

    # uncomment the following two lines
    # /etc/libvirt/libvirtd.conf
    unix_sock_group = "libvirt"
    unix_sock_rw_perms = "0770"

    sudo systemctl restart libvirtd.service

## make virsh default to system instead of session

    #/etc/libvirt/libvirt.conf
    #
    # These can be used in cases when no URI is supplied by the application
    # (@uri_default also prevents probing of the hypervisor driver).
    #
    uri_default = "qemu:///system"

## just for one user (~/.bashrc)

    export LIBVIRT_DEFAULT_URI="qemu:///system"

## [change password in qcow image](https://access.redhat.com/discussions/664843)

    virt-customize -a rhel-guest-image-7.2-20160302.0.x86_64.qcow2 \
                   --root-password password:PASSW0RD \
                   --uninstall cloud-init


## See also

- [virsh](kvm/virsh.md)