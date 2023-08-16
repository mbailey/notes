#!/bin/bash

# fedora-rescue - after booting from USB, mount paritions and do something

# create directories:

mkdir /mnt/home
mkdir /mnt/boot
mkdir /mnt/btrfs

# decrypt:
cryptsetup open --type luks /dev/nvme0n1p3 luks
# Enter passphrase for /dev/nvme0n1p3:

# mount to check btrfs:
mount /dev/mapper/luks /mnt/btrfs

# check btrfs subvolumes
btrfs subvolume list /mnt/btrfs

# mount boot
mount /dev/nvme0n1p2 /mnt/boot

# mount root:
mount /dev/mapper/luks /mnt -t btrfs -o subvol=root

# mount home:
mount /dev/mapper/luks /mnt/home -t btrfs -o subvol=home

# mount others
mount --bind /dev /mnt/dev
mount -t proc /proc /mnt/proc
mount -t sysfs /sys /mnt/sys
mount -t tmpfs tmpfs /mnt/run
mkdir -p /mnt/run/systemd/resolve/
echo 'nameserver 1.1.1.1' > /mnt/run/systemd/resolve/stub-resolv.conf

# test if everything mounted:
ls -lha /mnt/home

# change root
chroot /mnt && echo foo

exit

# unmount everything
umount /mnt/home
umount /mnt/dev
umount /mnt/proc
umount /mnt/sys
umount /mnt/run
umount /mnt/boot
umount /mnt
