# Use libvirt as non-root user

Create a group, put yourself in it and configure some respect:

```
sudo getent group | grep libvirt
sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
id $(whoami)

# uncomment the following two lines
# /etc/libvirt/libvirtd.conf
unix_sock_group = "libvirt"
unix_sock_rw_perms = "0770"

sudo systemctl restart libvirtd.service
```

I'm not sure why I need this:

```shell
export LIBVIRT_DEFAULT_URI="qemu:///system"
```
