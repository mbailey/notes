# Ubuntu Unattended Updates

Unattended updates

- Enabled by default.

## Check config

Check Systemd service enabled:
```bash
$ sudo systemctl is-enabled unattended-upgrades.service
enabled
```

Check apt config:
```bash
$ sudo apt-config dump APT::Periodic::Unattended-Upgrade
APT::Periodic::Unattended-Upgrade "1";
```

## Install

    sudo apt-get install unattended-upgrades
    sudo dpkg-reconfigure --priority=low unattended-upgrades


## See also

- [AutomaticSecurityUpdates - Community Help Wiki](https://help.ubuntu.com/community/AutomaticSecurityUpdates)