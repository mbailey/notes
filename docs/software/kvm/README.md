# KVM

- kvm-guest-create : script for creating kvm guests in bash-my-kvm

## Use virsh and virt-manager as non-root user

Add your user to the group:
```
sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
```


Check you're in the group:
```
id $(whoami)
```

Test it works:
```
virsh list
```