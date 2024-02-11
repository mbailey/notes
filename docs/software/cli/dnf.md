# dnf

<!-- markdown-link-check-disable-next-line -->
[Automatic Updates](https://docs.fedoraproject.org/en-US/quick-docs/autoupdates/#reasons-against-using-automatic-updates)

## Config

Setup automatic updates:

    sudo dnf install dnf-automatic
    sudo systemctl enable --now dnf-automatic.timer

## Usage

### General

**Check status of timers**: `systemctl list-timers dnf-*

### List installed packages:

```shell
$ dnf list installed transmission # filter on names
Installed Packages
transmission.x86_64                       4.0.3-2.fc38                       @updates
```

### List files in package:

**Installed package:**

```shell
$ rpm -ql "transmission-daemon"
/usr/bin/transmission-daemon
/usr/lib/.build-id
/usr/lib/.build-id/5d
/usr/lib/.build-id/5d/7136e31ef44ad8f3e2339ecfcbb9a80f27ff70
/usr/lib/systemd/system/transmission-daemon.service
/usr/share/man/man1/transmission-daemon.1.gz
/var/lib/transmission
```

**Remote package (slow):**

```shell
$ dnf repoquery -l transmission-daemon
```

