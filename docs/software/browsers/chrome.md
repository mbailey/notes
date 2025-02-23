# Google Chrome

I use Google Chrome for [Microsoft Teams](../../services/msteams.md) because video and screen sharing don't work with Firefox or Chromium.

- [Your browser is managed by your organization](Your%20browser%20is%20managed%20by%20your%20organization.md)

## Profiles


Open Chrome specified profile: 

```shell
google-chrome --profile-directory="$PROFILE_NAME"
```

Find your profile: 

1. Open chrome://version/ and look for 'Profile Path' field.


## Install

Install google-chrome on fedora-36:

    sudo dnf install fedora-workstation-repositories
    sudo dnf config-manager --set-enabled google-chrome
    sudo dnf install -y google-chrome-stable

