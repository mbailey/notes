# Ubuntu

## Unattended upgrades

- [AutomaticSecurityUpdates - Community Help Wiki](https://help.ubuntu.com/community/AutomaticSecurityUpdates)

- Enabled by default.

Get current config:

    $ apt-config dump APT::Periodic::Unattended-Upgrade
    APT::Periodic::Unattended-Upgrade "1";

Setup:

    sudo apt-get install unattended-upgrades
    sudo dpkg-reconfigure --priority=low unattended-upgrades

