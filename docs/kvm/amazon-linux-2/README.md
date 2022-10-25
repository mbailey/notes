# amazon-linux-2

## Create KVM guests running amazon-linux-2

1. Optional: Set hostname in `config/meta-data`.
2. Optional: Configure SSH key / password in `config/user-data`.
3. Create your host:

    ```shell
    bin/kvm-amazon-linux-2-cli-install $GUEST_NAME
    ```

## Working with your guest

Connect to guest console:

```shell
virsh console $GUEST_NAME
```

Print networking info:

```shell
# virsh net-dhcp-leases default
#  Expiry Time           MAC address         Protocol   IP address           Hostname   Client ID or DUID
# ------------------------------------------------------------------------------------------------------------------------------------------------
# 2020-09-12 14:50:17   52:54:00:e5:0e:65   ipv4       192.168.122.103/24   hal9000
```

SSH to guest:

```
ssh ec2-user@192.168.122.103
```
