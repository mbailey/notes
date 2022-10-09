# dnf

[Automatic Updates](https://docs.fedoraproject.org/en-US/quick-docs/autoupdates/#reasons-against-using-automatic-updates)

Are you sure you want to do that?


Setup automatic updates:

    sudo dnf install dnf-automatic
    sudo systemctl enable --now dnf-automatic.timer

Check status of timers:

    systemctl list-timers dnf-*
