# fedora-install

## Install from USB

- Custom partitioning
    - Standard partitioning (not LVM)
    - EXT4
    - Select Full disk encryption
    - Extra partition:  /var 300GB # for VMS
- Reboot
- Create login

## Update packages:

    sudo dnf update -y

## Enable automatic updates:

    sudo dnf -y install dnf-automatic
    sudo systemctl enable --now dnf-automatic.timer

Update firewall: TBA


Setup etckeeper to keep /etc in Git:

    sudo dnf -y install etckeeper

    git config --global user.email || git config --global user.email "you@example.com"
    git config --global user.name || git config --global user.name "Your Name"

    etckeeper init
    etckeeper vcs status
    etckeeper vcs commit -m 'msg'

## See also

- setup user account on fedora