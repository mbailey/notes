# Third Party Software

Things I install on my fedora workstations.

- [Third Party Software](#third-party-software)
    - firefox
        - [firefox plugins](#firefox-plugins)
    - [chrome](#chrome)
    - [obsidian](#obsidian)
    - [slack](#slack)
    - [vscode](#vscode)

    - [awscli](#awscli)
    - [bash-my-aws](#bash-my-aws)
    - [darkman](apps/browsers/plugins/darkman.md)
    - [syncthing](#syncthing)

    - [dbeaver-ce](#dbeaver-ce)
## [awscli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

```shell
sudo dnf install awscli2
```

## [bash-my-aws](https://bash-my-aws.org/#installation)

    git clone https://github.com/bash-my-aws/bash-my-aws.git ${BMA_HOME:-$HOME/.bash-my-aws}
    # Update .bashrc if installing for the first time

## [chrome](apps/browsers/chrome.md)

Only for [Microsoft Teams](../services/msteams.md).

## [dbeaver-ce](https://dbeaver.io/download/)

    wget https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm
    sudo dnf install dbeaver-ce-latest-stable.x86_64.rpm

## Mixxx

DJ Software

Requires [RPMFusion repo](https://rpmfusion.org/Configuration)

```shell
sudo dnf install -y mixxx
```

## Firefox plugins

Firefox is far and away my favourite web browser. These plugins make it even better.

*Installed by logging into firefox account in browser.*

  - [DarkReader](https://addons.mozilla.org/en-US/firefox/addon/darkreader/)
  - [MarkDownload](https://addons.mozilla.org/en-US/firefox/addon/markdownload/)
  - [Multi-Account Containers](https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers)

## [obsidian](https://obsidian.md/download)

Install (with GNOME launcher support) with YMMV script from forum.

<!-- markdown-link-check-disable-next-line -->
[`$ bin/obsidian-install.sh`](bin/obsidian-install.sh)

or:

    obsidian_file=Obsidian-0.15.9.AppImage
    wget --directory-prefix $HOME/bin \
      https://github.com/obsidianmd/obsidian-releases/releases/latest/download/${obsidian_file}
    chmod +x ~/bin/${obsidian_file}
    ln -sf ${obsidian_file} ~/bin/obsidian

## [slack](https://slack.com/intl/en-au/downloads/linux)

- [Download Slack for Linux (beta)  Slack (slack.com)](https://slack.com/intl/en-au/help/articles/212924728-Download-Slack-for-Linux--beta-#rhel-1)

## [syncthing](https://syncthing.net/)

- [README](apps/syncthing/README.md)

## [vscode](https://code.visualstudio.com/docs/setup/linux)

    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

    dnf check-update
    sudo dnf install code

- Enable settings sync (danger?)
    - Syncs extensions (and other things).
- Settings
    - window.titleBarStyle : custom # replace light titlebar with dark
    - telemetry.telemetryLevel = off # opt out of telemetry
- extensions
    - donjayamanne.python-extension-pack

<!--
---
**Maybe later**

## [dropbox](https://www.dropbox.com/install-linux)

    wget https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2020.03.04-1.fedora.x86_64.rpm
    sudo rpm -i nautilus-dropbox-2020.03.04-1.fedora.x86_64.rpm

    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd

    wget --directory-prefix ~/.local/bin https://www.dropbox.com/download?dl=packages/dropbox.py

## [obs-studio](https://flathub.org/apps/details/com.obsproject.Studio)

Setup Flatpak on Fedora ([ref](https://flatpak.org/setup/Fedora))

    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

Install obs-studio:

    sudo dnf install kmod-v4l2loopback
    wget https://dl.flathub.org/repo/appstream/com.obsproject.Studio.flatpakref
-->
