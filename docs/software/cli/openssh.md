# OpenSSH

## Handy commands

**Extract public key:** `ssh-keygen -y -f /path/to/private/key`

## CVE

- https://github.com/xaitax/CVE-2024-6387_Check
## Install

### From source

You probably only want to install from source if:

- You're running on an old distro without security updates.
- You want to run a newer version than your distro offers.

#### Fedora

I'm running fedora-38 (out of support) on a host.

1. **Download openssh portable source code**: from a [mirror](https://www.openssh.com/portable.html)

2. **Install deps:** 

    ```shell
    sudo dnf install -y libfido2-devel
    ```
   
2. **Compile and install:**

    This will replace `/usr/sbin/sshd`. 

    Non-system packages are more commonly installed to dirs under:

    - `/usr/local`: default location, usually ahead of `/usr` in `$PATH`
    - `/opt`: Another common place for 

    I'm doing this because then the existing systemd files will just work.

    ```shell
    tar zxfv openssh-9.8p1.tar.gz
    cd openssh-9.8p1
    ./configure --prefix=/usr
    make
    sudo make install
    ```

3. **Restart sshd:**
    ```shell
    sudo systemctl stop sshd
    sudo systemctl start sshd
    ```

4. **Check version of sshd running:**

```shell
$ nc --recv-only --idle-timeout 0.2 localhost 22 2>/dev/null
SSH-2.0-OpenSSH_9.8
```

**Note: Your shell may have cached old version of client**

Old version of ssh client still reported:
```shell
$ ssh -V
OpenSSH_9.0p1, OpenSSL 3.0.9 30 May 2023
```

This is because shell hashed location:
```shell
$ type ssh
ssh is hashed (/usr/bin/ssh)
```

Rehash and it should find new version:
```shell
$ hash -r
$ type ssh
ssh is hashed (/usr/local/bin/ssh)
$ ssh -V
OpenSSH_9.8p1, OpenSSL 3.0.9 30 May 2023
```