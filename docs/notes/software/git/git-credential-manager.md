# Git Credential Manager

Encrypt your tokens and avoid entering your github password onto less-trusted devices.

- [Clarify which account the prompt is for · Issue 1472 · git-ecosystemgit-credential-manager (github.com)](https://github.com/git-ecosystem/git-credential-manager/issues/1472)
    - [Git - Credential Storage (git-scm.com)](https://git-scm.com/book/en/v2/Git-Tools-Credential-Storage)

    ![](assets/Pasted%20image%2020231219170426.png)


## Problems

### Login prompt doesn't indicate which repo / server

**GitHub Issue**: [The tool should accommodate users with more than one account on a github. · Issue 1532 · git-ecosystemgit-credential-manager (github.com)](https://github.com/git-ecosystem/git-credential-manager/issues/1532)

## Commands

While the tool is used behind the scenes by other programs, there are a few commands you can use:

```shell
$ git-credential-manager github list
mbailey
```


## Install Git Credential Manager

### Debian

- [debian package (github.com)](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md#debian-package)

```
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.4.1/gcm-linux_amd64.2.4.1.deb
sudo apt install ./gcm-linux_amd64.2.4.1.deb
sudo dpkg -i ./gcm-linux_amd64.2.4.1.deb
git-credential-manager configure
```

### Other linux

[git-credential-manager/docs/install.md (github.com)](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md)

If you trust it:

```
curl -L https://aka.ms/gcm/linux-install-source.sh | sh
git-credential-manager configure
```

### Amazon Linux 2

- special trick for vscode-1.86+
- TODO - copy this in

## Configure

### credential.useHttpPath : Use different creds per repo

If you have different identities (personal, work, etc) you will need this:

```shell
git config --global credential.useHttpPath true
```

## credential.credentialStore : choose a backend

Select the type of credential store to use on supported platforms.

- [docs (github.com)](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/environment.md#GCM_CREDENTIAL_STORE)

Defaults:
- **Windows**: wincredman
- **macOS**:  keychain
- **Linux**: unset

| Value         | Credential Store                                                                                                 | Platforms             |
|---------------|------------------------------------------------------------------------------------------------------------------|-----------------------|
| wincredman    | Windows Credential Manager (not available over SSH).                                                             | Windows               |
| dpapi         | DPAPI protected files. Customize the DPAPI store location with credential.dpapiStorePath                         | Windows               |
| keychain      | macOS Keychain.                                                                                                  | macOS                 |
| secretservice | freedesktop.org Secret Service API via libsecret (requires a graphical interface to unlock secret collections). | Linux                 |
| gpg           | Use GPG to store encrypted files that are compatible with the pass (requires GPG and pass to initialize the store). | macOS, Linux          |
| cache         | Git's built-in credential cache.                                                                                 | macOS, Linux          |
| plaintext     | Store credentials in plaintext files (UNSECURE). Customize the plaintext store location with credential.plaintextStorePath. | Windows, macOS, Linux |

#### credential.credentialStore gpg

Ideally store your GPG key on a hardware device (e.g. yubikey)

- [GPG / Pass Compatible files (github.com)](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/credstores.md#gpgpass-compatible-files)

Install `pass`:

```
sudo apt install -y pass gpg
```

Tell git to use it:
```
git config --global credential.credentialStore gpg
```

##### Headless/TTY-only sessions

If you are using the gpg credential store in a headless/TTY-only environment, you must ensure you have configured the GPG Agent (gpg-agent) with a suitable pin-entry program for the terminal such as pinentry-tty or pinentry-curses.

If you are connecting to your system via SSH, then the SSH_TTY variable should automatically be set. GCM will pass the value of SSH_TTY to GPG/GPG Agent as the TTY device to use for prompting for a passphrase.

If you are not connecting via SSH, or otherwise do not have the SSH_TTY environment variable set, you must set the GPG_TTY environment variable before running GCM. The easiest way to do this is by adding the following to your profile (~/.bashrc, ~/.profile etc):

```shell
export GPG_TTY=$(tty)
```

Note: Using /dev/tty does not appear to work here - you must use the real TTY device path, as returned by the tty utility.

