# Git Credential Manager

Encrypt your tokens and avoid entering your github password onto less-trusted devices.

- [Git - Credential Storage (git-scm.com)](https://git-scm.com/book/en/v2/Git-Tools-Credential-Storage)

![](assets/Pasted%20image%2020231219170426.png)
## Install Git Credential Manager

### Debian

- [debian package (github.com)](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md#debian-package)

```
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.4.1/gcm-linux_amd64.2.4.1.deb
sudo apt install ./gcm-linux_amd64.2.4.1.deb
sudo dpkg -i ./gcm-linux_amd64.2.4.1.deb
git-credential-manager configure
```

## Others

[git-credential-manager/docs/install.md (github.com)](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md)

If you trust it:

```
curl -L https://aka.ms/gcm/linux-install-source.sh | sh
git-credential-manager configure
```


## Use GPG files


- Ideally store your GPG key on a hardware device (e.g. yubikey)

Install `pass`:

```
sudo apt install -y pass gpg
```

Tell git to use it:
```
git config --global credential.credentialStore gpg
```
- [GPG / Pass Compatible files (github.com)](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/credstores.md#gpgpass-compatible-files)

## Headless/TTY-only sessions

If you are using the gpg credential store in a headless/TTY-only environment, you must ensure you have configured the GPG Agent (gpg-agent) with a suitable pin-entry program for the terminal such as pinentry-tty or pinentry-curses.

If you are connecting to your system via SSH, then the SSH_TTY variable should automatically be set. GCM will pass the value of SSH_TTY to GPG/GPG Agent as the TTY device to use for prompting for a passphrase.

If you are not connecting via SSH, or otherwise do not have the SSH_TTY environment variable set, you must set the GPG_TTY environment variable before running GCM. The easiest way to do this is by adding the following to your profile (~/.bashrc, ~/.profile etc):

```shell
export GPG_TTY=$(tty)
```

Note: Using /dev/tty does not appear to work here - you must use the real TTY device path, as returned by the tty utility.

