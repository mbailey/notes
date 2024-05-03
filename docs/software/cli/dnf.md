# dnf

Package manager for redhat / fedora linux.

**TODO:** Extract common tasks out into a cross platform doc (dnf, yum, apt, brew)

<!-- markdown-link-check-disable-next-line -->
[Automatic Updates](https://docs.fedoraproject.org/en-US/quick-docs/autoupdates/#reasons-against-using-automatic-updates)

## Config

Setup automatic updates:

    sudo dnf install dnf-automatic
    sudo systemctl enable --now dnf-automatic.timer

## Usage

### Commands

**Check status of timers**: `systemctl list-timers dnf-*
#### **Find package that provides file** 

```shell
$ dnf provides symlinks
Last metadata expiration check: 0:22:13 ago on Wed 24 Apr 2024 09:18:31.
symlinks-1.7-8.fc38.x86_64 : A utility which maintains a system's symbolic links
Repo        : @System
Matched from:
Provide    : symlinks = 1.7-8.fc38

symlinks-1.7-8.fc38.x86_64 : A utility which maintains a system's symbolic links
Repo        : fedora
Matched from:
Provide    : symlinks = 1.7-8.fc38
```

#### **Package cache updates:**

**metadata_expire:** 
- **dnf:** `dnf config-manager --dump | grep metadata_expire`
- **yum repos:**  `grep metadata_expire /etc/yum.repos.d/*`

**Schedule cache updates:**

*cronjob-add (part of mt-public) adds to personal crontab if missing*

- **dnf:** `cronjob-add '0 */4 * * * /usr/bin/dnf makecache -q >> /var/log/dnf-makecache.log 2>&1'` 
- **apt:** `cronjob-add '0 3 * * * /usr/bin/apt update -qq > /var/log/apt-update.log 2>&1`

#### List installed packages:

```shell
$ dnf list installed transmission # filter on names
Installed Packages
transmission.x86_64                       4.0.3-2.fc38                       @updates
```

#### List files in package:

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

