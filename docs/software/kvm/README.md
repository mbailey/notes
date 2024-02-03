# KVM

- [kvm-guest-create](kvm-guest-create.md) : script for creating kvm guests

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