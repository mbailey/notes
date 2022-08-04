# Third Party Software

Things I install on my fedora workstations.

- [Third Party Software](#third-party-software)
  - [awscli](#awscli)
  - [bash-my-aws](#bash-my-aws)
  - [dbeaver-ce](#dbeaver-ce)
  - [dropbox](#dropbox)
  - [obs-studio](#obs-studio)
  - [obsidian](#obsidian)
  - [slack](#slack)
  - [vscode](#vscode)

## [awscli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

    wget -O awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
    unzip awscliv2.zip
    sudo ./aws/install

## [bash-my-aws](https://bash-my-aws.org/#installation)

    git clone https://github.com/bash-my-aws/bash-my-aws.git ${BMA_HOME:-$HOME/.bash-my-aws}
    # Update .bashrc if installing for the first time

## [dbeaver-ce](https://dbeaver.io/download/)

    wget https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm
    sudo dnf install dbeaver-ce-latest-stable.x86_64.rpm

## [obsidian](https://obsidian.md/download)

    obsidian_file=Obsidian-0.15.9.AppImage
    wget --directory-prefix $HOME/bin \
      https://github.com/obsidianmd/obsidian-releases/releases/latest/download/${obsidian_file}
    chmod +x ~/bin/${obsidian_file}
    ln -sf ${obsidian_file} ~/bin/obsidian

## [slack](https://slack.com/intl/en-au/downloads/linux)

    wget https://downloads.slack-edge.com/releases/linux/4.27.156/prod/x64/slack-4.27.156-0.1.fc21.x86_64.rpm

    sudo rpm -i slack-4.27.156-0.1.fc21.x86_64.rpm

## [vscode](https://code.visualstudio.com/docs/setup/linux)

    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

    dnf check-update
    sudo dnf install code

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
