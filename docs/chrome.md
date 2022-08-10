# Google Chrome

I use Google Chrome for [Microsoft Teams](msteams.md) because video and screen sharing don't work with Firefox or Chromium.

Install google-chrome on fedora-36:

    sudo dnf install fedora-workstation-repositories
    sudo dnf config-manager --set-enabled google-chrome
    sudo dnf install google-chrome-stable
