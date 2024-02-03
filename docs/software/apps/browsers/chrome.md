# Google Chrome

I use Google Chrome for [Microsoft Teams](../../../saas/msteams.md) because video and screen sharing don't work with Firefox or Chromium.

- [Your browser is managed by your organization](Your%20browser%20is%20managed%20by%20your%20organization.md)

Install google-chrome on fedora-36:

    sudo dnf install fedora-workstation-repositories
    sudo dnf config-manager --set-enabled google-chrome
    sudo dnf install -y google-chrome-stable

