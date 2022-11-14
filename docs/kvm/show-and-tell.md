# show and tell - kvm-guest-create

- [github.com/mbaileynotes/docs/kvm (github.com)](https://github.com/mbailey/notes/tree/master/docs/kvm)

Create KVM Guests running amazon-linux-2, fedora, rocky linux quickly on workstation.

- SSH access
- no need to setup /etc/hosts or DNS

```shell
export WORD=WORD_FROM_AUDIENCE # prove I've not prepared earlier

cd docs
sudo bash
bin/kvm-guest-create
bin/kvm-guest-create "${WORD}1" amazon
bin/kvm-guest-create "${WORD}2" fedora
bin/kvm-guest-create "${WORD}2" rocky

```


