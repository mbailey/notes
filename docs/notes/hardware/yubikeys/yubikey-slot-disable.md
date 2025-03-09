# Yubikey Slot Disable

Stop those accidental touches spewing out ccccccvkvfuinkgccecldikjfbebjgktdrbnudhcrull

## Fedora 36

```

sudo dnf install yubikey-manager

$ ykpersonalize  -y -z -1
Firmware version 5.4.3 Touch level 1280 Unconfigured

Configuration in slot 1 will be deleted

Commit? (y/n) [n]: yes

$ ykpersonalize  -y -z -2
Firmware version 5.4.3 Touch level 1280 Unconfigured

Configuration in slot 2 will be deleted

Commit? (y/n) [n]: yes
```