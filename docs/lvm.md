- # lvm

Logical Volume Manager

- `pvs`: list physical volumes
- `vgs`: list volume groups
- `lvs`: list logical volumes

## Create and mount volume

```shell
lvcreate -n syncthing-lv -L 600g ubuntu-vg
mkfs.ext4 /dev/ubuntu-vg/syncthing-lv
```

## use all disk

```shell
lvextend -l +100%FREE /dev/fedora/home --resizefs
```


## resize

lvresize -L+100G pcap

xfs_growfs /pcap



## wipe disk (LVM: Device /dev/sdX excluded by filter)

    wipefs -a /dev/sda

